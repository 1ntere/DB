/*
컬럼값 산술 연산
--컬럼값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
--SELECT 문 작성 시 컬럼명에 산술연산을 직접 작성하면
  조회결과(RESULT SET)에 연산 결과가 반영되어 조회된다.
*/
/*
SELECT WHERE절
WHERE의 경우 조건을 걸어 선택한 조건에 해당하는 행만 볼 수 있도록 설정
WHERE 원하는컬럼 = 원하는컬럼에서 해당하는 조건;

만약 원하는 컬럼이 아무것도 없는 NULL 값을 조회하길 원한다면
WHERE 원하는컬럼 IS NULL;

하지만 만약 원하는 컬럼이 NULL이 아닌 값만 조회하길 원한다면
WHERE 원하는컬럼 IS NOT NULL;

~ 이상이거나, ~ 이하일 때, ~초과하거나, ~미만일 때는 >=, <=, >, < 사용
WHERE 원하는컬럼 >= 원하는값;

A와 B 사이를 조회하길 원한다면 BETWEEN A AND B;
WHERE 원하는컬럼 BETWEEN 사당 AND 의정부;

여러 조건을 만족하길 원한다면 AND
WHERE 원하는컬럼1 = 원하는컬럼에서 해당하는 조건1 AND 원하는컬럼2 = 원하는컬럼에서 해당하는 조건2;

-----WHERE절 종료
ORDER BY
오름차순    ASC
내림차순    DESC



*/


--EMPLOYEE 테이블에서 모든 사원의 이름, 급여, 급여+100만원 조회
--우리회사 직원들의 급여를 100만원씩 + 하면 우리 회사의 재무가 어떻게 될 것인가?
SELECT EMP_NAME, SALARY, SALARY + 1000000 FROM employee;

--급여 + 100에 AS 사용해서 100만원 인상 추가
--급여+1000000을 급여_100만원_인상으로 표기하겠다는 의미
--AS의 경우 큰 따옴표를 사용해서 표기
SELECT EMP_NAME, SALARY AS "급여", SALARY+1000000 AS "급여_100만원_인상" FROM employee;

--EMPLOYEE 테이블에서 모든 사원의 사번, 이름, 연봉(급여 * 12) 조회해보기
SELECT EMP_ID AS "사번", EMP_NAME AS "이름", SALARY*12 AS "연봉" FROM employee;

--EMPLOYEE 테이블에서 모든 사원의 사번, 이름, 상반기급여(급여 * 6) 조회해보기
SELECT EMP_ID AS "사번", EMP_NAME AS "이름", SALARY*6 AS "상반기급여" FROM employee;

--특정 부서에 속한 사원의 이름과 이메일 조회
--특정 부서 : D9
SELECT DEPT_CODE, EMP_NAME, EMAIL
FROM employee
WHERE DEPT_CODE = 'D9';

--특정 부서 D1에 속한 사원의 이름과 이메일 조회
SELECT DEPT_CODE, EMP_NAME, EMAIL
FROM employee
WHERE DEPT_CODE = 'D1';

--특정 부서 D4에 속한 사원의 이름과 전화번호 이메일 조회
SELECT DEPT_CODE, EMP_NAME, PHONE, EMAIL
FROM employee
WHERE DEPT_CODE = 'D4';
--WHERE에서 조회한 조건에 부합하는 값이 없으면 출력되지 않음

--IS NULL을 사용하면 DEPT_CODE에 값이 없는 사람을 조회할 수 있음
SELECT DEPT_CODE, EMP_NAME, PHONE, EMAIL
FROM employee
WHERE DEPT_CODE is NULL;

--DEPT_CODE가 모두 is NULL인 사람의 모든 정보를 조회
SELECT *
FROM employee
WHERE DEPT_CODE is NULL;

--보너스가 없는 사원의 이름과 보너스를 조회
SELECT EMP_NAME, BONUS
FROM employee
WHERE BONUS is NULL;

--급여 등급이 S5인 사원의 이름과 급여 조회
SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM employee
WHERE SAL_LEVEL = 'S5';

--사원 번호가 210인 사원의 모든 정보 조회
SELECT *
FROM employee
WHERE EMP_ID = '210';

--이메일 주소가 null이 아닌 사원의 이름과 이메일 조회
SELECT EMP_NAME, EMAIL
FROM employee
WHERE EMAIL is not NULL;

--보너스가 0.2이상인 사원의 이름과 보너스를 조회
SELECT EMP_NAME, BONUS
FROM employee
WHERE BONUS >= 0.2;

--급여가 3000000 에서 4000000 사이인 사원의 이름과 급여 조회
SELECT EMP_NAME, SALARY
FROM employee
WHERE SALARY BETWEEN 3000000 AND 4000000;

--급여가 높은 순서대로 사원의 이름과 급여 조회
--숫자체계 오름차순 1부터 시작
--숫자체계 내림차순 9부터 시작
SELECT EMP_NAME, SALARY
FROM employee
ORDER BY SALARY DESC;

--사원의 이름을 오름차순으로 정렬해서 조회
--글자체계 오름차순 ㄱ부터 ㅎ까지, A부터 Z까지
--글자체계 내림차순 ㅎ부터 ㄱ까지, Z부터 A까지
SELECT EMP_NAME
FROM employee
ORDER BY EMP_NAME ASC;

--employee 테이블에서 급여가 3000000을 초과하는 사원의 사번, 이름, 급여, 부서코드 조회
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM employee
WHERE SALARY > 3000000;

--employee 테이블에서 연봉이 50000000원 이하인 사원의 사번, 이름, 연봉 조회, 연봉은 연봉으로 표기
SELECT EMP_ID, EMP_NAME, SALARY*12 AS "연봉"
FROM employee
WHERE SALARY*12 <= 50000000;

--employee 테이블에서 부서코드가 D9가 아닌 사원들의 이름, 부서코드, 전화번호 조회
SELECT EMP_NAME, DEPT_CODE, PHONE
FROM employee
WHERE DEPT_CODE != 'D9';

--employee 테이블에서 부서코드가 'D6' 사원 중에서 급여가 300만원을 초과하는 사원의 이름, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM employee
WHERE DEPT_CODE = 'D6' AND SALARY > 3000000
ORDER BY SALARY DESC;

--부서코드가 'D6'이고 직급코드가 'J3'인 사원의 이름과 급여, 부서코드, 직급코드 조회
SELECT EMP_NAME, SALARY, DEPT_CODE, JOB_CODE
FROM employee
WHERE DEPT_CODE = 'D6' AND JOB_CODE = 'J3';

--날짜 범위 비교
--employee 테이블에서 입사일이 2000-01-01 부터 2000-12-31 사이인 사원의 이름, 입사일 조회
SELECT EMP_NAME, HIRE_DATE AS "입사일"
FROM employee
WHERE HIRE_DATE
BETWEEN TO_DATE('2000-01-01', 'YYYY_MM_DD') AND TO_DATE('2000-12-31', 'YYYY_MM_DD');

--2000년 이후 입사한 사원의 이름과 입사일 조회
SELECT EMP_NAME, HIRE_DATE AS "입사일"
FROM employee
WHERE HIRE_DATE > TO_DATE('2000-01-01', 'YYYY_MM_DD');


