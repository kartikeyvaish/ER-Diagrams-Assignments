DROP TABLE IF EXISTS 
	users,
	products,
	categories,
	administrators,
	sub_categories,
	addresses,
	variants,
	carts,
	cart_items,
	wishlists,
	wishlist_items,
	orders,
	discounts,
	payments,
	refunds,
	order_items
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

CREATE TABLE categories (
	category_id bigserial NOT NULL PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE sub_categories (
	sub_category_id bigserial NOT NULL PRIMARY KEY,
	category_id bigserial NOT NULL REFERENCES categories ON DELETE CASCADE,
	name VARCHAR (50) NOT NULL,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE discounts (
	discount_id bigserial NOT NULL PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	description text NOT NULL,
	discount_type VARCHAR(50) NOT NULL DEFAULT 'Percentage',
	discount_value VARCHAR(50) NOT NULL,
	is_active boolean NOT NULL DEFAULT false,
	start_date timestamp with time zone NOT NULL DEFAULT NOW(),
	end_date timestamp with time zone NOT NULL,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE products (
	product_id bigserial NOT NULL PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	description text NOT NULL,
	brand VARCHAR (50) NOT NULL,
	category_id bigserial NOT NULL REFERENCES categories ON DELETE SET NULL,
	sub_category_id bigserial REFERENCES sub_categories ON DELETE SET NULL,
	discount_id bigserial REFERENCES discounts ON DELETE SET NULL,
	price money NOT NULL,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE variants (
	variant_id bigserial NOT NULL PRIMARY KEY,
	product_id bigserial NOT NULL REFERENCES products ON DELETE CASCADE,
	size VARCHAR (50),
	color VARCHAR (50),
	fit VARCHAR (50),
	stock numeric NOT NULL,
    covers_warranty boolean NOT NULL DEFAULT false,
    warranty_period_in_days numeric DEFAULT 0,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE addresses (
	address_id bigserial NOT NULL PRIMARY KEY,
	user_id bigserial NOT NULL REFERENCES users ON DELETE CASCADE,
	address_line_1 text NOT NULL,
	address_line_2 text,
	city VARCHAR(50) NOT NULL,
	state VARCHAR(50) NOT NULL,
	pincode numeric NOT NULL,
	country VARCHAR(50) NOT NULL,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE carts (
	cart_id bigserial NOT NULL PRIMARY KEY,
	user_id bigserial NOT NULL REFERENCES users ON DELETE CASCADE,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE cart_items (
	cart_item_id bigserial NOT NULL PRIMARY KEY,
	cart_id bigserial NOT NULL REFERENCES carts ON DELETE CASCADE,
	variant_id bigserial NOT NULL REFERENCES variants,
    quantity numeric NOT NULL,
	created_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE wishlists (
	wishlist_id bigserial NOT NULL PRIMARY KEY,
	user_id bigserial NOT NULL REFERENCES users ON DELETE CASCADE,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE wishlist_items (
	wishlist_item_id bigserial NOT NULL PRIMARY KEY,
	wishlist_id bigserial NOT NULL REFERENCES wishlists ON DELETE CASCADE,
	variant_id bigserial NOT NULL REFERENCES variants ON DELETE CASCADE,
	created_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE orders (
	order_id bigserial NOT NULL PRIMARY KEY,
	address_id bigserial NOT NULL REFERENCES addresses ON DELETE SET NULL,
	status VARCHAR(50) NOT NULL,
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE order_items (
	order_item_id bigserial NOT NULL PRIMARY KEY,
	order_id bigserial NOT NULL REFERENCES orders ON DELETE CASCADE,
	variant_id bigserial NOT NULL REFERENCES variants ON DELETE CASCADE,
    quantity numeric NOT NULL,
	total_price money NOT NULL
);

-------------------------------------------------------------

CREATE TABLE payments (
	payment_id bigserial NOT NULL PRIMARY KEY,
	order_id bigserial NOT NULL REFERENCES orders,
	payment_type VARCHAR(50) NOT NULL,
	payment_status VARCHAR(50),
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

-------------------------------------------------------------

CREATE TABLE refunds (
	refund_id bigserial NOT NULL PRIMARY KEY,
	payment_id bigserial NOT NULL REFERENCES payments,
	refund_status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
	created_at timestamp with time zone NOT NULL DEFAULT NOW(),
	updated_at timestamp with time zone NOT NULL DEFAULT NOW()
);

------------------------------------------------------------- 

