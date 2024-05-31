/*****
DML : 데이터 조작 언어

테이블에 값을 삽입하거나 수정하거나 삭제하는 구문

INSERT  : 삽입
UPDATE  : 수정
DELETE  : 삭제

진행한 후에 반드시 COMMIT 이나 ROLLBACK을 진행할 것

ROLLBACK - 팀원이나 다른 사람과 상의 후 진행
지금은 개발 연습중이기 때문에 단독으로 진행해도 좋음
*****/

--INSERT, UPDATE, DELETE 연습을 위해 연습용 테이블 만들어 줄 것
--EMPLOYEE 테이블에 있는 정보를 EMPLOYEE2 테이블에 그대로 복사, 붙여넣기 한 것
CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;
--테이블을 만들 때 다른 테이블과 동일하게 (컬럼, 데이터값) 복사, 붙여넣기를 진행할 때는
    --CREATE TABLE 테이블명 AS 복사하고 싶은 테이블 SELECT

SELECT * FROM EMPLOYEE2;

--DEPARTMET 테이블을 DEPARTMENT2 테이블에 그대로 복사 붙여넣기 진행
CREATE TABLE DEPARTMENT2 AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPARTMENT2;


/*
1. INSERT
테이블에 새로운 행을 추가하는 구문

1) INSERT INTO 테이블명 VALUES(데이터, 데이터, ...);
테이블에 모든 컬럼에 대한 값을 INSERT 할 때 사용
INSERT하고자 하는 컬러밍 모든 커럶인 경우 컬럼명 생략 가능
단, 컬럼의 순서를 지켜서 VALUES 값에 값을 기입해야 함
*/

--모두 INSERT 를 해줄 것이기 때문에 컬럼명 생략
INSERT INTO EMPLOYEE2 VALUES(800, '동그라미', '870814-2123456', 'd_grm@or.kr','01076996190', 'D1', 'J7', 'S3', 4300000, 0.2, 200, SYSDATE, NULL, 'N');

COMMIT;

SELECT * FROM EMPLOYEE2
WHERE EMP_ID = 800;

--동그라미씨 입사 신규 부서
INSERT INTO DEPARTMENT2
VALUES('D0', '개발운영부', 'L1');

ROLLBACK; --저장X, 돌아가기





--INSERT에서 특정 부분을 선택해서 넣을 때는 컬럼명을 작성해서 넣어줌
--INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...) VALUES (컬럼명1에해당하는값, 컬럼명2에해당하는값, ...);

/*
2. UPDATE
테이블에 기록된 컬럼의 값을 수행하는 구문
[작성법]
UPDATE 테이블명 SET 컬럼명 = 변경할값
[WHRER 컬럼명 비교연산자 비교값];--필수 X


*/
--DEPARTMENT2 테이블에서 DEPT_ID가 'D9'인 부서 정보 조회
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID = 'D9';

--DEPARTMENT2 테이블에서 DEPT_ID가 'D9'인 부서를 '전략기획팀'으로 수정
UPDATE DEPARTMENT2
SET DEPT_TITLE = '전략기획팀'
WHERE DEPT_ID = 'D9';

--UPDATE 확인
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID = 'D9';

--저장을 원한다면 COMMIT 작성
--되돌리기를 원한다면 ROLLBACK 작성
ROLLBACK;


/*****
--EMPLOYEE3 전체 테이블 삭제
DELETE FROM EMPLOYEE3;
--완전 삭제 : COMMIT
--되돌리기 : ROLLBACK
COMMIT;
*****/