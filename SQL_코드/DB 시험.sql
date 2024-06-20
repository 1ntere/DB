--1교시
CREATE TABLE members (
    member_id NUMBER(4) PRIMARY KEY,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    email VARCHAR2(100),
    created_at DATE DEFAULT SYSDATE
);

CREATE SEQUENCE members_seq ;

--2교시
--1
INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, 'semo', 'semo1234', 'semo@kh.kh', default);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, 'nemo', 'nemo9876', 'nemo@kh.kh', default);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, 'momo', 'momo5678', 'momo@kh.kh', default);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, 'test_user', 'test_password', 'test_user@example.com', default);

--2
UPDATE members
SET email = 'nemo@kh.com'
WHERE username = 'nemo';

UPDATE members
SET email = 'updated_user@example.com'
WHERE username = 'test_user';

UPDATE members
SET password = 'new_password'
WHERE username = 'test_user';

UPDATE members
SET created_at = SYSDATE
WHERE username = 'test_user';

--3
DELETE
FROM members
WHERE created_at < TO_DATE('2023-01-01', 'YYYY-MM-DD');

DELETE 
FROM members
WHERE email = 'updated_user@example.com';

DELETE
FROM members
WHERE created_at < TO_DATE('2023-01-01', 'YYYY-MM-DD');

--4
SELECT *
FROM members;

SELECT email
FROM members;

SELECT username
FROM members;

ROLLBACK;
--
CREATE TABLE products (
    product_id NUMBER(4) PRIMARY KEY,
    product_name VARCHAR2(50) NOT NULL,
    price NUMBER NOT NULL,
    stock NUMBER
);

CREATE TABLE orders (
    order_id NUMBER(4) PRIMARY KEY,
    member_id NUMBER NOT NULL,
    product_id NUMBER(4) NOT NULL,
    quantity NUMBER,
    order_date DATE DEFAULT SYSDATE
);
--3교시
DELETE
FROM members;

DELETE
FROM orders;

DELETE
FROM products;

CREATE SEQUENCE members_seq2;

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq2.NEXTVAL, '강숙', 'kim1234', 'kimseok@example.com', SYSDATE);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq2.NEXTVAL, '이민숙', 'lee9876', 'leemin@example.com', SYSDATE);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq2.NEXTVAL, '박진수', 'park5678', 'parkjin@example.com', SYSDATE);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq2.NEXTVAL, '최우석', 'choi1234', 'choisoo@example.com', SYSDATE);



CREATE SEQUENCE products_seq2 ;

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq2.NEXTVAL, '삼성 TV', 1000000, 10);

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq2.NEXTVAL, 'LG 냉장고', 800000, 5);

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq2.NEXTVAL, '다이슨 청소기', 500000, 20);

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq2.NEXTVAL, '애플 아이폰', 1200000, 15);


CREATE SEQUENCE orders_seq2 ;

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq2.NEXTVAL, 1, 1, 1, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq2.NEXTVAL, 1, 2, 1, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq2.NEXTVAL, 2, 3, 2, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq2.NEXTVAL, 3, 4, 1, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq2.NEXTVAL, 4, 1, 1, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq2.NEXTVAL, 4, 2, 1, SYSDATE);

--1-0 각 회원이 주문한 서로 다른 상품 종류의 수를 조회하세요.
SELECT COUNT(*)
FROM orders
GROUP BY product_id;
--1-1 username이 '강숙'인 회원이 주문한 상품의 이름, 가격, 주문 날짜를 조회하세요..
SELECT p.product_name, p.price, o.order_date
FROM members m
JOIN orders o USING (member_id)
JOIN products p USING (product_id)
WHERE m.username = '강숙';
--1-2 username이 '이민숙'인 회원이 2023년 1월 1일부터 2023년 12월 31일까지 주문한 총 금액을 조회하세요.
SELECT p.product_name, p.price, o.order_date
FROM members m
JOIN orders o USING (member_id)
JOIN products p USING (product_id)
WHERE m.username = '이민숙'
AND order_date BETWEEN TO_DATE('2023-06-01','YYYY-MM-DD') AND TO_DATE('2023-06-30','YYYY-MM-DD');

--2-0 각 products 테이블에서 가격이 가장 높은 순으로 상품 이름과 가격을 조회하세요.
SELECT product_name, price
FROM products
ORDER BY price DESC;

--2-1 product_name이 '삼성 TV'인 상품을 주문한 회원들의 이름, 이메일, 주문 날짜를 조회하세요.
SELECT m.username, m.email, o.order_date
FROM members m
JOIN orders o USING (member_id)
JOIN products p USING (product_id)
WHERE p.product_name = '삼성 TV';

--2-2 각 월별로 주문된 상품의 총 금액을 조회하세요.
SELECT sum(p.price)
FROM products p
JOIN orders o USING (product_id)
GROUP BY o.order_date;

--3. 2023년 6월 1일부터 2023년 6월 30일까지의 주문 내역을 조회하세요.
SELECT *
FROM orders
WHERE order_date BETWEEN TO_DATE('2023-06-01', 'YYYY-MM-DD') AND TO_DATE('2023-06-30', 'YYYY-MM-DD');
--3-1. 'LG 냉장고'를 2개 이상 주문한 회원의 이름과 주문 수량을 조회하세요.
SELECT m.username, o.quantity
FROM members m
JOIN orders o USING (member_id)
JOIN products p USING (product_id)
WHERE () >= 2;
--3-2. 회원별 첫 번째 주문과 마지막 주문의 날짜를 조회하시오.
SELECT o.order_date
FROM members m
JOIN orders o USING (member_id)
JOIN products p USING (product_id)
GROUP BY m.member_id;

--4. 각 회원의 주문 평균 수량을 조회하세요.

--4-1. products 테이블에서 재고가 10개 이하인 상품의 이름과 재고 수량을 조회하세요.
SELECT product_name, stock
FROM products
WHERE stock <= 10;
--4-2. 2023년 7월 1일에 주문된 모든 상품의 이름, 가격, 주문 수량을 조회하세요.
SELECT p.product_name, o.quantity
FROM products p
JOIN orders o USING (product_id)
WHERE () >= 2;
