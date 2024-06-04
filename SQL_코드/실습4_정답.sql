--[ORDER BY 실습]
--1.  DEPARTMENT 테이블에서 DEPT_TITLE을 기준으로 정렬하여 모든 데이터 조회
SELECT *
FROM DEPARTMENT
ORDER BY DEPT_TITLE;--생략되어 있다면 : ASC 오름차순
--2. EMPLOYEE 테이블에서 SALARY를 기준으로 내림차순 정렬하여 모든 데이터
SELECT *
FROM EMPLOYEE
ORDER BY SALARY DESC;

--[HAVING 실습]
--HAVING을 사용한다는 것은 GROUP BY를 사용한다는 의미
/*
★ WHERE와 HAVING BY의 차이점

WHERE : 조건을 먼저 실행하여 이에 해당하는 자료에 대해서만 조회를 진행
HAVING BY : 모든 자료를 조회하고 조건에 맞는 컬럼만 조회
*/
--1. EMPLOYEE 테이블에서 DEPT_CODE별 평균 급여를 구하고, 평균 급여가 3,000,000보다 큰 부서만 조회
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000;
--2. EMPLOYEE 테이블에서 JOB_CODE별 직원 수를 구하고, 직원 수가 3명 이상인 직급만 조회
SELECT JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING COUNT(*) >= 3;

--[GROUP BY 실습]
--1. EMPLOYEE 테이블에서 DEPT_CODE별 직원 수를 조회
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
--2. EMPLOYEE 테이블에서 JOB_CODE별 평균 급여를 조회
SELECT JOB_CODE, FLOOR(AVG(SALARY)) AS "평균 급여"
               --FLOOR(AVG(SALARY)) : AVG나 SUM으로 수의 합에 대한 결과를 구할 때
               --                     정수 밑에 있는 소수점을 제거하길 원한다면
               --                     CEIL(올림), ROUND(반올림), FLOOR(내림) 실행
FROM EMPLOYEE
GROUP BY JOB_CODE;

--[WHERE 실습]
--1. EMPLOYEE 테이블에서 급여가 3,000,000 이상인 직원들을 조회'
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000;
--2. EMPLOYEE 테이블에서 DEPT_CODE가 'D1'인 직원들을 조회
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';