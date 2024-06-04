/*
SUBQUERY (서브쿼리)

하나의 SQL문 안에 포함된 또 다른 SQL문
메인 쿼리(기존 쿼리)를 위해 보조 역할을 하는 쿼리문
SELECT, FROM, WHERE, HAVING 절에서 사용 가능

SQL에서 작성하는 모든 구문은 쿼리라고 부름
*/

--서브쿼리 예시1
--부서코드가 노홍철 사원과 같은 소속의 직원의 이름, 부서코드 조회하기

--1)사원명이 노옹철인 사람의 부서코드 조회
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철';--D9

--2)부서코드가 D9인 직원을 조회
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';--선동일, 송종기, 노옹철

--3)부서코드가 노옹철 사원과 같은 소속의 직원 명단 조회
--1)과 2)에서 작성한 쿼리를 하나의 쿼리로 합쳐주기
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '노옹철');
--DEPT_CODE = 'D9' : 가 원래의 코드인데 이 중에서
             --D9 : SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철'; 를 실행하면 D9가 나온다.
             
--서브쿼리 예시2
--전 직원의 평균 급여보다 많은 급여를 받고 읶는 직원의 사번, 이름, 직급코드, 급여 조회
--1) 전 직원의 평균 급여 구하기
SELECT AVG(SALARY)
FROM EMPLOYEE;

--2) 직원들 중 총 급여가 3000000원 이상인 사람들의
--사번, 이름, 직급코드 급여 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000;

--3) 전 직원의 평균 급여보다 많은 금여를 받고 있는 직원 조회
--메인쿼리2) 서브쿼리1)
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEE);

--SELECT에서 작성하는 서브쿼리
--예시1
--각 직급별로 평균 급여 조회
--1) 급여 평균 구하기
SELECT AVG(SALARY)
FROM EMPLOYEE;

--2) 각 직급의 평균을 구한 것을 조회
SELECT JOB_NAME, AVG(SALARY)
FROM JOB;
--★ 에러 발생
--★ 원인 : JOB 테이블에는 급여가 없기 때문에 에러 발생

--3) 1)과 2)의 쿼리를 합해서 조회하기
SELECT JOB_NAME, (SELECT AVG(SALARY) FROM EMPLOYEE e WHERE e.JOB_CODE = j.JOB_CODE)
FROM JOB j;
/*
★ 오류
SELECT JOB_NAME, (SELECT AVG(SALARY) FROM EMPLOYEE)
FROM JOB;
★ 해석
JOB 테이블에서 JOB_NAME 선택

서브쿼리
EMPLOYEE 테이블에서 전체 직원의 평균 급여를 계산
JOB 테이블의 각 행에 대해 평균 급여가 계산된 서브쿼리가 실행되기 때문에
각 직급에 대해 동일한 평균 급여값(전체 직원의 급여 평균)을 반환
★ 원인
각 직급별 개별적인 평균 급여를 반환하지 않음
★ 해결방안
만약에 각 직급별로 평균 급여를 정확하게 계산하고, 개별적인 평균급여를 반환하길 원한다면
서브쿼리에 WHERE e.JOB_CODE = j.JOB_CODE를 넣어주어야 함
★ 해결 코드
SELECT JOB_NAME, (SELECT AVG(SALARY) FROM EMPLOYEE e WHERE e.JOB_CODE = j.JOB_CODE)
FROM JOB j;
*/