# Hyperlocal Delivery System (PostgreSQL)

This project is a PostgreSQL implementation of a hyperlocal delivery database inspired by apps like Zepto and Blinkit. It demonstrates database design, normalization, SQL queries, views, indexes, triggers, role-based access control, and a simple notification module.

## Features

- Normalized relational database design
- 13 interconnected tables
- ER Diagram
- Sample data for testing
- Analytical SQL queries
- Views for reporting
- Indexes for query optimization
- Trigger for automatic inventory updates
- Role-based access control
- Notification module

## Database Tables

- Users
- Addresses
- Vendors
- Delivery Partners
- Product Categories
- Products
- Inventory
- Orders
- Order Items
- Payments
- Reviews
- Status
- Delivery Status

## Project Files

| File | Description |
|------|-------------|
| `hyperlocal_delivery_schema.sql` | Database schema and table creation |
| `hyperlocal_delivery_queries.sql` | SQL queries for data analysis and reporting |
| `hyperlocal_delivery_features.sql` | Views, indexes and trigger implementation |
| `hyperlocal_delivery_security.sql` | Role-based access control and permissions |
| `hyperlocal_delivery_notifications.sql` | Notification module |
| `ER diagram for Hyperlocal Delivery System.png` | ER Diagram |
| `ER diag script.pgerd` | Editable ERD file |

## Software Used

- PostgreSQL 18
- pgAdmin 4

## How to Run

## How to Run

1. Open **pgAdmin 4** and create a new database (for example, `hyperlocal_delivery_db`).

2. Open the Query Tool and run `hyperlocal_delivery_schema.sql` to create all the tables.

3. After the tables are created, run the remaining SQL files one by one:
   - `hyperlocal_delivery_queries.sql`
   - `hyperlocal_delivery_features.sql`
   - `hyperlocal_delivery_security.sql`
   - `hyperlocal_delivery_notifications.sql`

4. Open the ER diagram image (`ER diagram for Hyperlocal Delivery System.png`) to view the database structure.

5. Once all the scripts have been executed successfully, the project is ready to use.

## Author

Jasmit Kaur Mukhtiar
