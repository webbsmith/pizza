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
  notes          VARCHAR(2000),
  time           DATETIME,
  INDEX customer_index (customer_id),
  FOREIGN KEY (customer_id) REFERENCES customer (id)
);

CREATE TABLE pizza.menu_item (
  id     INT PRIMARY KEY AUTO_INCREMENT,
  name   VARCHAR(255),
  amount DECIMAL(19, 4)
);
CREATE TABLE pizza.menu_add_on (
  id     INT PRIMARY KEY AUTO_INCREMENT,
  name   VARCHAR(255),
  amount DECIMAL(19, 4)
);

CREATE TABLE pizza.menu_item_available_add_on (
  id             INT PRIMARY KEY AUTO_INCREMENT,
  menu_item_id   INT,
  menu_add_on_id INT,
  INDEX menu_item_index (menu_item_id),
  INDEX menu_add_on_index (menu_add_on_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_item (id),
  FOREIGN KEY (menu_add_on_id) REFERENCES menu_add_on (id)
);

CREATE TABLE pizza.order_item (
  id           INT PRIMARY KEY AUTO_INCREMENT,
  menu_item_id INT,
  quantity     INT,
  INDEX menu_item_index (menu_item_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_item (id)
);

CREATE TABLE pizza.order_item_add_on (
  id             INT PRIMARY KEY AUTO_INCREMENT,
  order_item_id  INT,
  menu_add_on_id INT,
  INDEX order_item (order_item_id),
  INDEX menu_add_on_index (menu_add_on_id),
  FOREIGN KEY (order_item_id) REFERENCES order_item (id),
  FOREIGN KEY (menu_add_on_id) REFERENCES menu_add_on (id)
);

CREATE TABLE pizza.customer_order_item (
  id                INT PRIMARY KEY AUTO_INCREMENT,
  customer_order_id INT,
  order_item_id     INT,
  INDEX customer_order_index (customer_order_id),
  INDEX order_item_index (order_item_id),
  FOREIGN KEY (customer_order_id) REFERENCES customer_order (id),
  FOREIGN KEY (order_item_id) REFERENCES order_item (id)
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

INSERT INTO pizza.customer_order (customer_id, payment_method, amount, notes, time) VALUES
  (1, 'Credit Card - Visa', 19.09, 'One large supreme pizza, and a 2 liter coke', NOW() - 24 * 3.0),
  (1, 'Credit Card - Visa', 34.12, 'One large supreme pizza, one medium pepperoni, and a 2 liter coke',
   NOW() - 24 * 3.0 + 1.0),
  (2, 'Credit Card - Visa', 19.09, 'One large supreme pizza, and a 2 liter coke', NOW() - 24 * 3.0 + 1.0),
  (3, 'Credit Card - Master Card', 3.02, 'One large sweet tea', NOW() - 24 * 2.0 + 1.0),
  (4, 'Credit Card - Master Card', 90.02, '10 large cheese pizza, one apple pie', now() - 24 * 1.9 + 1.0),
  (5, 'Cash', 9.19, '1 small pizza with only cheese, olives, anchovies, and NO marinara', NOW() - 24 * 1.9 + 1.0),
  (5, 'Cash', 9.19, '1 small pizza with only cheese, olives, anchovies, and NO marinara', NOW() - 24 + 1.0),
  (5, 'Check', 9.19, '1 small pizza with only cheese, olives, anchovies, and NO marinara', NOW() - 24 + 3.0);

INSERT INTO pizza.menu_item (name, amount) VALUES
  ('Pizza - Small', 8.50),
  ('Pizza - Medium', 12.50),
  ('Pizza - Large', 16.50),
  ('Thin Crust Pizza - Small', 7.50),
  ('Thin Crust Pizza - Medium', 11.50),
  ('Thin Crust Pizza - Large', 15.50),
  ('Deep Dish Pizza - Small', 10.00),
  ('Deep Dish Pizza - Medium', 14.00),
  ('Deep Dish Pizza - Large', 18.00),
  ('Deep Dish Pizza - Large', 18.00),
  ('Salad', 5.00),
  ('Soda', 2.00),
  ('Water', 0.00),
  ('Beer', 4.00),
  ('Wine', 5.00),
  ('Slice of Apple Pie', 3.00),
  ('Peanut Butter Brownie', 3.00);

INSERT INTO pizza.menu_add_on (name, amount) VALUES
  ('Pepperoni', 1.00),
  ('Anchovies', 1.00),
  ('Extra Cheese', 1.00),
  ('Meatballs', 2.00),
  ('Onions', 1.00),
  ('Italian Sausage', 2.00),
  ('Black Olives', 1.00),
  ('Green Olives', 1.00),
  ('Hot Peppers', 1.00),
  ('Feta Cheese', 1.00),
  ('Fresh Spinach', 1.00),
  ('Ham', 1.00),
  ('Pineapple', 1.00),
  ('Tomatoes', 1.00),
  ('Ricotta Cheese', 1.00),
  ('No Marinara', 0.00),
  ('Gluten Free', 3.00),
  ('Ranch Dressing', 0.00),
  ('Italian Dressing', 0.00),
  ('Oil and Vinegar Dressing', 0.00),
  ('French Dressing', 0.00),
  ('Ice Cream', 2.00),
  ('Artisan Soda', 2.00),
  ('Premium Beer', 3.00),
  ('Premium Wine', 4.00);