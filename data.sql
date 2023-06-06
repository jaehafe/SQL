-- DB 생성
CREATE DATABASE cat_app;

-- DB 선택
use cat_app;

SELECT database();

-- 테이블 생성
CREATE TABLE dogs(
	name VARCHAR(50),
	breed VARCHAR(50),
	age INT
);

-- 테이블 칼럼 조회
SHOW COLUMNS FROM <tablename>;
-- or
DESC <tablename>;

-- 