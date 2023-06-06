## 8. 선택사항 정교화

### distinct: 중복 제거

```sql
SELECT author_lname FROM books;

SELECT DISTINCT author_lname FROM books;

SELECT author_fname, author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;
```

### order by

```sql
SELECT * FROM books ORDER BY author_lname;

SELECT * FROM books ORDER BY author_lname DESC;

SELECT * FROM books ORDER BY released_year;
```

### limit

```sql
SELECT title FROM books LIMIT 3;

SELECT title FROM books LIMIT 1;

SELECT title FROM books LIMIT 10;

SELECT * FROM books LIMIT 1;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 1;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 14;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 0,5;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 0,3;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 1,3;

// 10번째 행부터 시작하여 1개의 행을 반환
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 10,1;

SELECT * FROM tbl LIMIT 95,18446744073709551615;

SELECT title FROM books LIMIT 5;

SELECT title FROM books LIMIT 5, 123219476457;

SELECT title FROM books LIMIT 5, 50;
```

### like

```sql
SELECT title, author_fname, author_lname, pages
FROM books
WHERE author_fname LIKE '%da%';

SELECT title, author_fname, author_lname, pages
FROM books
WHERE title LIKE '%:%';

// author_fname 4글자 반환
SELECT * FROM books
WHERE author_fname LIKE '____';

// a가 포함된 author_fname
SELECT * FROM books
WHERE author_fname LIKE '_a_';
```
