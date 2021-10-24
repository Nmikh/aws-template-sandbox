CREATE DATABASE products_db;

CREATE TABLE fruits (
  product_id INT PRIMARY KEY,
  name VARCHAR(255),
  amount INT
);

INSERT INTO fruits VALUES (1, 'apple', 100);
INSERT INTO fruits VALUES (2, 'orange', 200);
INSERT INTO fruits VALUES (3, 'banana', 300);

SELECT * FROM fruits;