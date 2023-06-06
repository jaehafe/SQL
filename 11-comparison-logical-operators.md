## 논리 연산자

### Not Equal

```sql
SELECT * FROM books
WHERE released_year != 2017;
```

### Not Like

```sql
SELECT * FROM books
WHERE title NOT LIKE '%e%';
```

### Greater Than

```sql
SELECT * FROM books
WHERE released_year > 2005;

SELECT * FROM books
WHERE pages > 500;
```

### Less Than Or Equal To

```sql
SELECT * FROM books
WHERE pages < 200;

SELECT * FROM books
WHERE released_year < 2000;

SELECT * FROM books
WHERE released_year <= 1985;
```

### AND

```sql
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';

SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';
```

### OR

```sql
SELECT title, pages FROM books
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;

SELECT title, author_lname FROM books
WHERE author_lname='Eggers' AND
released_year > 2010;

SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;


SELECT title, pages FROM books
WHERE pages < 200
OR title LIKE '%stories%';
```

### between

```sql
SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;

SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;
```

### In

'Author1', 'Author2', 'Author3' 세 명의 작가 중 하나로 일치하는 작가를 가진 책의 제목과 작가를 선택

```sql
SELECT title, author
FROM books
WHERE author IN ('Author1', 'Author2', 'Author3');
```

### case

```sql
SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit'
END AS genre
FROM books;


SELECT
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;


SELECT
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
```
