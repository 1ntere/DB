/*
컬럼값 산술 연산
--컬럼값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
--SELECT 문 작성 시 컬럼명에 산술연산을 직접 작성하면
  조회결과(RESULT SET)에 연산 결과가 반영되어 조회된다.
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
