/*춘 대학교 탐방기*/
-- 1번
-- 춘 기술대학교의 학과 이름과 계열을 조회하시오.
-- 단, 출력 헤더(컬럼명)는 "학과 명", "계열"으로 표시하도록 한다.
SELECT DEPARTMENT_NAME AS "학과 명", CATEGORY AS "계열"
FROM TB_DEPARTMENT;

-- 2 번
-- 학과의 학과 정원을 다음과 같은 형태로 조회하시오
SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.'
FROM TB_DEPARTMENT;

-- 3번
-- "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 조회하시오.
-- (국문학과의 학과코드(DEPARTMENT_NO)는 001)
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_SSN,8,1) = '2'
    AND ABSENCE_YN = 'Y'
    AND DEPARTMENT_NO = '001';

-- 4번 
-- 도서관에서 대출 도서 장기 연체자들을 찾아 이름을 게시하고자 한다.
-- 그 대상자들의 학번이 다음과 같을 때 대상자들을 찾는 적절한 SQL구문을 작성하시오.
-- A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;

-- 5번
-- 입학 정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 조회하시오.
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

-- 6번
-- 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다.
-- 그럼 춘 기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오.
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 7번
-- 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데
-- 선수과목이 존재하는 과목들은 어떤 과목인지 과목 번호를 조회하시오.
SELECT CLASS_NAME, PREATTENDING_CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 8번
-- 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회하시오.
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY CATEGORY;

-- 9번
-- 영문학과(학과코드 002) 학생들의 학번과 이름, 입학년도를 입학년도가 빠른 순으로 표시
-- AS "학번" AS "이름" AS "입학년도"
SELECT STUDENT_NO AS "학번", 
    STUDENT_NAME AS "이름", 
    TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') AS "입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE;

--10번
--춘 대학교 교수 중 이름이 세 글자가 아닌 교수가 2 명 있음
--그 교수의 이름과 주민번호 조회
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
--WHERE PROFESSOR_NAME NOT LIKE '___';
WHERE INSTR(PROFESSOR_NAME,1,1) != 3;

--14번
--춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되었음
--2000년도 이후 학번을 받은 학생들의 학번과 이름 조회
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';
--WHERE SUBSTR(STUDENT_NO,1,1) != 'A'; 도 가능!

--15번
--학번이 A517178인 한아름 학생의 학점 총 평점 구하기
--AS 평점 점수 반올림 정수표기
SELECT STUDENT_NO, ROUND(AVG(POINT),1) AS "평점"
                                  --1 : 소수점 1자리까지 표기
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178'
GROUP BY STUDENT_NO;

--17번
--지도교수를 배정받지 못한 학생의 수 조회
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

--18번
--학번이 A112113인 김고운 학생의 년도 별 평점을 구하기
SELECT SUBSTR(TERM_NO,1,4), ROUND(AVG((POINT)),1) AS "평점"
     --SUBSTR(TERM_NO,1,4) : TERM_NO가 'YYYY0N'이어서 그 중 1번째 문자부터 4자리 'YYYY'를 가져오기
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

--20번
--춘 대학교에 다니는 동명이인 학생들의 이름, 동명인 수 조회
SELECT STUDENT_NAME AS "동일이름", COUNT(*) AS "동명인 수"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY 1;

--02학번 전주 거주자들의 모임을 만들려고 한다. 휴학한 사람들은 제외한 재학중인 학생들의 
-- 학번, 이름, 주민번호를 조회하는 구문을 작성하시오.

