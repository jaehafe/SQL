## View & HAVING & WITH ROLLUP

```sql
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
```

```sql
mysql> show tables;
+-------------------------+
| Tables_in_relationships |
+-------------------------+
| full_reviews            |
| reviewers               |
| reviews                 |
| series                  |
+-------------------------+
```

```sql
mysql> select * from full_reviews;
+----------------------+---------------+-----------+--------+------------+-----------+
| title                | released_year | genre     | rating | first_name | last_name |
+----------------------+---------------+-----------+--------+------------+-----------+
| Archer               |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Arrested Development |          2003 | Comedy    |    8.1 | Thomas     | Stoneman  |
| Bob's Burgers        |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bojack Horseman      |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Breaking Bad         |          2008 | Drama     |    9.5 | Thomas     | Stoneman  |
| Archer               |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Bojack Horseman      |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Breaking Bad         |          2008 | Drama     |    9.3 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    6.5 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.4 | Wyatt      | Skaggs    |
| Fargo                |          2014 | Drama     |    9.1 | Wyatt      | Skaggs    |
| Freaks and Geeks     |          1999 | Comedy    |    7.8 | Wyatt      | Skaggs    |
| General Hospital     |          1963 | Drama     |    5.5 | Wyatt      | Skaggs    |

```

```sql
create view ordered_series as select * from series order by released_year;
```

```sql
insert into ordered_series (title, released_year, genre)
values ('The Great', 2020, 'Comedy');
```

기존 테이블 덮어쓰기

```sql
create or replace view ordered_series as select * from series order by released_year desc;
```

```sql
+----+-----------------------+---------------+-----------+
| id | title                 | released_year | genre     |
+----+-----------------------+---------------+-----------+
| 14 | Stranger Things       |          2016 | Drama     |
|  4 | Bojack Horseman       |          2014 | Animation |
|  7 | Fargo                 |          2014 | Drama     |
| 10 | Halt and Catch Fire   |          2014 | Drama     |
|  3 | Bob's Burgers         |          2011 | Animation |
|  1 | Archer                |          2009 | Animation |
|  5 | Breaking Bad          |          2008 | Drama     |
| 12 | Pushing Daisies       |          2007 | Comedy    |
|  2 | Arrested Development  |          2003 | Comedy    |
|  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
| 11 | Malcolm In The Middle |          2000 | Comedy    |
|  8 | Freaks and Geeks      |          1999 | Comedy    |
| 13 | Seinfeld              |          1989 | Comedy    |
|  9 | General Hospital      |          1963 | Drama     |
+----+-----------------------+---------------+-----------+
```

```sql
alter view ordered_series as select * from series order by released_year;
```

```sql
DROP VIEW ordered_series;
```

### HAVING

```sql
SELECT title,AVG(rating), COUNT(rating) AS count FROM full_reviews
GROUP BY title HAVING COUNT(rating) > 1;
```

### WITH ROLLUP (분류된 걸 최종집계)

```sql
select title, avg(rating) from full_reviews group by title with rollup;
```

```sql
+----------------------+-------------+
| title                | avg(rating) |
+----------------------+-------------+
| Archer               |     8.12000 |
| Arrested Development |     8.08000 |
| Bob's Burgers        |     7.52000 |
| Bojack Horseman      |     7.94000 |
| Breaking Bad         |     9.36000 |
| Curb Your Enthusiasm |     8.12000 |
| Fargo                |     9.40000 |
| Freaks and Geeks     |     8.60000 |
| General Hospital     |     5.38000 |
| Halt and Catch Fire  |     9.90000 |
| Seinfeld             |     7.60000 |
| Stranger Things      |     8.76667 |
| NULL                 |     8.02553 |
+----------------------+-------------+
```

```sql
select title, count(rating)
	from full_reviews
	group by title with rollup;
```

```sql
+----------------------+---------------+
| title                | count(rating) |
+----------------------+---------------+
| Archer               |             5 |
| Arrested Development |             5 |
| Bob's Burgers        |             5 |
| Bojack Horseman      |             5 |
| Breaking Bad         |             5 |
| Curb Your Enthusiasm |             5 |
| Fargo                |             2 |
| Freaks and Geeks     |             4 |
| General Hospital     |             5 |
| Halt and Catch Fire  |             1 |
| Seinfeld             |             2 |
| Stranger Things      |             3 |
| NULL                 |            47 |
+----------------------+---------------+
```

```sql
select released_year, genre, first_name, avg(rating)
from full_reviews
group by released_year, genre, first_name with rollup;
```

```sql
select
from
where
grou by with rollup (그룹별 총계)
having (grou by 결과 필터링 조건)
```
