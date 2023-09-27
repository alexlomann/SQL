/*
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
*/

USE homework2;
CREATE TABLE `sales` (
    id INT NOT NULL AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO sales (order_date, amount)
VALUES
  ("2023-09-06",352),
  ("2023-09-07",311),
  ("2023-09-09",300),
  ("2023-09-11",315),
  ("2023-09-13",228),
  ("2023-09-15",223),
  ("2023-09-17",200),
  ("2023-10-19",287),
  ("2023-10-10",245),
  ("2023-10-11",124),
  ("2023-10-28",100),
  ("2023-10-21",14),
  ("2023-10-29",88);


/*
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
*/

SELECT id, order_date, amount,
CASE TRUE
    WHEN amount < 100 THEN 'менее 100'
    WHEN amount >= 100 AND amount <= 300 THEN '100-300'
    ELSE 'более 300'
END AS order_size
FROM sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
*/

CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    user_id INT(3) NOT NULL,
    summ DECIMAL(20, 2) NOT NULL,
    order_stat VARCHAR(45) NOT NULL,
    PRIMARY KEY (orderid)
);

INSERT INTO orders (user_id, summ, order_stat)
VALUES
  ("001",50.65,"OPEN"),
  ("003",33.34,"OPEN"),
  ("002",7.90,"CLOSED"),
  ("005",58.30,"CLOSED"),
  ("006",15.02,"CANCELLED"),
  ("666",28.46,"CLOSED"),
  ("131",23.70,"OPEN"),
  ("002",84.01,"OPEN"),
  ("003",29.08,"OPEN"),
  ("001",23.53,"OPEN"),
  ("666",58.08,"CLOSED"),
  ("005",58.88,"OPEN"),
  ("001",14.36,"CLOSED");
  
  SELECT * FROM orders;
  
SELECT order_id, order_stat,
CASE order_stat
    WHEN "OPEN" THEN 'Заказ открыт.'
    WHEN "CLOSED" THEN 'Заказ закрыт.'
    ELSE 'Отмена заказа.'
END AS order_sum
FROM orders;

/*
4. Чем NULL отличается от 0?
0 - это число. Null означает "нет значения". 
*/