CREATE TABLE Customer (
                          customer_id INT PRIMARY KEY,
                          name VARCHAR(100),
                          phone VARCHAR(13),
                          address VARCHAR(100)
);

CREATE TABLE Restaurant (
                            restaurant_id INT PRIMARY KEY,
                            name VARCHAR(100),
                            phone VARCHAR(13),
                            address VARCHAR(100)
);

CREATE TABLE Orders (
                        order_id INT PRIMARY KEY,
                        order_date TIMESTAMP,
                        total NUMERIC,
                        customer_id INT,
                        restaurant_id INT,
                        FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
                        FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

CREATE TABLE Delivery (
                          delivery_id INT PRIMARY KEY,
                          order_id    INT,
                          driver_name VARCHAR(100),
                          status      INT,
                          FOREIGN KEY (order_id) REFERENCES Orders (order_id)
);

INSERT INTO Customer (customer_id, name, phone, address)
VALUES (1, 'Alice', '010-1111-2222', '충주'),
       (2, '김수민', '010-2222-3333', '청주');
INSERT INTO Restaurant (restaurant_id, name, phone, address)
VALUES (1, 'Pizza Place', '010-1234-5678', '세종'),
       (2, '김밥천국', '063-9876-5432', '전주');
INSERT INTO Orders (order_id, order_date, total, customer_id, restaurant_id)
VALUES (1, '2023-01-01 12:00:00', 24000, 1, 1),
       (2, '2023-01-02 13:00:00', 8000, 2, 2);
INSERT INTO Delivery (delivery_id, order_id, driver_name, status)
VALUES (1, 2, '지석준', 1), -- 0: 받았다, 1: 조리하다, 2: 배달중, 3: 배달완료, 4: 취소
       (2, 1, '송지현', 3);

-- DB 쿼리
SELECT * FROM Orders;
SELECT * FROM Orders ORDER BY total DESC;
SELECT * FROM Orders WHERE total >= 10000;
SELECT * FROM Delivery WHERE status = 3;