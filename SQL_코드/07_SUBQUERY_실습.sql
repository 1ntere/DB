/*****SUBQUERY실습*****/
--1. 각 직원의 급여가 부서 평균 급여보다 높은 직원들의 이름과 급여 조회하기
--1) 부서 평균급여 구하기
SELECT AVG(SALARY)
FROM EMPLOYEE E
WHERE DEPT_CODE = E.DEPT_CODE;--3089820.952380...
--2) 직원들의 이름과 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > 3089820;
--3) 서브쿼리 이용해서 한 번에 쿼리 작성하기
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE E WHERE DEPT_CODE = E.DEPT_CODE);

--2. 최대 급여를 받는 직원의 이름과 급여 조회하기
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

--3. D5부서의 평균 급여보다 높은 급여를 받는 직원들의 이름 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

--4. 급여가 300만원 이상인 직원 중에서 가장 낮은 급여를 받는 직원의 이름과 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE WHERE SALARY >= 3000000);
             --(SELECT MIN(SALARY) FROM ...) : 서브 쿼리를 통해서 특정 조건을 만족하는 최저 급여를 찾고
    --SALARY = ... : 건에 맞는 급여를 받는 직원을 외부 쿼리에서 조회

/*
서브쿼리
SELECT MIN(SALARY) : 컬럼 최소값 선택
FROM EMPLOYEE : 찾을 데이터 테이블 선택
WHERE SALARY >= 3000000; : 급여가 300만원 이상인 행들만 최소값을 계산

외부쿼리 = 메인쿼리
SELECT EMP_NAMe, SALARY : 최종으로 눈으로 볼 컬럼 선택
FROM EMPLOYEE : 테이블 선택
WHERE SALARY = (서브쿼리); : 급여가 서브쿼리에서 반환된 최소 급여와 같은 행만 가져오는 것
*/

/*SELECT를 활용한 서브쿼리 실습*/
--1. 부서별로 보너스 율이 0.2 이상인 직원 수 조회
SELECT DEPT_TITLE, 
    (SELECT COUNT(*) FROM EMPLOYEE e
    WHERE e.DEPT_CODE = d.DEPT_ID
    AND BONUS >= 0.2) AS "BONUS COUNT"
FROM DEPARTMENT d;

--2. 부서별로 최고 급여와 최저 급여를 조회
SELECT DEPT_TITLE, 
    /*최고급여 서브쿼리 작성*/
    (SELECT MAX(SALARY) FROM EMPLOYEE e
    WHERE e.DEPT_CODE = d.DEPT_ID) AS "최고 급여",
    /*최저급여 서브쿼리 작성*/
    (SELECT MIN(SALARY) FROM EMPLOYEE e
    WHERE e.DEPT_CODE = d.DEPT_ID) AS "최저 급여"
FROM DEPARTMENT d;

--1. 부서별 직원수 조회 SELECT
--외부쿼리 DEPT_CODE
--FROM DEPARTMENT d
SELECT DEPT_TITLE, 
    (SELECT COUNT(*) FROM EMPLOYEE e 
    WHERE e.DEPT_CODE = d.DEPT_ID) AS "부서별 직원수"
FROM DEPARTMENT d;

--2. 부서별로 직원수가 5명 이상인 부서의 부서명과 직원 수 조회
--SELECT 서브쿼리 DEPT_TITLE FROM DEPARTMENT WHERE >= 5
--WHERE 서브쿼리
SELECT DEPT_TITLE, 
    (SELECT COUNT(*) FROM EMPLOYEE e 
    WHERE e.DEPT_CODE = d.DEPT_ID) AS "부서별 직원수"
FROM DEPARTMENT d
WHERE (SELECT COUNT(*) FROM EMPLOYEE e 
    WHERE e.DEPT_CODE = d.DEPT_ID) >= 5;
--★그냥 복잡하게 생각 할 것 없이
--서브쿼리도 외부쿼리에서 하나의 컬럼이 되었기 때문에
--WHERE절에 컬럼의 조건을 넣어주던 것이
--WHERE절에 서브쿼리를 다 가져와서 조건을 넣어주는 것으로 바뀌었다고 생각하면 된다.★
