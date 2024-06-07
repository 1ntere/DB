-- 1. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 ‘전’씨인 직원들의
-- 사원명, 주민번호, 부서명, 직급명을 조회하시오.
SELECT e.EMP_NAME, e.EMP_NO, d.DEPT_TITLE, j.JOB_NAME
FROM EMPLOYEE e
JOIN DEPARTMENT d ON (e.DEPT_CODE = d.DEPT_ID)
JOIN JOB j ON (e.JOB_CODE = j.JOB_CODE)
WHERE e.EMP_NO LIKE '7%'
    AND SUBSTR(e.EMP_NO, 8, 1) IN ('2', '4')
    AND e.EMP_NAME LIKE '전%';
/*
전지연	770808-2665412	인사관리부	대리
*/

-- 2. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 직급명을 조회하시오.
SELECT e.EMP_ID, e.EMP_NAME, j.JOB_NAME
FROM EMPLOYEE e
JOIN JOB j ON(e.JOB_CODE = j.JOB_CODE)
WHERE e.EMP_NAME LIKE '%형%';
/*
211	전형돈	대리
*/

-- 3. 해외영업 1부, 2부에 근무하는 사원의
-- 사원명, 직급명, 부서코드, 부서명을 조회하시오.
SELECT e.EMP_NAME, j.JOB_NAME, e.DEPT_CODE, d.DEPT_TITLE
FROM EMPLOYEE e
JOIN JOB j ON (e.JOB_CODE = j.JOB_CODE)
JOIN DEPARTMENT d ON (e.DEPT_CODE = d.DEPT_ID)
WHERE e.DEPT_CODE IN ('D5', 'D6');

--4. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
SELECT e.EMP_NAME, e.BONUS, d.DEPT_TITLE, l.LOCAL_NAME
FROM EMPLOYEE e
JOIN DEPARTMENT d ON (e.DEPT_CODE = d.DEPT_ID)
JOIN LOCATION l ON (d.LOCATION_ID = l.LOCAL_CODE)
WHERE e.BONUS IS NOT NULL;

--5. 부서가 있는 사원의 사원명, 직급명, 부서명, 지역명 조회
SELECT e.EMP_NAME, j.JOB_CODE, d.DEPT_TITLE, l.LOCAL_NAME
FROM EMPLOYEE e
JOIN JOB j ON (e.JOB_CODE = j.JOB_CODE)
JOIN DEPARTMENT d ON (e.DEPT_CODE = d.DEPT_ID)
JOIN LOCATION l ON (d.LOCATION_ID = l.LOCAL_CODE)
WHERE e.DEPT_CODE IS NOT NULL;

-- 6. 급여등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
--사원명, 직급명, 급여, 연봉(보너스포함)을 조회하시오.
--연봉에 보너스포인트를 적용하시오.
SELECT e.EMP_NAME, j.JOB_NAME, e.SALARY, (e.SALARY + NVL(e.BONUS, 0)) * 12 AS "연봉(보너스포함)"
                                                   --NVL(e.BONUS, 0) : BONUS를 출력하되, BONUS가 NULL이면 0을 반환
FROM EMPLOYEE e
JOIN JOB j ON (e.JOB_CODE = j.JOB_CODE)
JOIN SAL_GRADE s ON (e.SAL_LEVEL = s.SAL_LEVEL)
WHERE e.SALARY > s.MIN_SAL;

-- 7.한국(KO)과 일본(JP)에 근무하는 직원들의
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.
SELECT e.EMP_NAME, d.DEPT_TITLE, l.LOCAL_NAME, n.NATIONAL_NAME
FROM EMPLOYEE e
JOIN JOB j ON (e.JOB_CODE = j.JOB_CODE)
JOIN DEPARTMENT d ON (e.DEPT_CODE = d.DEPT_ID)
JOIN LOCATION l ON (d.LOCATION_ID = l.LOCAL_CODE)
JOIN NATIONAL n ON (l.NATIONAL_CODE = n.NATIONAL_CODE)
WHERE l.LOCAL_CODE IN('L1', 'L2');

-- 8. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- SELF JOIN 사용
SELECT e1.EMP_NAME, e1.DEPT_CODE, e2.EMP_NAME
FROM EMPLOYEE e1
JOIN EMPLOYEE e2 ON (e1.DEPT_CODE = e2.DEPT_CODE
    AND e1.EMP_ID != e2.EMP_ID);
      --e1.EMP_ID != e2.EMP_ID : 내 부서에서 나와 같이 근무하는 동료들을 조회해야 하기 때문에
      --                         내 코드와 동일하면 내가 조회되니까 안됨

-- 9. 보너스포인트가 없는 직원들 중에서 직급코드가 J4 와 J7 인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, JOIN, IN 사용할 것