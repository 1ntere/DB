/*****UPDATE 실습*****/
--D1 인사관리부 -> 인사팀으로 변경
UPDATE DEPARTMENT2
SET DEPT_TITLE = '인사팀'
WHERE DEPT_ID = 'D1';

    --D1 인사팀 확인하기
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID = 'D1';

--D3 마케팅부 -> 마케팅팀으로 변경
UPDATE DEPARTMENT2
SET DEPT_TITLE = '마케팅팀'
WHERE DEPT_ID = 'D3';

    --D3 마케팅팀 확인하기
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID = 'D3';

--D8 기술지원부 -> 기술지원팀으로 변경
UPDATE DEPARTMENT2
SET DEPT_TITLE = '기술지원팀'
WHERE DEPT_ID = 'D8';

    --D8 기술지원팀 확인하기
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID = 'D8';

--수정된 내용을 저장하길 원한다면 COMMIT
--저장하지 않길 원한다면 ROLLBACK
COMMIT;

--EMPLOYEE2 테이블에서 BONUS를 받지 않은 사원의 BONUS를 0.1로 변경
UPDATE EMPLOYEE2
SET BONUS = 0.1
WHERE BONUS IS NULL;

    --변경 후 EMP_NAME, BONUS 모두 조회
SELECT EMP_NAME, BONUS
FROM EMPLOYEE2;

ROLLBACK;

--모든 직원의 기본 급여 인상 EMPLOYEE2
UPDATE EMPLOYEE2
SET SALARY = SALARY * 1.1;

    --변경 후 조회하기
SELECT EMP_NAME, SALARY
FROM EMPLOYEE2;

--D9부서의 모든 직원의 보너스를 0.4로 수정
UPDATE EMPLOYEE2
SET BONUS = 0.4
WHERE DEPT_CODE = 'D9';

    --변경 후 조회하기
SELECT EMP_NAME, DEPT_CODE, BONUS
FROM EMPLOYEE2;

--DEPT_CODE가 NULL인 직원은 D3부서로 이동
UPDATE EMPLOYEE2
SET DEPT_CODE = 'D3'
WHERE DEPT_CODE IS NULL;

    --조회하기
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE2;

--특정 입사일(2000-01-01)이후 입사한 직원의 급여 수정
UPDATE EMPLOYEE2
SET SALARY = SALARY + 1000000
WHERE HIRE_DATE >= TO_DATE('2000-01-01', 'YYYY-MM-DD');

    --조회하기
SELECT EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE2;

--1997-09-12에 입사한 직원 퇴사처리
UPDATE EMPLOYEE2
SET ENT_YN = 'Y'
WHERE HIRE_DATE = TO_DATE('1997-09-12', 'YYYY-MM-DD');

    --조회하기
SELECT EMP_NAME, ENT_YN
FROM EMPLOYEE2;

ROLLBACK;--UPDATE 모두 취소

--특정 도메인 주소 변경
UPDATE EMPLOYEE2
SET EMAIL = REPLACE(EMAIL, 'or.kr', 'com.kr');

    --조회하기
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE2;

--핸드폰 번호 010뒤에 -를 붙여서 변경

UPDATE EMPLOYEE2
SET PHONE = REPLACE(PHONE, '010', '010-')
WHERE PHONE LIKE '010%';
          --LIKE '010%' : 무조건 맨 앞이 010이어야 하고 중간에 오는 010은 변경 x

/*
오류 발생
EMPLOYEE2"."PHONE" (actual: 13, maximum : 12)
    행 최대 크기를 12자리로 설정해주었기 때문에 나중에 발생하는 에러
    행 최대 크기를 늘리거나 다시 돌아가기(ROLLBACK 설정)
*/
ROLLBACK;

--특정 입사일을 가진 직원의 입사일 변경
UPDATE EMPLOYEE2
SET HIRE_DATE = TO_DATE('2000-01-02', 'YYYY-MM-DD')
WHERE HIRE_DATE = TO_DATE('1999-09-09', 'YYYY-MM-DD');

COMMIT;

-- UPDATE 한 번에 여러 컬럼 업데이트
-- 진행하기 전 EMPLOYEE3 만들기
CREATE TABLE EMPLOYEE3 AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE3;

--EMP_ID가 200인 직원의 이메일과 전화번호 업데이트
UPDATE EMPLOYEE3
SET EMAIL = 'ONE_SUN@or.kr', PHONE = '01012345678'
WHERE EMP_ID = '200';

SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE3;

ROLLBACK;

--D9 부서의 모든 직원의 급여 * 1.1, 보너스 = 0.2 변경
UPDATE EMPLOYEE3
SET SALARY = SALARY * 1.1, BONUS = 0.2
WHERE DEPT_CODE = 'D9';

SELECT EMP_NAME, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE3
WHERE DEPT_CODE = 'D9';

--J3 직무코드를 가진 직원의 직무코드와 부서코드를 J5와 D5로 변경
UPDATE EMPLOYEE3
SET JOB_CODE = 'J5', DEPT_CODE = 'D5'
WHERE JOB_CODE = 'J3';

SELECT EMP_NAME, JOB_CODE, DEPT_CODE
FROM EMPLOYEE3
WHERE JOB_CODE = 'J5';

--송은희 직원의 이름과 이메일 변경, 송은휘, SONGSONG@or.kr
UPDATE EMPLOYEE3
SET EMP_NAME = '송은휘', EMAIL = 'SONGSONG@or.kr'
WHERE EMP_NAME = '송은희';

SELECT EMP_NAME, EMAIL
FROM EMPLOYEE3
WHERE EMP_NAME = '송은휘';

ROLLBACK;

--차태연 직원의 이름과 급여 변경, 차태형, 8000000
UPDATE EMPLOYEE3
SET EMP_NAME = '차태형', SALARY = 8000000
WHERE EMP_NAME = '차태연';

SELECT EMP_NAME, SALARY
FROM EMPLOYEE3
WHERE EMP_NAME = '차태형';

--EMPLOYEE3 TABLE에 해당하는 모든 직원의 이메일 도메인과 부서코드 변경, com.kr, D4
UPDATE EMPLOYEE3
SET EMAIL = REPLACE(EMAIL, 'or.kr', 'com.kr'), DEPT_CODE = 'D4';

SELECT EMP_NAME, EMAIL, DEPT_CODE
FROM EMPLOYEE3;

ROLLBACK;

--EMPLOYEE3 테이블의 전체 데이터 삭제
DELETE FROM EMPLOYEE3;

--완전 삭제 : COMMIT
--되돌리기 : ROLLBACK
COMMIT;