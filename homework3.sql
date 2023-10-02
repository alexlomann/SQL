CREATE DATABASE homework3;
USE homework3;

  CREATE TABLE Orders (
  idOrders int PRIMARY KEY AUTO_INCREMENT,
  ordersName varchar(50) NOT NULL,
  ordersPrice int NOT NULL,
  dataOrder date NOT NULL,
  recipient varchar (30) NOT NULL,
  city varchar (40)
  );
  
# 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT dataOrder, SUM(ordersPrice) as sumSales
FROM Orders
WHERE dataOrder = '2016-01-01';

# 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT COUNT(DISTINCT city) as nnull
FROM Orders;

# 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT MIN(ordersPrice) as min,recipient
FROM Orders
GROUP BY recipient;

# 4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. Используется оператор "LIKE"
SELECT recipient
FROM Orders
WHERE recipient LIKE 'Г%'
ORDER BY recipient;

# 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
SELECT city, COUNT(city) AS rating
FROM Orders
GROUP BY city
HAVING rating > 0;

# Задание 2.

create table starwarsspec (
	id int primary key auto_increment,
    name varchar (20) not null,
    surname varchar (20) not null,
    speciality varchar (20) not null,
    seniority int not null,
    salary int not null,
    age int not null
);

insert starwarsspec( name, surname, speciality, seniority, salary, age)
values
	('Obi-Wan', 'Kenobi', 'Jedi-master', 40, 100000, 30),
    ('Gial', 'Ackbar', 'Jedi-master', 8, 70000, 30),
    ('Jar Jar', 'Binks', 'Padawan', 2, 70000, 125),
    ('Mace', 'Windu', 'Jedi-master', 12, 60000, 45),
    ('Nute', 'Gunray', 'Jedi', 40, 30000, 59),
    ('Jan', 'Dodonna', 'Padawan', 20, 25000, 40),
    ('Aurra', 'Sing', 'Jedi', 10, 20000, 35);


select * from starwarsspec;

-- 1.Отсортируйте поле “сумма” (salary) в порядке убывания и возрастания
select *
from starwarsspec
order by salary;

select *
from starwarsspec
order by salary desc;

-- 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (salary)
select *
from starwarsspec
order by salary desc
limit 5;

-- 3. Выполните группировку всех сотрудников по специальности “Jedi”, зарплата которых превышает 20000
select speciality, salary
from starwarsspec
where speciality='Jedi' and salary > 20000;

