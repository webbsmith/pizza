CREATE SCHEMA pizza;
GRANT ALL PRIVILEGES ON pizza.* TO 'pizza'@'localhost'
IDENTIFIED BY 'piz009asdfasdfasdfGGGGGG';
CREATE TABLE pizza.address (
  id                         INT PRIMARY KEY AUTO_INCREMENT,
  house_number               VARCHAR(255),
  street                     VARCHAR(255),
  city                       VARCHAR(255),
  state                      VARCHAR(255),
  postal_code                VARCHAR(255),
  subdivision                VARCHAR(255),
  closest_major_intersection VARCHAR(255),
  delivery_notes             VARCHAR(2000)
);
CREATE TABLE pizza.customer (
  id           INT PRIMARY KEY AUTO_INCREMENT,
  first_name   VARCHAR(255),
  last_name    VARCHAR(255),
  phone_number VARCHAR(255),
  card_type    VARCHAR(255),
  address_id   INT,
  INDEX address_index (address_id),
  FOREIGN KEY (address_id) REFERENCES address (id)
    ON DELETE CASCADE
);
CREATE TABLE pizza.customer_order (
  id             INT PRIMARY KEY AUTO_INCREMENT,
  customer_id    INT,
  payment_method VARCHAR(255),
  amount         DECIMAL(19, 4),
  description    VARCHAR(2000),
  time           DATETIME,
  INDEX customer_index (customer_id),
  FOREIGN KEY (customer_id) REFERENCES customer (id)
);
CREATE TABLE pizza.customer_order_item (
  id             INT PRIMARY KEY AUTO_INCREMENT,
  customer_order_id INT,
  menu_item_id INT,
  quantity INT,
  INDEX customer_index (customer_id),
  FOREIGN KEY (customer_id) REFERENCES customer (id)
);
CREATE TABLE pizza.menu_items (
  id             INT PRIMARY KEY AUTO_INCREMENT,
  customer_id    INT,
  payment_method VARCHAR(255),
  amount         DECIMAL(19, 4),
  description    VARCHAR(2000),
  time           DATETIME,
  INDEX customer_index (customer_id),
  FOREIGN KEY (customer_id) REFERENCES customer (id)
);



INSERT INTO pizza.address (house_number, street, city, state, postal_code, subdivision, closest_major_intersection, delivery_notes)
VALUES
  ('55', 'Texas St. NE', 'Kennesaw', 'GA', '30144', 'Darby Downs', 'Frey Rd. and Busbee Pkwy.',
   'knock quietly (their baby might be napping)'),
  ('9', 'Main St. NW, Unit # 2', 'Kennesaw', 'GA', '30144', 'Kennesaw Commons', 'Church St. and Main St.',
   'there are four units, this one is on the second story, entrance on the side facing the road'),
  ('1702', 'Mulberry Dr', 'Kennesaw', 'GA', '30144', 'Mathis Retirement Community', 'Church St. and Cherokee St.',
   'blue house, only ring door bell once, customer sometimes takes a couple minutes to answer the door');

INSERT INTO pizza.customer (first_name, last_name, phone_number, card_type, address_id) VALUES
  ('Charlie', 'Smith', '(770) 823-0912', 'Visa', 1),
  ('Pat', 'Smith', '(770) 823-0913', 'Visa', 1),
  ('Chris', 'Peterson', '(770) 362-3218', 'Master Card', 2),
  ('Jo', 'Peterson', '(770) 823-3329', 'Master Card', 2),
  ('Robert', 'Po', '(770) 129-0912', 'None', 3);

INSERT INTO pizza.customer_order (customer_id, payment_method, amount, description, time) VALUES
  (1, 'Credit Card - Visa', 19.09, 'One large supreme pizza, and a 2 liter coke', NOW() - 3),
  (1, 'Credit Card - Visa', 34.12, 'One large supreme pizza, one medium pepperoni, and a 2 liter coke', NOW() - 2.5),
  (2, 'Credit Card - Visa', 19.09, 'One large supreme pizza, and a 2 liter coke', NOW() - 2.2),
  (3, 'Credit Card - Master Card', 3.02, 'One large sweet tea', NOW() - 2.0),
  (4, 'Credit Card - Master Card', 90.02, '10 large cheese pizza, one apple pie', NOW() - 2.0),
  (5, 'Cash', 9.19, '1 small pizza with only cheese, olives, anchovies, and NO marinara', NOW() - 1.0),
  (5, 'Cash', 9.19, '1 small pizza with only cheese, olives, anchovies, and NO marinara', NOW()),
  (5, 'Check', 9.19, '1 small pizza with only cheese, olives, anchovies, and NO marinara', NOW());