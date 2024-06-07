/*
DDL(Data Definition Language)
데이터 정의 언어로 객체를 만들고(Create) 수정하고(alter) 삭제(drop) 구문

ALTER(바꾸다, 수정하다)
수정가능한 것 : 컬럼(추가/수정/삭제), 제약조건(추가/삭제), 이름변경(테이블, 컬럼, 제약조건)

작성법
테이블을 수정하는 경우
ALTER TABALE 테이블명 ADD|MODIFY|DROP 수정할 내용;
*/

/*
1. 제약조건 추가/삭제
//tip. 작성하는 방법 중 [] 대괄호 : 생략 가능 (선택)
제약 조건 추가
ALTER TABLE  테이블명
ADD [CONSTRAINT 제약조건명] 제약조건 (컬럼명) [REFERENCES 테이블명(컬럼명)];
*/
--DEPARTMENT 테이블을 복사해서 예제 진행
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPARTMENT;
--Table DEPT_COPY이(가) 생성되었습니다.

--DEPT_COPY 테이블에 PK PRIMARY KEY 추가
ALTER TABLE DEPT_COPY ADD CONSTRAINT DEPT_COPY_PK PRIMARY KEY(DEPT_ID);
          --DEPT_COPY : 테이블을 수정하겠다
                    --ADD CONSTRAINT : 새로운 제약조건을 추가하는 값
                                   --DEPT_COPY_PK : 새로운 제약조건의 이름
                                                --PRIMARY KEY(DEPT_ID) : DEPT_ID를 기본 키로 설정
--Table DEPT_COPY이(가) 변경되었습니다.

--DEPT_COPY 테이블에서 DEPT_TITLE컬럼에 UNIQUE 제약조건 추가
ALTER TABLE DEPT_COPY ADD CONSTRAINT DEPT_COPY_U UNIQUE(DEPT_TITLE);
--Table DEPT_COPY이(가) 변경되었습니다.

/*
2. 컬럼 추가/수정/삭제
컬럼 추가
ALTER TABLE 테이블명 ADD(컬럼명 데이터타입 [DEFAULT] '값');
컬럼 수정
    데이터 타입 변경
ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입;
    기본값 변경
ALTER TABLE 테이블명 MODIFY DEFAULT '값';

데이터 타입 수정할 경우 컬럼에 저장된 크기 미만으로는 변경할 수 없음
데이터타입 VARCHAR2(100) -> VARCHAR2(10) 데이터 타입이 10 초과되는건 불가능

컬럼 삭제
ALTER TABLE 테이블명 DROP (삭제할컬럼명);
ALTER TABLE 테이블명 DROP COLUMN 삭제할컬럼명;

테이블에는 최소 1개 이상의 컬럼이 존재해야 하기 때문에 모든 컬럼을 삭제할 수는 없다.
*/
--DEPT_COPY 테이블에 CNAME VARCHAR2(20) 컬럼 추가
SELECT * FROM DEPT_COPY;

ALTER TABLE DEPT_COPY ADD (CNAME VARCHAR2(20));
--Table DEPT_COPY이(가) 변경되었습니다.

--DEPT_COPY 테이블에 LNAME VARCHAR2(30) 기본값은 한국으로 추가
ALTER TABLE DEPT_COPY ADD (LNAME VARCHAR2(30) DEFAULT'한국');
--Table DEPT_COPY이(가) 변경되었습니다.

--수정
--DEPT_COPY 테이블의 DEPT_ID 컬럼의 데이터 타입을 CHAR(2)에서 VARCHAR2(3)으로 변경
ALTER TABLE DEPT_COPY MODIFY DEPT_ID VARCHAR2(3);
--Table DEPT_COPY이(가) 변경되었습니다.
--★ 주의할 점 : 기존에 저장된 컬럼 값이 3보다 크면 변경 불가능
--              컬럼 값을 조절할 때 큰 값 -> 작은 값 순서대로 하기
--              이미 저장된 데이터 값이 변경할 값보다 크진 않은지 확인하고 조절하기

--삭제
--DEPT_COPY 테이블 CNAME, LNAME 삭제
SELECT * FROM DEPT_COPY;

ALTER TABLE DEPT_COPY DROP (CNAME);
--Table DEPT_COPY이(가) 변경되었습니다.

ALTER TABLE DEPT_COPY DROP COLUMN LNAME;
--Table DEPT_COPY이(가) 변경되었습니다.

--DEPT_TITLE 컬럼 1번 방법으로 삭제
ALTER TABLE DEPT_COPY DROP (DEPT_TITLE);

--LOCATION_ID 컬럼 2번 방법으로 삭제
ALTER TABLE DEPT_COPY DROP COLUMN LOCATION_ID;
/*
★ 오류 코드
ORA-00904: "LOCATION_ID": invalid identifier
★ 원인
컬럼을 이미 삭제하였으나 한번 더 실행했을 때 주로 나오는 에러
존재하지 않는 컬럼을 삭제하려고 하면 나오는 에러
*/

/*
3. 테이블 삭제
작성법
DROP TABLE 테이블명 [CASCADE CONSTRAINTS];
*/
--추후에 삭제할 테이블 TB1 생성
CREATE TABLE TB1 (
    TB1_PK NUMBER PRIMARY KEY,
    TB1_COL NUMBER
);
--Table TB1이(가) 생성되었습니다.

--추후에 삭제할 테이블 TB2 생성
CREATE TABLE TB2 (
    TB2_PK NUMBER PRIMARY KEY,
    TB2_COL NUMBER REFERENCES TB1
                 --REFERENCES TB1 : TB1 테이블의 PK 값을 참조
);
--Table TB2이(가) 생성되었습니다.

--일반 삭제 (DEPT_COPY)
DROP TABLE DEPT_COPY;
--Table DEPT_COPY이(가) 삭제되었습니다.

SELECT * FROM DEPT_COPY;
/*
★ 오류 발생
ORA-00942: table or view does not exist
★ 원인
DEPT_COPY 테이블을 삭제했으므로 출력할 수 없다
존재하지 않는 테이블을 출력하려고 할 때 발생하는 에러
*/

DROP TABLE TB1;
/*
★ 오류 발생
★ 오류 코드
ORA-02449: unique/primary keys in table referenced by foreign keys
★ 원인
외래 키(FOREIGN KEY)에 의해 참조되는 고유/기본 키가 존재하기 때문에 삭제할 수 없음
★ 해결방안 1
자식테이블(TB2) 삭제 후 부모테이블(TB1) 삭제
DROP TABLE TB2;
DROP TABLE TB1;
★ 해결방안 2
CASCADE CONSTRAINTS 옵션 사용
제약조건을 모두 삭제
DROP TABLE TB1 CASCADE CONSTRAINTS;
DROP TABLE TB2;
SELECT * FROM TB2;
*/
--해결방안 1
DROP TABLE TB2;
--Table TB2이(가) 삭제되었습니다.
DROP TABLE TB1;
--Table TB1이(가) 삭제되었습니다.

--해결방안 2
DROP TABLE TB1 CASCADE CONSTRAINTS;
--Table TB1이(가) 삭제되었습니다.
DROP TABLE TB2;
--Table TB2이(가) 삭제되었습니다.

/*
4. 제약조건/컬럼/테이블이름 변경 RENAME
*/
--테이블 복사
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPARTMENT;
--Table DEPT_COPY이(가) 생성되었습니다.

ALTER TABLE DEPT_COPY RENAME TO DCOPY;
--Table DEPT_COPY이(가) 변경되었습니다.

SELECT * FROM DCOPY;

SELECT * FROM DEPT_COPY;

