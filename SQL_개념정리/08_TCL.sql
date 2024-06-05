/*
TCL (Transaction Control Language) : 트랙잭션 제어 언어
COMMIT, ROLLBACK

Transaction : 업무, 처리

변경된 사항을 묶어서 하나의 트랜잭션에 처리

트랜잭션에서 데이터 변경 대상 : INSERT, UPDATE, DELETE (DML)

ex.
INSERT INTO 값 추가 ----------------> DB 반영 X
INSERT INTO 값 추가 -----COMMIT-----> DB 반영 O
-------------------------------------------------------------------------현재까지
INSERT INTO 값 추가 -----트랜잭션에 추가-----COMMIT-----> DB 반영 O
INSERT INTO 값 10개 추가 -----트랜잭션에 10개 추가-----ROLLBACK-----> DB 반영 X

1) COMMIT    : 메모리 트랜잭션에 임시 저장된 데이터를 DB에 완전히 추가
2) ROLLBACK  : 메모리 트랜잭션에 임시 저장된 데이터를 삭제하고
               마지막 COMMIT 상태로 돌아감
3) SAVEPOINT : 임시저장, 메모리 트랜잭션에 저장 지점을 정의
               ROLLBACK 수행시 전체 작업을 삭제하는 것이 아닌
               저장 지점까지만 일부 ROLLBACK
*/
--복제 테이블 DEPARTMENT3
CREATE TABLE DEPARTMENT3 AS SELECT * FROM DEPARTMENT;
--Table DEPARTMENT3이(가) 생성되었습니다.

SELECT * FROM DEPARTMENT3;
--테이블에 데이터가 있는지 확인

--1. COMMIT 예제
--1) D0에 경리부 L2 삽입
INSERT INTO DEPARTMENT3
VALUES ('D0', '경리부', 'L2');
--1 행 이(가) 삽입되었습니다.

--경리부가 제대로 포함되었는지 확인
SELECT * FROM DEPARTMENT3;

--2) D9인 부서의 이름과 지역코드를 전략기획팀, L3으로 수정
UPDATE DEPARTMENT3
SET DEPT_TITLE = '전략기획팀', 
    LOCATION_ID = 'L3'
WHERE DEPT_ID = 'D9';
--1 행 이(가) 업데이트되었습니다.

--제대로 업데이트되었는지 확인
SELECT * FROM DEPARTMENT3;

--3) 추가와 수정된 사항들을 최종 저장
COMMIT;
--커밋 완료.

ROLLBACK;
--롤백 완료.
--완벽하게 저장이 된 상태에서 돌아가기를 진행할 경우 커밋이 완료된 시점으로 돌아감
--하지만 52~55 사이나 다른 구문에서 INSERT, UPDATE, DELETE 해준 사항이 없기 때문에 변경이 없음

--2. ROLLBACK 예제
--1) DEPT_ID = 'D0'인 행을 삭제
DELETE FROM DEPARTMENT3
WHERE DEPT_ID = 'D0';
--1 행 이(가) 삭제되었습니다.

--DEPT_ID = 'D0'인 행이 제대로 삭제가 되었는지 확인
SELECT * FROM DEPARTMENT3;

--2) DEPT_ID = 'D9'인 행을 삭제
DELETE FROM DEPARTMENT3
WHERE DEPT_ID = 'D9';
--1 행 이(가) 삭제되었습니다.

--DEPT_ID = 'D9'인 행이 제대로 삭제가 되었는지 확인
SELECT * FROM DEPARTMENT3;

--3) DEPT_ID = 'D8'인 행을 삭제
DELETE FROM DEPARTMENT3
WHERE DEPT_ID = 'D8';
--1 행 이(가) 삭제되었습니다.

--DEPT_ID = 'D8'인 행이 제대로 삭제가 되었는지 확인
SELECT * FROM DEPARTMENT3;

--4) 삭제한 내역 모두 되돌리기
ROLLBACK;
--롤백 완료.

--삭제한 내역을 모두 되돌렸는지 확인하기
SELECT * FROM DEPARTMENT3;

--3. SAVEPOINT 예제
--SAVEPOINT 작성해준 후 저장지점 이름 설정
--1) DEPT_ID = 'D0'인 행을 삭제
DELETE FROM DEPARTMENT3
WHERE DEPT_ID = 'D0';
--1 행 이(가) 삭제되었습니다.

--2) "SP1" 이라는 저장 지점 설정
SAVEPOINT "SP1";
--Savepoint이(가) 생성되었습니다.

--3) DEPT_ID = 'D9'인 행을 삭제
DELETE FROM DEPARTMENT3
WHERE DEPT_ID = 'D9';
--1 행 이(가) 삭제되었습니다.

--4) "AAA" 이라는 저장 지점 설정
SAVEPOINT "AAA";
--Savepoint이(가) 생성되었습니다.

--5) 실수로 DEPARTMENT3 전체 삭제
DELETE FROM DEPARTMENT3;
--8개 행 이(가) 삭제되었습니다.

-- AAA까지 롤백
ROLLBACK TO "AAA";
--롤백 완료.
--"AAA" 시점으로 저장된 DB 내역이 돌아옴
--DEPT_ID = 'D0'인 행과 DEPT_ID = 'D9'인 행은 삭제가 되어 있음

--삭제한 내역을 모두 되돌렸는지 확인하기
SELECT * FROM DEPARTMENT3;

-- SP1까지 롤백
ROLLBACK TO "SP1";
--롤백 완료.
--"SP1" 시점으로 저장된 DB 내역이 돌아옴
--DEPT_ID = 'D0'인 행만 삭제가 되어 있음

--SP1이전으로 롤백하기
ROLLBACK;