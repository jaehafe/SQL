DB 생성

```sql
CREATE DATABASE cat_app;
```

DB 선택

```sql
use cat_app;
```

```sql
SELECT database();
```

테이블 생성

```sql
CREATE TABLE dogs(
	name VARCHAR(50),
	breed VARCHAR(50),
	age INT
);
```

테이블 칼럼 조회

```sql
SHOW COLUMNS FROM <tablename>;

DESC <tablename>;
```

테이블 삭제

```sql
DROP TABLE <tablename>;
```

DB 삽입

```sql
INSERT INTO cats(name, age)
VALUES('Jetson', 7);
```

cats 테이블 전체 조회

```sql
SELECT * FROM cats;
```

multiple insert

```sql
INSERT INTO cats(name, age)
values ('pea', 11),
('butter', 6),
('blue', 3);
```

```sql
create table cats3(
name VARCHAR(100) DEFAULT 'unnamed',
age INT DEFAULT 99
);
```

기본값 설정하기

```sql
CREATE TABLE cats3  (
	name VARCHAR(20) DEFAULT 'no name provided',
	age INT DEFAULT 99
);

CREATE TABLE cats4  (
	name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
	age INT NOT NULL DEFAULT 99
 );
```

primary key → auto increment

```sql
create table unique_cats (
    -> cat_id INT NOT NULL,
    -> name VARCHAR(100),
    -> age INT,
    -> PRIMARY KEY (cat_id)
    -> );

insert into unique_cats (cat_id, name, age) values (1, 'Vic', 12);
```

```sql
create table unique_cats2 (
	cat_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	age INT,
	PRIMARY KEY (cat_id)
);
```

```sql
create table employees2(
	id INT NOT NULL AUTO_INCREMENT,
	last_name VARCHAR(100) NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	middle_name VARCHAR(100),
	age INT NOT NULL,
	current_status VARCHAR(100) NOT NULL DEFAULT 'employed',
	PRIMARY KEY(id)
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);
```

## READ

```sql
select name from cats;
select age, name from cats;
```

### where

```sql
select * from cats where age=4;
select * from cats where name='Egg';
```

### alias

```sql
SELECT cat_id AS id, name FROM cats;
```

## UPDATE

```sql
update cats set breed='Shorthair' where breed='Teddy';
```

## DELETE

```sql
DELETE FROM cats WHERE name='Egg';
DELETE FROM cats;
```
