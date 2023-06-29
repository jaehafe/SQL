## 13. ManyToMany

```sql
create table series (
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100),
	released_year YEAR(4),
	genre VARCHAR(100)
);

create table reviews (
	id INT AUTO_INCREMENT PRIMARY KEY,
	rating DECIMAL(2, 1),
	series_id INT,
	reviewer_id INT,
	FOREIGN KEY (series_id) REFERENCES series(id),
	FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
);
```

### 1.

```sql
+----------------------+--------+
| title                | rating |
+----------------------+--------+
| Archer               |    8.0 |
| Archer               |    7.5 |
| Archer               |    8.5 |
| Archer               |    7.7 |
| Archer               |    8.9 |
| Arrested Development |    8.1 |
| Arrested Development |    6.0 |
| Arrested Development |    8.0 |
| Arrested Development |    8.4 |
| Arrested Development |    9.9 |
| Bob's Burgers        |    7.0 |
| Bob's Burgers        |    7.5 |
| Bob's Burgers        |    8.0 |
| Bob's Burgers        |    7.1 |
| Bob's Burgers        |    8.0 |
+----------------------+--------+
```

```sql
select title, rating
from series
left join reviews on series.id = reviews.series_id
;
```

### 2.

```sql
+----------------------+------------+
| title                | avg_rating |
+----------------------+------------+
| General Hospital     |    5.38000 |
| Bob's Burgers        |    7.52000 |
| Seinfeld             |    7.60000 |
| Bojack Horseman      |    7.94000 |
| Arrested Development |    8.08000 |
| Curb Your Enthusiasm |    8.12000 |
| Archer               |    8.12000 |
| Freaks and Geeks     |    8.60000 |
| Stranger Things      |    8.76667 |
| Breaking Bad         |    9.36000 |
| Fargo                |    9.40000 |
| Halt and Catch Fire  |    9.90000 |
+----------------------+------------+
```

```sql
select title, cast(avg(rating) as decimal(2, 1)) as avg_rating
from series
join reviews on series.id = reviews.series_id
group by series.id
order by avg_rating;
```

### 3.

```sql
+------------+-----------+--------+
| first_name | last_name | rating |
+------------+-----------+--------+
| Thomas     | Stoneman  |    8.0 |
| Thomas     | Stoneman  |    8.1 |
| Thomas     | Stoneman  |    7.0 |
| Thomas     | Stoneman  |    7.5 |
| Thomas     | Stoneman  |    9.5 |
| Wyatt      | Skaggs    |    7.5 |
| Wyatt      | Skaggs    |    7.6 |
| Wyatt      | Skaggs    |    9.3 |
| Wyatt      | Skaggs    |    6.5 |
| Wyatt      | Skaggs    |    8.4 |
| Wyatt      | Skaggs    |    9.1 |
| Wyatt      | Skaggs    |    7.8 |
| Wyatt      | Skaggs    |    5.5 |
| Wyatt      | Skaggs    |    8.5 |
| Kimbra     | Masters   |    8.5 |
| Kimbra     | Masters   |    8.0 |
| Kimbra     | Masters   |    7.1 |
| Kimbra     | Masters   |    7.8 |
| Kimbra     | Masters   |    9.0 |
| Kimbra     | Masters   |    7.8 |
+------------+-----------+--------+
```

```sql
select first_name, last_name, rating
from reviewers
join reviews on reviewers.id = reviews.reviewer_id;
```

### 4.

```sql
+-----------------------+
| unreviewed_series     |
+-----------------------+
| Malcolm In The Middle |
| Pushing Daisies       |
+-----------------------+
```

```sql
select title as unreviewd_series from series
left join reviews on series.id = reviews.series_id
where rating IS NULL;
```

### 5.

```sql
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |    7.86000 |
| Comedy    |    8.16250 |
| Drama     |    8.04375 |
+-----------+------------+
```

```sql
select genre, round(avg(rating), 2) as avg_rating
from series
left join reviews on series.id = series_id
group by genre;
```

### 6.

```sql
+------------+-----------+-------+-----+-----+---------+----------+
| first_name | last_name | COUNT | MIN | MAX | AVG     | STATUS   |
+------------+-----------+-------+-----+-----+---------+----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02000 | ACTIVE   |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80000 | ACTIVE   |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.98889 | ACTIVE   |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83000 | ACTIVE   |
| Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77000 | ACTIVE   |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25000 | ACTIVE   |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00000 | INACTIVE |
+------------+-----------+-------+-----+-----+---------+----------+
```

```sql
SELECT
  first_name, last_name,
  COUNT(rating) AS count,
  IFNULL(MIN(rating), 0) AS min,
  IFNULL(MAX(rating), 0) AS max,
  ROUND(IFNULL(AVG(rating), 0), 2) AS avg,
	CASE
		WHEN COUNT(rating) > 0 THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END AS status
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviewer_id
GROUP BY first_name, last_name;
```

### 7.

```sql
+----------------------+--------+-----------------+
| title                | rating | reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.0 | Thomas Stoneman |
| Archer               |    7.7 | Domingo Cortes  |
| Archer               |    8.5 | Kimbra Masters  |
| Archer               |    7.5 | Wyatt Skaggs    |
| Archer               |    8.9 | Colt Steele     |
| Arrested Development |    8.4 | Pinkie Petit    |
| Arrested Development |    9.9 | Colt Steele     |
| Arrested Development |    8.1 | Thomas Stoneman |
| Arrested Development |    6.0 | Domingo Cortes  |
| Arrested Development |    8.0 | Kimbra Masters  |
| Bob's Burgers        |    7.0 | Thomas Stoneman |
| Bob's Burgers        |    8.0 | Domingo Cortes  |
| Bob's Burgers        |    7.1 | Kimbra Masters  |
| Bob's Burgers        |    7.5 | Pinkie Petit    |
| Bob's Burgers        |    8.0 | Colt Steele     |
+----------------------+--------+-----------------+
```

```sql
select
	title, rating,
	concat(first_name, ' ', last_name) as reviwer
from
	reviews
inner join
	series on reviews.series_id = series.id
inner join
	reviewers on reviewer_id = reviewers.id
```

```sql
title,
	rating,
	concat(first_name, ' ', last_name) as reviewer
```
