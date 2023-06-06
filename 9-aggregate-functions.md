## 9. 집계함수

### count

```sql
SELECT COUNT(*) FROM books;

SELECT COUNT(author_lname) FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;
```

### group by

```sql
SELECT author_lname, COUNT(*)
FROM books
GROUP BY author_lname;

SELECT
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;
```

### sub query

```sql
SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT MIN(released_year) FROM books;

SELECT title, released_year FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);
```

### min max, group by

```sql
SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

SELECT
	author_lname,
	MAX(released_year),
	MIN(released_year)
FROM books
GROUP BY author_lname;

SELECT
	author_lname,
	COUNT(*) as books_written,
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release,
  MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;


SELECT
	author_lname,
  author_fname,
	COUNT(*) as books_written,
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;
```

```sql
select
	released_year,
	count(*),
	sum(stock_quantity),
	avg(released_year) as average_release,
	author_fname,
	author_lname,
	concat(author_fname, ' ', author_lname) as author_fullname,
	max(pages)
from books
group by
	released_year,
	author_fname,
	author_lname,
	pages;

select
	concat(author_fname, ' ', author_lname) as author_fullname,
from books
where pages = (select max(pages) from books);

```

```sql
SELECT title, released_year FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);
```

```sql
select
	released_year as year,
	count(*) as '# books',
	avg(pages) as 'avg pages'
from books
group by released_year
order by year asc;
```
