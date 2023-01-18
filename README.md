# Table Description

## Tables and description for E-commerce platform

### 1. Users

- user_id `(Primary Key, Auto Increment)`
- email `(Unique Key)`
- phone `(Unique Key)`
- password `(Hashed, salted)`
- first_name
- last_name
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 2. Administrator

- admin_id `(Primary Key, Auto Increment)`
- email `(Unique Key)`
- phone `(Unique Key)`
- password `(Hashed, salted)`
- first_name
- last_name
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 3. Categories

- category_id `(Primary Key, Auto Increment)`
- name
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 4. Sub Categories

- sub_category_id `(Primary Key, Auto Increment)`
- category_id `(Foreign Key, References category_id in categories table)`
- name
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 5. Discounts

- discount_id `(Primary Key, Auto Increment)`
- name
- description
- discount_type `(Percentage, Flat)`
- discount_value
- start_date `(Timestamp)`
- end_date `(Timestamp)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`
- is_active `(Boolean)`

### 6. Products

- product_id `(Primary Key, Auto Increment)`
- name
- brand
- category_id `(Foreign Key, References category_id in categories table)`
- sub_category_id `(Foreign Key, References sub_category_id in sub_categories table)`
- discount_id `(Foreign Key, References discount_id in discounts table)`
- description
- price
- image
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 7. Variant

- variant_id `(Primary Key, Auto Increment)`
- product_id `(Foreign Key, References product_id in products table)`
- size
- color
- fit
- stock
- covers_warranty
- warranty_period_in_days
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 8. Addresses

- address_id `(Primary Key, Auto Increment)`
- user_id `(Foreign Key, References user_id in customers table)`
- address_line_1
- address_line_2
- city
- state
- zip
- country
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 9. Cart

- cart_id `(Primary Key, Auto Increment)`
- user_id `(Foreign Key, References user_id in customers table)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 10. Cart Items

- cart_item_id `(Primary Key, Auto Increment)`
- cart_id `(Foreign Key, References cart_id in cart table)`
- variant_id `(Foreign Key, References variant_id in variants table)`
- quantity
- created_at `(Timestamp)`

### 11. Wishlist

- wishlist_id `(Primary Key, Auto Increment)`
- user_id `(Foreign Key, References user_id in customers table)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 12. Wishlist Items

- wishlist_item_id `(Primary Key, Auto Increment)`
- wishlist_id `(Foreign Key, References wishlist_id in wishlist table)`
- variant_id `(Foreign Key, References variant_id in variants table)`
- created_at `(Timestamp)`

### 13. Orders

- order_id `(Primary Key, Auto Increment)`
- user_id `(Foreign Key, References user_id in customers table)`
- address_id `(Foreign Key, References address_id in addresses table)`
- status `(Pending, Shipped, Delivered, Cancelled)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 14. Order Items

- order_item_id `(Primary Key, Auto Increment)`
- order_id `(Foreign Key, References order_id in orders table)`
- variant_id `(Foreign Key, References variant_id in variants table)`
- quantity
- total_price

### 15. Payments

- payment_id `(Primary Key, Auto Increment)`
- order_id `(Foreign Key, References order_id in orders table)`
- payment_type `(Credit Card, Debit Card, Net Banking, Wallet)`
- payment_status `(Success, Failed)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 16. Refunds

- refund_id `(Primary Key, Auto Increment)`
- order_id `(Foreign Key, References order_id in orders table)`
- refund_status `(Pending, Approved, Rejected)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`
