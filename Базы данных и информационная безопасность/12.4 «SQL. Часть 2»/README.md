# 12.3  «SQL. Часть 1» - Абрамов Е. Э.

### Задание 1

SELECT 
    concat(staff.last_name, ' ', staff.first_name) as manager,
    city.city,
    COUNT(customer.customer_id) AS customer_count
FROM 
    staff
    INNER JOIN store ON staff.store_id = store.store_id 
    INNER JOIN customer ON store.store_id = customer.store_id
	INNER JOIN address ON staff.address_id = address.address_id
	inner join city on address.city_id = city.city_id 
GROUP BY 
    staff.staff_id, store.store_id
HAVING 
    COUNT(customer.customer_id) > 300;
    
![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.4%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%202%C2%BB/img/1.bmp)

### Задание 2

SELECT COUNT(*) 
FROM film 
WHERE length > (SELECT AVG(length) FROM film);

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.4%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%202%C2%BB/img/2.bmp)

### Задание 3

SELECT 
  DATE_FORMAT(payment_date, '%Y-%m') AS month, 
  COUNT(*) AS rentals_count, 
  SUM(amount) AS total_payments 
FROM payment 
GROUP BY month 
ORDER BY total_payments DESC 
LIMIT 1;

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%91%D0%B0%D0%B7%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D1%8C/12.4%20%C2%ABSQL.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%202%C2%BB/img/3.bmp)