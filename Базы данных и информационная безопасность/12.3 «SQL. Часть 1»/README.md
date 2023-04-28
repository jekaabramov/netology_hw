# 12.3  «SQL. Часть 1» - Абрамов Е. Э.

### Задание 1

SELECT DISTINCT district
FROM address
WHERE district LIKE 'K%a' AND district NOT LIKE '% %';

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.3%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201%C2%BB/img/1.jpg)

### Задание 2

SELECT amount, payment_date
FROM payment
WHERE CAST(payment_date AS DATE) BETWEEN '2005-06-15' AND '2005-06-18' 
	AND amount > 10.00;

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.3%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201%C2%BB/img/2.jpg)

### Задание 3

SELECT *
FROM rental
ORDER BY rental_date DESC
LIMIT 5;

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.3%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201%C2%BB/img/3.jpg)

### Задание 4

SELECT 
	REPLACE(LOWER(first_name), 'll', 'pp') as first_name, 
	LOWER(last_name) as last_name,
	active
FROM customer
WHERE active = 1
  AND (first_name = 'Kelly' OR first_name = 'Willie');

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.3%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201%C2%BB/img/4.jpg)

### Задание 5

SELECT 
    SUBSTRING_INDEX(email, '@', 1) AS email_username,
    SUBSTRING_INDEX(email, '@', -1) AS email_domain
FROM customer;

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.3%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201%C2%BB/img/5.jpg)

### Задание 6

SELECT 
    CONCAT(UCASE(LEFT(SUBSTRING_INDEX(email, '@', 1), 1)), 
    LCASE(SUBSTRING_INDEX(email, '@', 1)), '') AS email_username,
    CONCAT(UCASE(LEFT(TRIM(SUBSTRING_INDEX(email, '@', -1)), 1)), 
    LCASE(SUBSTRING(TRIM(SUBSTRING_INDEX(email, '@', -1)), 2)), '') AS email_domain
FROM customer;

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.3%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201%C2%BB/img/6.jpg)