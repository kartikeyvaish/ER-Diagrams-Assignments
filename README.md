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

  There can be many categories and each category can have many sub categories.
  For Example: Laptops can be a category and sub categories can be Gaming Laptops, Business Laptops, etc.

### 4. Sub Categories

- sub_category_id `(Primary Key, Auto Increment)`
- category_id `(Foreign Key, References category_id in categories table)`
- name
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

  It gets deleted when the parent category is deleted. (CASCADE ON DELETE)

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

  Discounts can be applied to variants of products.
  For example: If a product has 3 variants, then the discount can be applied to all 3 variants or to a specific variant.

### 6. Products

- product_id `(Primary Key, Auto Increment)`
- name
- brand
- category_id `(Foreign Key, References category_id in categories table)`
- sub_category_id `(Foreign Key, References sub_category_id in sub_categories table)`
- description
- price
- image
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 7. Variant

- variant_id `(Primary Key, Auto Increment)`
- product_id `(Foreign Key, References product_id in products table)`
- discount_id `(Foreign Key, References discount_id in discounts table)`
- size
- color
- fit
- stock
- covers_warranty
- warranty_period_in_days
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

  Variants are the different sizes, colors, fits, etc of a product.
  For example: A T-Shirt can have different sizes, colors, fits, etc. So, each of these different sizes, colors, fits, etc are variants of the product.

  It gets deleted when the product is deleted. (CASCADE ON DELETE)

### 8. Addresses

- address_id `(Primary Key, Auto Increment)`
- user_id `(Foreign Key, References user_id in customers table)`
- name
- address_line_1
- address_line_2
- city
- state
- zip
- country
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

  A user can have multiple address.
  For example: A user can have a home address and a work address.

  It gets deleted when the user is deleted. (CASCADE ON DELETE)

### 9. Cart

- cart_id `(Primary Key, Auto Increment)`
- user_id `(Foreign Key, References user_id in customers table)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

  A user can have only one cart.

  It gets deleted when the user is deleted. (CASCADE ON DELETE)

### 10. Cart Items

- cart_item_id `(Primary Key, Auto Increment)`
- cart_id `(Foreign Key, References cart_id in cart table)`
- variant_id `(Foreign Key, References variant_id in variants table)`
- quantity
- created_at `(Timestamp)`

  It gets deleted when the cart is deleted. (CASCADE ON DELETE)

### 11. Wishlist

- wishlist_id `(Primary Key, Auto Increment)`
- user_id `(Foreign Key, References user_id in customers table)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

  A user can have only one wishlist.

  It gets deleted when the user is deleted. (CASCADE ON DELETE)

### 12. Wishlist Items

- wishlist_item_id `(Primary Key, Auto Increment)`
- wishlist_id `(Foreign Key, References wishlist_id in wishlist table)`
- variant_id `(Foreign Key, References variant_id in variants table)`
- created_at `(Timestamp)`

  It gets deleted when the wishlist is deleted. (CASCADE ON DELETE)

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

  It gets deleted when the order is deleted. (CASCADE ON DELETE)

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
