CREATE OR REPLACE VIEW vw_customer_order_summary AS
SELECT
    o.orderid,
    u.fullname AS "Customer Name",
    v.vendorname AS "Vendor Name",
    o.orderdate,
    o.totalamount,
    s.statusname
FROM orders o
JOIN users u
ON o.userid = u.userid
JOIN vendors v
ON o.vendorid = v.vendorid
JOIN deliverystatus ds
ON o.orderid = ds.orderid
JOIN status s
ON ds.statusid = s.statusid;

SELECT * FROM vw_customer_order_summary;

CREATE OR REPLACE VIEW vw_product_sales_summary AS
SELECT
    p.name AS "Product Name",
    SUM(oi.quantity) AS "Total Products Sold"
FROM orderitems oi
JOIN products p
ON oi.productid = p.productid
GROUP BY p.name;

SELECT * FROM vw_product_sales_summary;

CREATE INDEX idx_product_name_search
ON products(name);

SELECT *
FROM products
WHERE name ILIKE '%2%';

CREATE INDEX idx_order_product_lookup
ON orderitems(orderid, productid);

CREATE OR REPLACE FUNCTION reduce_stock_after_order()
RETURNS TRIGGER
AS $$
BEGIN

    UPDATE inventory
    SET quantityavailable = quantityavailable - NEW.quantity
    WHERE productid = NEW.productid;

    RETURN NEW;

END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trg_reduce_stock
AFTER INSERT
ON orderitems
FOR EACH ROW
EXECUTE FUNCTION reduce_stock_after_order();

SELECT *
FROM inventory
WHERE productid = 1;

INSERT INTO orderitems
(orderid, productid, quantity, price)
VALUES
(1,1,2,100);

SELECT *
FROM inventory
WHERE productid = 1;