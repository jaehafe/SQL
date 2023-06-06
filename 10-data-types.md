## 10. 데이터 유형

### CHAR VARCHAR

1. **`CHAR`** 데이터 타입:
   - **`CHAR`**은 고정 길이 문자열을 저장하는 데 사용됩니다.
   - 정의된 길이만큼의 공간을 항상 사용하므로 데이터의 실제 길이와 상관없이 지정된 길이로 채워집니다.
   - 예를 들어, **`CHAR(10)`**은 항상 10개의 문자를 저장하며, 입력된 문자열이 10자 미만이더라도 나머지 공간을 채우기 위해 패딩됩니다.
2. **`VARCHAR`** 데이터 타입:
   - **`VARCHAR`**은 가변 길이 문자열을 저장하는 데 사용됩니다.
   - 필요한 만큼의 공간만 실제 데이터를 저장하는 데 사용합니다.
   - 예를 들어, **`VARCHAR(10)`**은 최대 10개의 문자를 저장할 수 있지만 입력된 문자열에 따라 실제로 사용되는 공간이 달라집니다.

### DECIMAL

```sql
DECIMAL(5, 2)
999.99

999.99 -> 5 Digits
		99 -> 2 Digits
```

### DATE, TIME, DATETIME

1. DATE
   - YYYY-MM-DD
2. TIME
   - HH:MM:SS
3. DATETIME
   - YYYY-MM-DD HH:MM:SS

### 날짜 양식 바꾸기

```sql
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;
```

### TIMESTAMPS

```sql
// 행이 삽입될 때 해당 열에 현재 날짜 및 시간을 자동으로 할당
create table comments (
	content VARCHAR(100),
	created_at TIMESTAMP DEFAULT NOW()
)

// 업데이트 될 때 created_at열에 현재 날짜와 시간을 자동으로 할당
create table comments2 (
	content VARCHAR(100),
	created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
)
```
