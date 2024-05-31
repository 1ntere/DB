/*함수 실습 코드*/

--LENGTH

--1. 직원 이름의 길이 조회, 이름_길이로 작성
SELECT EMP_ID, EMP_NAME, LENGTH(EMP_NAME) AS "이름_길이"
FROM EMPLOYEE;

--2. 이메일의 길이 조회, 이메일_길이로 작성
SELECT EMP_ID, EMP_NAME, EMAIL, LENGTH(EMAIL) AS "이메일_길이"
FROM EMPLOYEE;


--3. 전화번호 길이가 11자리인 직원 조회
SELECT EMP_ID, EMP_NAME, PHONE, LENGTH(PHONE) AS "전화번호_길이"
FROM EMPLOYEE
WHERE LENGTH(PHONE) = 11;

--4. 이메일의 길이가 15자 이상인 직원 조회
SELECT EMP_ID, EMP_NAME, EMAIL, LENGTH(EMAIL) AS "이메일_길이"
FROM EMPLOYEE
WHERE LENGTH(EMAIL) >= 15;

--5. 부서코드가 2글자인 직원 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, LENGTH(DEPT_CODE) AS "부서코드_길이"
FROM EMPLOYEE
WHERE LENGTH(DEPT_CODE) = 2;

--6. 전화번호 010이 포함된 직원 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE INSTR(PHONE, '010') > 0;

--6-1. LIKE로 변경해서 작성
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '%010%';

--SUBSTR 예제

--1. 이름의 세 글자 가져오기, AS "이름_석자"
SELECT EMP_NAME, SUBSTR(EMP_NAME, 1) AS "이름_석자"
FROM EMPLOYEE;

--2. 전화번호의 마지막 네 자리 가져오기
SELECT EMP_NAME, SUBSTR(PHONE, -4) AS "마지막_네자리"
                   ---4 : SUBSTR에서 -를 붙이면 시작부터가 아니라 끝에서부터 4개 가져올 수도 있다
FROM EMPLOYEE
WHERE LENGTH(PHONE) >= 11;
   --LENGTH(PHONE) >= 11 : NULL값이 아닌 번호만 보길 원함
   --                      WHERE PHONE IS NOT NULL;도 가능

--3. 주민등록번호의 생년월일 추출
SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 6) AS "생년월일"
FROM EMPLOYEE;

--4. 전화번호의 앞 세자리 추출
SELECT EMP_NAME, SUBSTR(PHONE, 1, 3) AS "앞_세자리"
FROM EMPLOYEE
WHERE PHONE IS NOT NULL;
    --PHONE IS NOT NULL : NULL값이 아닌 번호만 보길 원함

--5. 이메일 @ 뒤에 있는 도메인 추출
SELECT EMP_NAME, SUBSTR(EMAIL, INSTR(EMAIL, '@')+1) AS "도메인"
FROM EMPLOYEE;


--COUNT
--1. EMPLOYEE 테이블에서 직원 수 조회
SELECT COUNT(*) AS "총 직원 수"
FROM EMPLOYEE;
--2. 부서가 'D9'인 직원 수 조회
SELECT COUNT(DEPT_CODE) AS "D9 직원 수"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';
--3. 보너스를 받은 직원 수 조회
SELECT COUNT(BONUS) AS "보너스 받은 직원 수"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

--AVG
--EMPLOYEE 테이블에서 모든 사원의 평균 급여 조회
SELECT AVG(SALARY)
FROM EMPLOYEE;

--평균 급여를 올림, 내림, 반올림 활용해서 정수로 출력
--1. CEIL : 올림
SELECT CEIL(AVG(SALARY))
FROM EMPLOYEE;
--2. FLOOR : 내림
SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE;
--3. ROUND : 반올림
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;

/*REPLACE 활용 실습*/
--1. 이메일 주소에서 모든 점(.)을 하이픈(-)로 대체
--> EMP_ID, EMAIL AS "수정된 이메일"
SELECT EMP_NAME, EMP_ID, EMAIL, REPLACE(EMAIL, '.', '-') AS "수정된 이메일"
FROM EMPLOYEE;

--2. 주민번호에서 하이픈(-)을 빈 문자열 ""로 대체
--EMP_NAME, EMP_NO, AS "수정된 주민번호"
SELECT EMP_NAME, EMP_NO, REPLACE(EMP_NO, '-', '') AS "수정된 주민번호"
FROM EMPLOYEE;

--3. 이름에서 '김'을 'KIM'으로 대체
--EMP_NAME AS "수정된 이름"
SELECT EMP_NAME, REPLACE(EMP_NAME, '김', 'KIM') AS "수정된 이름"
FROM EMPLOYEE;

--4. 직무코드에서 J를 JOB으로 대체
SELECT EMP_NAME, JOB_CODE, REPLACE(JOB_CODE, 'J', 'JOB') AS "수정된 직무코드"
FROM EMPLOYEE;