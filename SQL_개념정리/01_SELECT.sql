/*
SELECT (조회)

지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL

작성된 구문에 맞는 행, 열 데이터가 조회됨
    조회된 결과가 행의 집합 == RESULT SET(결과 집합)
    RESULT SET은 0행 이상의 포함될 수 있음
        조건에 맞는 행이 없을 수도 있다는 것
*/

/*
[SELECT 작성법 -1 (기초)]

SELECT 컬럼명, 컬럼명, ...
FROM 테이블명;

    지정된 테이블의 모든 행에서 모든 컬럼과 컬럼값을 조회
*/
--EMPLOYEE 테이블에서 모든 행의 컬럼, 컬럼값 조회
SELECT *
FROM EMPLOYEE;

/*
[SELECT 작성법 -2 (기초)]

SELECT 컬럼명, 컬럼명, ...
FROM 테이블명;

    지정된 테이블의 모든 행에서 컬럼명이 일치하는 컬럼값 조회
*/
--EMPLOYEE 테이블에서 모든 행의 사번(EMP_ID), 이름(EMP_NAME), 급여(SALARY) 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

/*
컬럼 값 산술 연산
--컬럼값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
--SELECT문에 산술 연산을 직접 작성하면 조회결과(RESULT SET)에 연산 결과가 반영되어 조회 됨
*/
--EMPLOYEE 테이블에서 모든 사원의 이름, 급여, 급여 + 100만원 조회
SELECT EMP_NAME, SALARY, SALARY + 1000000
FROM EMPLOYEE;

--EMPLOYEE 테이블에서 모든 사원의 이름, 연봉(급여 * 12) 조회
SELECT EMP_NAME, SALARY * 12 AS "연봉"
FROM EMPLOYEE;

/*
SYSDATE, SYSTIMESTAMP
--(시스템이 나타내고 있는) 현재 시간

--SYSDATE        : 현재시간(년, 월, 일, 시, 분, 초) 조회
--SYSTIMESTAMP   : 현재시간 (년, 월, 일, 시, 분, 초, MS + 지역(local) 조회

회원가입할 때 DB에 들어오는 현재 시간을 기록할 때 생성
컴퓨터에서 체크하는 시간을 기록할 때 사용
*/

/*
날짜 사용하기
DB에 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용
TO_DATE('문자열', '패턴')
예를 들어 2024-05-01자 이후 회원가입한 회원 조회
TO_DATE('2024-05-01', 'YYYY-MM-DD')
*/

/*
컬럼명에 별칭 지정

별칭 지정 방법
1) 컬럼명 AS "별칭"   : ★, 문자 가능, 띄어쓰기 가능, 특수문자 가능
2) 컬럼명 "별칭"      : 문자 가능, 띄어쓰기 가능, 특수문자 가능
3) 컬럼명 별칭        : 문자 가능, 띄어쓰기 불가능, 특수문자 불가능
4) 컬럼명 AS 별칭     : 문자 가능, 띄어쓰기 불가능, 특수문자 불가능
*/

--EMPLOYEE 테이블에서 이름, 이메일 가져오기, 이메일 (@ 포함)이라는 별칭 사용
--1) 컬럼명 AS "별칭"
SELECT EMP_NAME, EMAIL AS "이메일 (@ 포함)"
FROM EMPLOYEE;
--2) 컬럼명 "별칭"
SELECT EMP_NAME, EMAIL "이메일 (@ 포함)"
FROM EMPLOYEE;
--3) 컬럼명 별칭
SELECT EMP_NAME, EMAIL 이메일
FROM EMPLOYEE;
/*
SELECT EMP_NAME, EMAIL 이메일 (@ 포함)
FROM EMPLOYEE;
오류 발생 : 띄어쓰기와 특수문자(@) 사용 불가능
*/
--4) 컬럼명 AS 별칭
SELECT EMP_NAME, EMAIL AS 이메일
FROM EMPLOYEE;
/*
SELECT EMP_NAME, EMAIL AS 이메일 (@ 포함)
FROM EMPLOYEE;
오류 발생 : 띄어쓰기와 특수문자(@) 사용 불가능
*/

/*
DISTINCT(별개의, 전혀 다른)
    중복 제거
    
--조회 결과 집합(RESULT SET)에서
지정된 컬럼의 값이 중복되는 경우 중복되는 값을 한 번만 표시할 때 사용
컬럼값이 존재하지 않는 경우에는 출력되지 않음

사용방법
SELECT DISTINCT 중복제거할컬럼명1, 중복제거할컬럼명2, ...
FROM 테이블명
*/
--EMPLOYEE 테이블에서 모든 사원의 부서코드 조회
SELECT DEPT_CODE
FROM EMPLOYEE;
--EMPLOYEE 테이블에서 사원이 존재하는 부서코드만 조회
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;
-->D3, D4, D7부서는 사원이 없기 때문에 조회되지 않음

--EMPLOYEE 테이블에 존재하는 직급 코드의 종류 조회
SELECT JOB_CODE
FROM EMPLOYEE;
--EMPLOYEE 테이블에 사원이 존재하는 직급 코드의 종류 조회
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

/*
WHERE절

--테이블에서 조건을 충족하는 행을 조회할 때 사용
WHERE 절에는 조건식(TRUE/FALSE)만 작성

비교 연산자   : >, <, >=, <=, =(같다), !=, <> (같지 않다)
논리 연산자   : AND, OR, NOT

작성방법
SELECT 컬럼명, 컬럼명, ...
FROM 테이블명
WHERE 조건식;
-->지정된 테이블 모든 행에서 컬럼명이 일치하는 컬럼 값 조회
*/
--EMPLOYEE 테이블에서 급여가 300만원을 초과하는 사원의 이름, 급여, 부서코드 조회
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;

--EMPLOYEE 테이블에서 D9 부서에 해당하는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE 테이블에서 D9 부서에 해당하지 않는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

/*
NULL, NOT NULL

IS NULL      : 컬럼값이 존재하지 않는 경우
IS NOT NULL  : 컬럼값이 존재하는 경우
*/
--EMPLOYEE 테이블에서 DEPT_CODE가 없는 사원 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

--EMPLOYEE 테이블에서 DEPT_CODE가 있는 사원 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL;