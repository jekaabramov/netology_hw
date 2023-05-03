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
    
![]()

### Задание 2

SELECT COUNT(*) 
FROM film 
WHERE length > (SELECT AVG(length) FROM film);

![]()

### Задание 3

SELECT 
  DATE_FORMAT(payment_date, '%Y-%m') AS month, 
  COUNT(*) AS rentals_count, 
  SUM(amount) AS total_payments 
FROM payment 
GROUP BY month 
ORDER BY total_payments DESC 
LIMIT 1;

![]()