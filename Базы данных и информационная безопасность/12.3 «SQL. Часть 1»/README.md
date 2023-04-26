# 12.3  «SQL. Часть 1» - Абрамов Е. Э.

### Задание 1

SELECT DISTINCT district
FROM address
WHERE district LIKE 'K%a' AND district NOT LIKE '% %';

district |
---------+
Kanagawa |
Kalmykia |
Kaduna   |
Karnataka|
Kütahya  |
Kerala   |
Kitaa    |

### Задание 2

SELECT CAST(payment_date AS DATE)
FROM payment
WHERE payment_date BETWEEN '2005-06-15' AND '2005-06-19'
  AND amount > 10.00;

CAST(payment_date AS DATE)|
--------------------------+
                2005-06-15|
                2005-06-15|
                2005-06-16|
                2005-06-17|
                2005-06-17|
                2005-06-17|
                2005-06-18|

### Задание 3

SELECT *
FROM rental
ORDER BY rental_date DESC
LIMIT 5;

rental_id|rental_date        |inventory_id|customer_id|return_date|staff_id|last_update        |
---------+-------------------+------------+-----------+-----------+--------+-------------------+
    11739|2006-02-14 15:16:03|        4568|        373|           |       2|2006-02-15 21:30:53|
    14616|2006-02-14 15:16:03|        4537|        532|           |       1|2006-02-15 21:30:53|
    11676|2006-02-14 15:16:03|        4496|        216|           |       2|2006-02-15 21:30:53|
    15966|2006-02-14 15:16:03|        4472|        374|           |       1|2006-02-15 21:30:53|
    13486|2006-02-14 15:16:03|        4460|        274|           |       1|2006-02-15 21:30:53|

### Задание 4

SELECT 
	REPLACE(LOWER(first_name), 'll', 'pp') as first_name, 
	LOWER(last_name) as last_name,
	active
FROM customer
WHERE active = 1
  AND (first_name = 'Kelly' OR first_name = 'Willie');

first_name|last_name|active|
----------+---------+------+
keppy     |torres   |     1|
wippie    |howell   |     1|
wippie    |markham  |     1|
keppy     |knott    |     1|

### Задание 5

SELECT 
    SUBSTRING_INDEX(email, '@', 1) AS email_username,
    SUBSTRING_INDEX(email, '@', -1) AS email_domain
FROM customer;

email_username       |email_domain      |
---------------------+------------------+
MARY.SMITH           |sakilacustomer.org|
PATRICIA.JOHNSON     |sakilacustomer.org|
LINDA.WILLIAMS       |sakilacustomer.org|
BARBARA.JONES        |sakilacustomer.org|
ELIZABETH.BROWN      |sakilacustomer.org|
JENNIFER.DAVIS       |sakilacustomer.org|
MARIA.MILLER         |sakilacustomer.org|
SUSAN.WILSON         |sakilacustomer.org|
MARGARET.MOORE       |sakilacustomer.org|
DOROTHY.TAYLOR       |sakilacustomer.org|
.....................|..................|

### Задание 6

SELECT 
    CONCAT(UCASE(LEFT(SUBSTRING_INDEX(email, '@', 1), 1)), 
    LCASE(SUBSTRING_INDEX(email, '@', 1)), '') AS email_username,
    CONCAT(UCASE(LEFT(TRIM(SUBSTRING_INDEX(email, '@', -1)), 1)), 
    LCASE(SUBSTRING(TRIM(SUBSTRING_INDEX(email, '@', -1)), 2)), '') AS email_domain
FROM customer;

email_username     |email_domain      |
-------------------+------------------+
Mmary.smith        |Sakilacustomer.org|
Ppatricia.johnson  |Sakilacustomer.org|
Llinda.williams    |Sakilacustomer.org|
Bbarbara.jones     |Sakilacustomer.org|
Eelizabeth.brown   |Sakilacustomer.org|
Jjennifer.davis    |Sakilacustomer.org|
Mmaria.miller      |Sakilacustomer.org|
Ssusan.wilson      |Sakilacustomer.org|
...................|..................|