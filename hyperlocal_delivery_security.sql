-- Remove old roles if they already exist
DROP ROLE IF EXISTS admin_user;
DROP ROLE IF EXISTS vendor_user;

-- Create login roles
CREATE ROLE admin_user
WITH LOGIN
PASSWORD 'Admin@2026';

CREATE ROLE vendor_user
WITH LOGIN
PASSWORD 'Vendor@2026';

-- Give full access to admin
GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE users
TO admin_user;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE orders
TO admin_user;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE orderitems
TO admin_user;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE payments
TO admin_user;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE addresses
TO admin_user;

GRANT SELECT, UPDATE
ON TABLE products
TO admin_user;

-- Vendor can manage inventory and view required data
GRANT SELECT
ON TABLE products
TO vendor_user;

GRANT SELECT, UPDATE
ON TABLE inventory
TO vendor_user;

GRANT SELECT
ON TABLE orders
TO vendor_user;

GRANT SELECT
ON TABLE reviews
TO vendor_user;

-- Example of removing a permission
REVOKE INSERT
ON TABLE users
FROM admin_user;

-- Check if roles were created
SELECT rolname
FROM pg_roles
WHERE rolname IN ('admin_user', 'vendor_user');

-- Display permissions assigned to each role
SELECT
    grantee,
    table_name,
    privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN ('admin_user', 'vendor_user')
ORDER BY grantee, table_name;