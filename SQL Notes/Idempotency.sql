--Creating a table
DROP TABLE IF EXISTS crypto.orders_practice;

CREATE TABLE crypto.orders_practice (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount NUMERIC(10,2)
);

--Inserting into a table

INSERT INTO crypto.orders_practice (
    order_id,
    customer_name,
    amount
)
VALUES (
    1001,
    'Brian',
    5000
);

--If there is conflict do not action
INSERT INTO crypto.orders_practice (
    order_id,
    customer_name,
    amount
)
VALUES (
    1001,
    'Brian',
    5000
)
ON CONFLICT(order_id)
DO NOTHING 
;

--Idempotency
--If there is conflict UPSERT
--Amount will be changed from 5,000 to 5,500

INSERT INTO crypto.orders_practice (
    order_id,
    customer_name,
    amount
)
VALUES (
    1001,
    'Brian',
    5500
)
ON CONFLICT (order_id)
DO UPDATE SET 
	customer_name=EXCLUDED.customer_name,
	amount= EXCLUDED.amount;


-- Adding another value
INSERT INTO crypto.orders_practice (
    order_id,
    customer_name,
    amount
)
VALUES (
    1002,
    'Alice',
    3200
)
ON CONFLICT (order_id)
DO UPDATE SET
    customer_name = EXCLUDED.customer_name,
    amount = EXCLUDED.amount;


SELECT *
FROM crypto.orders_practice;



























































