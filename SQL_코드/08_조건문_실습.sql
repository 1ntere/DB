/*****DECODE 실습*****/
/*
SELECT
    DECODE(컬럼명1
        '컬럼명1에존재하는값1', '값1에대응하여출력하고싶은결과1', 
        '컬럼명1에존재하는값2', '값2에대응하여출력하고싶은결과2', 
        '컬럼명1에존재하는값3', '값3에대응하여출력하고싶은결과3') AS "새로운컬럼명"
FROM
=> ★ DECODE() 구문이 하나의 컬럼이 되어서 SELECT절 안으로 들어감
*/
--1) 주어진 학생의 성별 기준으로 성별 출력
SELECT STUDENT_NAME AS "이름", STUDENT_SSN AS "주민번호", 
    DECODE(SUBSTR(STUDENT_SSN, 8, 1), 
        '1', '남자',
        '2', '여자') AS "성별"
FROM TB_STUDENT;
/*
이름    주민번호         성별
서가람	830530-2124663	여자
남가영	860510-2120325	여자
주강민	840808-1165595	남자
*/

--2) SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE
SELECT EMP_NAME AS "이름", DEPT_CODE AS "부서코드", 
    DECODE(DEPT_CODE, 
        'D1', '인사관리부', 
        'D2', '회계관리부', 
        'D3', '마케팅부', 
        'D4', '국내영업부',
        '기타') AS "부서"
FROM EMPLOYEE;
/*
이름    부서코드  부서
선동일	D9	    기타
송종기	D9	    기타
노옹철	D9	    기타
*/

--2) SELECT EMP_NAME, JOB_CODE FROM EMPLOYEE
SELECT EMP_NAME AS "이름", JOB_CODE AS "직급코드", 
    DECODE(JOB_CODE, 
        'J1', '대표', 
        'J2', '부사장', 
        'J3', '부장', 
        'J4', '차장', 
        'J5', '과장', 
        'J6', '대리', 
        'J7', '사원',
        '알 수 없음') AS "직급"
FROM EMPLOYEE;
/*
이름    직급코드  직급
선동일	J1	    대표
송종기	J2	    부사장
노옹철	J2	    부사장
*/

/*****CASE WHEN THEN ELSE END 실습*****/
/*
SELECT
    CASE
        WHEN 조건1 THEN 결과1
        WHEN 조건2 THEN 결과2
        ELSE 결과3
    END AS "컬럼명"
FROM
=> ★ CASE ~ END 구문이 하나의 컬럼이 되어서 SELECT절 안으로 들어감
*/
--1) 급여에 따라 등급 설정
--600만 이상 S1, 500만 이상 S2, 400만 이상 S3, 나머지 S4 AS "급여등급"
SELECT EMP_ID AS "ID", EMP_NAME AS "이름", SALARY AS "급여", 
CASE
    WHEN SALARY >= 6000000 THEN 'S1'
    WHEN SALARY >= 5000000 THEN 'S2'
    WHEN SALARY >= 4000000 THEN 'S3'
    ELSE 'S4'
END "급여등급"
FROM EMPLOYEE;
/*
ID  이름    급여     급여등급
200	선동일	8000000	S1
201	송종기	6000000	S1
202	노옹철	3700000	S4
*/

--2) 사원의 근무일 수 에 따라 근속 기간을 분류
SELECT EMP_NAME AS "이름", HIRE_DATE AS "입사일",
CASE
    WHEN FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) >= 20 THEN '20년 이상'
    WHEN FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) >= 10 THEN '10년 이상'
    ELSE '10년 미만'
END "근속기간 분류"
FROM EMPLOYEE;
/*
이름     입사일      근속기간 분류
선동일	90/02/06	20년 이상
송종기	01/09/01	20년 이상
노옹철	01/01/01	20년 이상
*/
