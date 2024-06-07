/*
실습5 SUBQUERY 실습문제
*/
-- 1. 전지연 사원이 속해있는 부서원들을 조회하시오 (단, 전지연은 제외)
-- 사번, 사원명, 전화번호, 고용일, 부서명
SELECT e.EMP_ID, e.EMP_NAME, e.PHONE, e.HIRE_DATE, d.DEPT_TITLE
FROM EMPLOYEE e
JOIN DEPARTMENT d ON (e.DEPT_CODE = d.DEPT_ID)
WHERE e.DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '전지연')
    AND e.EMP_NAME != '전지연';
/*
216	차태연	01064643212	13/03/01	인사관리부
214	방명수	01074127545	10/04/04	인사관리부
*/

-- 2. 고용일이 2000년도 이후인 사원들 중 급여가 가장 높은 사원의
-- 사번, 사원명, 전화번호, 급여, 직급명을 조회하시오.
SELECT e.EMP_ID, e.EMP_NAME, e.PHONE, e.SALARY, j.JOB_NAME
FROM EMPLOYEE e
JOIN JOB j ON (e.JOB_CODE = j.JOB_CODE)
WHERE e.HIRE_DATE >= TO_DATE('2000-01-01', 'YYYY-MM-DD')
    AND e.SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE WHERE HIRE_DATE >= TO_DATE('2000-01-01', 'YYYY-MM-DD'));
/*
201	송종기	01045686656	6000000	부사장
*/

-- 3. 노옹철 사원과 같은 부서, 같은 직급인 사원을 조회하시오. (단, 노옹철 사원은 제외)
-- 사번, 이름, 부서코드, 직급코드, 부서명, 직급명
SELECT e.EMP_ID, e.EMP_NAME, e.DEPT_CODE, d.DEPT_TITLE, j.JOB_NAME
FROM EMPLOYEE e
JOIN DEPARTMENT d ON (e.DEPT_CODE = d.DEPT_ID)
JOIN JOB j ON (e.JOB_CODE = j.JOB_CODE)
WHERE e.DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철')
    AND e.JOB_CODE = (SELECT JOB_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철')
    AND e.EMP_NAME != '노옹철';
/*
201	송종기	D9	총무부	부사장
*/

-- 4. 2000년도에 입사한 사원과 부서와 직급이 같은 사원을 조회하시오
-- 사번, 이름, 부서코드, 직급코드, 고용일
--1) 2000년도에 입사한 사원 찾기
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2000';
--결과 : 204	유재식	D6	J3	00/12/29
--2000년도에 입사한 직원은 유재식이다.

--2) EMPLOYEE 셀프 조인하고, SELECT e1 진행
SELECT e1.EMP_ID, e1.EMP_NAME, e1.DEPT_CODE, e1.JOB_CODE, e1.HIRE_DATE
FROM EMPLOYEE e1
JOIN EMPLOYEE e2 ON (e1.DEPT_CODE = e2.DEPT_CODE AND e1.JOB_CODE = e2.JOB_CODE)
WHERE TO_CHAR(e1.HIRE_DATE, 'YYYY') = '2000' AND e1.EMP_ID != e2.EMP_ID;
--결과 : 204	유재식	D6	J3	00/12/29
--2000년에 입사한 직원들을 찾고 동일한 부서와 직급을 가진 다른 직원 찾기
--2000년에 입사한 직원 e1과 동일한 부서, 및 직급의 다른 직원 e2
--즉, 유재식 찾기와 같음 (2000년에 입사한 직원 찾기)

--3) EMPLOYEE 셀프 조인하고, SELECT e2 진행
SELECT e2.EMP_ID, e2.EMP_NAME, e2.DEPT_CODE, e2.JOB_CODE, e2.HIRE_DATE
FROM EMPLOYEE e1
JOIN EMPLOYEE e2 ON (e1.DEPT_CODE = e2.DEPT_CODE AND e1.JOB_CODE = e2.JOB_CODE)
WHERE TO_CHAR(e1.HIRE_DATE, 'YYYY') = '2000' AND e1.EMP_ID != e2.EMP_ID;
--결과 : 205	정중하	D6	J3	99/09/09
--e1이 2000년에 입사한 직원을 기준으로 동일한 부서와 직급을 가진 다른 직원 e2를 찾음
--e2는 2000년에 입사한 직원과 동일한 부서, 동일한 직급을 가진 다른 직원(유재식과 다른 직원)
--즉, 유재식과 동일 부서, 동일 직급이지만 다른 직원 찾기 (정중하)

--4) 유재식과 정중하 모두 출력하기
SELECT e2.EMP_ID, e2.EMP_NAME, e2.DEPT_CODE, e2.JOB_CODE, e2.HIRE_DATE
FROM EMPLOYEE e1
JOIN EMPLOYEE e2 ON (e1.DEPT_CODE = e2.DEPT_CODE AND e1.JOB_CODE = e2.JOB_CODE)
WHERE TO_CHAR(e1.HIRE_DATE, 'YYYY') = '2000' AND e2.HIRE_DATE IS NOT NULL;
/*
204	유재식	D6	J3	00/12/29
205	정중하	D6	J3	99/09/09
*/

-- 5. 77년생 여자 사원과 동일한 부서이면서 동일한 사수를 가지고 있는 사원을 조회하시오
-- 사번, 이름, 부서코드, 사수번호, 주민번호, 고용일


-- 6. 부서별 입사일이 가장 빠른 사원의
-- 사번, 이름, 부서명(NULL이면 '소속없음'), 직급명, 입사일을 조회하고
-- 입사일이 빠른 순으로 조회하시오
-- 단, 퇴사한 직원은 제외하고 조회..


-- 7. 직급별 나이가 가장 어린 직원의
-- 사번, 이름, 직급명, 나이, 보너스 포함 연봉을 조회하고
-- 나이순으로 내림차순 정렬하세요
-- 단 연봉은 \124,800,000 으로 출력되게 하세요. (\ : 원 단위 기호)