# Table Description

## Tables and description for Thrillophilia

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

### 3. Products

- product_id `(Primary Key, Auto Increment)`
- product_name
- product_description
- product_price
- product_type `(Activity, Tours, Rentals, StayCations)`
- product_images `(Array of images)`
- product_rating `(Average rating of the product)`
- is_refundable `(Boolean)`
- days `(Number of days)`
- nights `(Number of nights)`
- location `(City, State)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 4. Product Reviews

- review_id `(Primary Key, Auto Increment)`
- product_id `(Foreign Key)`
- user_id `(Foreign Key)`
- review_rating
- review_text
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 5. Product Bookings

- booking_id `(Primary Key, Auto Increment)`
- product_id `(Foreign Key)`
- user_id `(Foreign Key)`
- booking_date `(Date of booking)`
- booking_time `(Time of booking)`
- booking_status `(Pending, Confirmed, Cancelled)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 6. Product Cancellations

- cancellation_id `(Primary Key, Auto Increment)`
- booking_id `(Foreign Key)`
- cancellation_reason
- created_at `(Timestamp)`

### 7. Product Payments

- payment_id `(Primary Key, Auto Increment)`
- booking_id `(Foreign Key)`
- payment_amount
- payment_status `(Pending, Confirmed, Cancelled)`
- payment_method `(Credit Card, Debit Card, Net Banking, Wallets)`
- created_at `(Timestamp)`
- updated_at `(Timestamp)`

### 8. Product Refunds

- refund_id `(Primary Key, Auto Increment)`
- payment_id `(Foreign Key)`
- refund_amount
- refund_reason
- created_at `(Timestamp)`
- updated_at `(Timestamp)`
