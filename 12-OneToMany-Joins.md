## 12. OneToMany & Joins

### 외래키

```sql
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');


INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

insert into orders (order_date, amount, customer_id)
values ('2016-06-06', 33.67,3);
```

### cross join

```sql
SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;


SELECT * FROM orders
WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');


SELECT * FROM customers, orders;
```

### inner join: 교집합

![스크린샷 2023-06-06 오후 7.00.00.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5b1920c6-74a4-4fcf-b75c-853ebe9f23d9/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-06-06_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_7.00.00.png)

- **`JOIN`**은 둘 이상의 테이블을 연결하여 관련 데이터를 결합하는 데 사용.
- **`ON`**은 **`JOIN`** 절과 함께 사용되며, 조인 조건을 지정. **`ON`** 다음에는 두 테이블 간의 관계를 나타내는 조인 조건이 나온다.

```sql
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;


SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON orders.customer_id = customers.id;
```

### left join

![스크린샷 2023-06-06 오후 7.00.45.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/54f47e1b-8059-4d5f-806d-cb53eda51628/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-06-06_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_7.00.45.png)

- 왼쪽 테이블의 한개의 레코드에 여러개의 오른쪽 테이블 레코드가 일치할 경우, 해당 왼쪽 레코드를 여러번 표시하게 된다.
- **`LEFT JOIN`**을 사용하면 **`customers`** 테이블의 모든 행을 포함한 결과가 반환하고, 매치되는 레코드가 오른쪽에 없으면 NULL을 표시한다.
- **`LEFT JOIN`**은 왼쪽 테이블 (**`customers`** 테이블)의 모든 행을 유지하면서 오른쪽 테이블 (**`orders`** 테이블)과 일치하는 행이 있는 경우에는 조인을 수행합니다. 일치하지 않는 경우에는 NULL 값을 반환합니다.

```sql
SELECT
    first_name, last_name, order_date, amount
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;


SELECT
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;

select
	first_name, last_name, sum(amount)
from customers
left join orders
	on customers.id = orders.customer_id
group by customers.id;

select
	first_name, last_name,
ifnull(sum(amount), 0) as total_spent
from customers
left join orders
	on customers.id = orders.customer_id
group by customers.id
order by total_spent;
```

### right join

```sql
select * from customers
right join orders
	on customers.id = orders.customer_id;

SELECT
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id;
```
