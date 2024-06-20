--goods 테이블 시퀀스 생성하기
CREATE TABLE goods (
goods_id NUMBER PRIMARY KEY,
goods_name VARCHAR2(100),
goods_price NUMBER,
goods_quantity NUMBER
);

CREATE SEQUENCE goods_seq;

--drink 테이블 시퀀스 생성하기
CREATE TABLE Drink (
drinks_id NUMBER PRIMARY KEY,
drinks_name VARCHAR2(100),
drinks_price NUMBER,
drinks_quantity NUMBER
);

CREATE SEQUENCE drinks_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

SELECT EMP_NAME, JOB_CODE, COUNT(*) AS 사원수
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY EMP_NAME, JOB_CODE
ORDER BY JOB_CODE ASC;