## 7. 문자열 함수

source book_data.sql

```jsx
CREATE TABLE books
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
```

### concat 다루기

```sql
select author_fname as first, author_lname as last,
concat(author_fname, ' ', author_lname) as full from books;
```

![스크린샷 2023-06-06 오전 12.56.02.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/57e013c6-992a-4c99-9912-818651429dcf/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-06-06_%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB_12.56.02.png)

**‘-’ 기준으로 합치기**

```sql
select concat_ws(' - ', title, author_fname, author_lname) from books;
```

![스크린샷 2023-06-06 오전 1.20.08.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a58ae04d-a588-45e7-ba71-e1ef5f4fb1e2/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-06-06_%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB_1.20.08.png)

### substring

```sql
SELECT SUBSTRING('Hello World', 1, 4); // 1부터 4까지 Hell

SELECT SUBSTRING('Hello World', 7); // W부터 끝까지

SELECT SUBSTRING('Hello World', -3); // rld 끝에서 3

// 둘이 같음
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;
```

```sql
select concat (substring(title, 1, 10), '...') from books;
```

![스크린샷 2023-06-06 오전 1.29.58.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e533696b-2b95-433a-b90d-86cebeb4f751/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-06-06_%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB_1.29.58.png)

### replace

```sql
SELECT REPLACE('Hello World', 'Hell', '%$#@');

SELECT REPLACE('Hello World', 'l', '7');

SELECT REPLACE('Hello World', 'o', '0');

SELECT REPLACE('HellO World', 'o', '*');

SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');

SELECT REPLACE(title, 'e ', '3') FROM books;

SELECT REPLACE(title, ' ', '-') FROM books;
```

### reverse

```sql
SELECT REVERSE('Hello World');

SELECT REVERSE('meow meow');

SELECT REVERSE(author_fname) FROM books;

SELECT CONCAT('woof', REVERSE('woof'));

SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;
```

### char length

```sql
SELECT CHAR_LENGTH('Hello World');

SELECT CHAR_LENGTH(title) as length, title FROM books;

SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;
```

### upper/lower

```sql
SELECT UPPER('Hello World');

SELECT LOWER('Hello World');

SELECT UPPER(title) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;
```
