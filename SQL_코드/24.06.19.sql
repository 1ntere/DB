--member 테이블 생성
CREATE TABLE member (
member_id NUMBER(4) PRIMARY KEY,
username VARCHAR2(50) NOT NULL,
password VARCHAR2(50) NOT NULL,
email VARCHAR2(100), 
created_at DATE DEFAULT SYSDATE
);

--member_seq 시퀀스 생성
CREATE SEQUENCE member_seq
START WITH 1
INCREMENT BY 1;