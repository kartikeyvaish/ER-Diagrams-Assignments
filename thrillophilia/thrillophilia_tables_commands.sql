DROP TABLE IF EXISTS 
    users,
    products,
    administrators,
    product_reviews,
    product_bookings,
    product_cancellations,
    product_payments,
    product_refunds
CASCADE;

-------------------------------------------------------------

CREATE TABLE users (
	user_id bigserial NOT NULL PRIMARY KEY,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	phone text UNIQUE NOT NULL,
	password VARCHAR ( 255 ) NOT NULL,
	first_name VARCHAR ( 50 ) NOT NULL,
    last_name VARCHAR ( 50 ),
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
    updated_at timestamp with time zone NOT NULL DEFAULT NOW()
); 

-------------------------------------------------------------

CREATE TABLE administrators (
	user_id bigserial NOT NULL PRIMARY KEY,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	phone text UNIQUE NOT NULL,
	password VARCHAR ( 255 ) NOT NULL,
	first_name VARCHAR ( 50 ) NOT NULL,
    last_name VARCHAR ( 50 ),
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
    updated_at timestamp with time zone NOT NULL DEFAULT NOW()
); 

-------------------------------------------------------------

CREATE TABLE products (
    product_id bigserial NOT NULL PRIMARY KEY,
    product_name VARCHAR ( 255 ) NOT NULL,
    product_description VARCHAR ( 255 ) NOT NULL,
    product_price VARCHAR ( 255 ) NOT NULL,
    product_image VARCHAR ( 255 ) NOT NULL,
    product_type VARCHAR ( 255 ) NOT NULL DEFAULT 'activity',
    is_refundable BOOLEAN NOT NULL DEFAULT TRUE,
    total_days VARCHAR ( 255 ) NOT NULL,
    total_nights VARCHAR ( 255 ) NOT NULL,
    location VARCHAR ( 255 ) NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT NOW(),
    updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE product_reviews (
    review_id bigserial NOT NULL PRIMARY KEY,
    product_id bigserial NOT NULL REFERENCES products,
    user_id bigserial NOT NULL REFERENCES users,
    review_rating VARCHAR ( 255 ) NOT NULL,
    review_text VARCHAR ( 255 ) NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT NOW(),
    updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE product_bookings (
    booking_id bigserial NOT NULL PRIMARY KEY,
    product_id bigserial NOT NULL REFERENCES products,
    user_id bigserial NOT NULL REFERENCES users,
    booking_date timestamp with time zone NOT NULL DEFAULT NOW(),
    booking_status VARCHAR ( 255 ) NOT NULL DEFAULT 'pending',
    created_at timestamp with time zone NOT NULL DEFAULT NOW(),
    updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE product_cancellations (
    cancellation_id bigserial NOT NULL PRIMARY KEY,
    booking_id bigserial NOT NULL REFERENCES product_bookings,
    created_at timestamp with time zone NOT NULL DEFAULT NOW(),
    updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE product_payments (
    payment_id bigserial NOT NULL PRIMARY KEY,
    booking_id bigserial NOT NULL REFERENCES product_bookings,
    payment_status VARCHAR ( 255 ) NOT NULL DEFAULT 'pending',
    payment_amount VARCHAR ( 255 ) NOT NULL,
    payment_method VARCHAR ( 255 ) NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT NOW(),
    updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE product_refunds (
    refund_id bigserial NOT NULL PRIMARY KEY,
    payment_id bigserial NOT NULL REFERENCES product_payments,
    refund_status VARCHAR ( 255 ) NOT NULL DEFAULT 'pending',
    refund_amount VARCHAR ( 255 ) NOT NULL, 
    created_at timestamp with time zone NOT NULL DEFAULT NOW(),
    updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------