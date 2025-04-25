-- CREATING THE E-COMMERCE DATABASE
CREATE DATABASE  ecommerceDB;

-- CREATINGN THE NECESSARY TABLES FOR THE E-COMMERCE DATABASE..


USE eccomerceDB;

-- 1. *Create the brand table*

CREATE TABLE brand (
  brand_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);


-- 2. *Create the product table*

CREATE TABLE product (
  product_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  brand_id INT NOT NULL,
  base_price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);


-- 3. *Create the color table*

CREATE TABLE color (
  color_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);


-- 4. *Create the size_category table*

CREATE TABLE size_category (
  size_category_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);


-- 5. *Create the size_option table*

CREATE TABLE size_option (
  size_option_id INT PRIMARY KEY,
  size_category_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);


-- 6. *Create the product_variation table*

CREATE TABLE product_variation (
  variation_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  size_option_id INT NOT NULL,
  color_id INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id)
);


-- 7. *Create the product_item table*

CREATE TABLE product_item (
  product_item_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  variation_id INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);


-- 8. *Create the product_attribute table*

CREATE TABLE product_attribute (
  product_attribute_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  attribute_category_id INT NOT NULL,
  attribute_type_id INT NOT NULL,
  value VARCHAR(255) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- 9. *Create the attribute_category table*

CREATE TABLE attribute_category (
  attribute_category_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);


-- 10. *Create the attribute_type table*

CREATE TABLE attribute_type (
  attribute_type_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);


-- 11. *Create the product_image table*

CREATE TABLE product_image (
  product_image_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- 12. *Create the customer table*

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);


-- 13. *Create the orders table*

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


-- 14. *Create the order_items table*

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- 15. *Create the payments table*

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  payment_method VARCHAR(255) NOT NULL,
  payment_date DATE NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- 16. *Create the shipments table*

CREATE TABLE shipments (
  shipment_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  shipment_date DATE NOT NULL,
  tracking_number VARCHAR(255) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);



-- 17. *Create the reviews table*

CREATE TABLE reviews (
  review_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  customer_id INT NOT NULL,
  review_text VARCHAR(255) NOT NULL,
  rating INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


-- 18. *Create the wishlists table*

CREATE TABLE wishlists (
  wishlist_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  product_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- 19. *Create the carts table*

CREATE TABLE carts (
  cart_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- 20. *Create the discounts table*

CREATE TABLE discounts (
  discount_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  discount_type VARCHAR(255) NOT NULL,
  discount_value DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- 21. *Create the taxes table*

CREATE TABLE taxes (
  tax_id INT PRIMARY KEY,
  tax_rate DECIMAL(10, 2) NOT NULL,
  tax_region VARCHAR(255) NOT NULL
);


-- 22. *Create the shipping_rates table*

CREATE TABLE shipping_rates (
  shipping_rate_id INT PRIMARY KEY,
  shipping_rate DECIMAL(10, 2) NOT NULL,
  shipping_region VARCHAR(255) NOT NULL
);




