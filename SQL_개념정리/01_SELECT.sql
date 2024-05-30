/*
SELECT (조회)

지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL

작성된 구문에 맞는 행, 열 데이터가 조회됨
    조회된 결과가 행의 집합 == RESULT SET(결과 집합)
    RESULT SET은 0행 이상의 포함될 수 있음
        조건에 맞는 행이 없을 수도 있다는 것
*/

/*
[SELECT 작성법 -1 (기초)]

SELECT 컬럼명, 컬럼명, ...
FROM 테이블명;

    지정된 테이블의 모든 행에서 모든 컬럼과 컬럼값을 조회
*/
--EMPLOYEE 테이블에서 모든 행의 컬럼, 컬럼값 조회
SELECT *
FROM EMPLOYEE;

/*
[SELECT 작성법 -2 (기초)]

SELECT 컬럼명, 컬럼명, ...
FROM 테이블명;

    지정된 테이블의 모든 행에서 컬럼명이 일치하는 컬럼값 조회
*/
--EMPLOYEE 테이블에서 모든 행의 사번(EMP_ID), 이름(EMP_NAME), 급여(SALARY) 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

/*
컬럼 값 산술 연산
--컬럼값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
--SELECT문에 산술 연산을 직접 작성하면 조회결과(RESULT SET)에 연산 결과가 반영되어 조회 됨
*/
--EMPLOYEE 테이블에서 모든 사원의 이름, 급여, 급여 + 100만원 조회
SELECT EMP_NAME, SALARY, SALARY + 1000000
FROM EMPLOYEE;

--EMPLOYEE 테이블에서 모든 사원의 이름, 연봉(급여 * 12) 조회
SELECT EMP_NAME, SALARY * 12 AS "연봉"
FROM EMPLOYEE;

/*
SYSDATE, SYSTIMESTAMP
--(시스템이 나타내고 있는) 현재 시간

--SYSDATE        : 현재시간(년, 월, 일, 시, 분, 초) 조회
--SYSTIMESTAMP   : 현재시간 (년, 월, 일, 시, 분, 초, MS + 지역(local) 조회

회원가입할 때 DB에 들어오는 현재 시간을 기록할 때 생성
컴퓨터에서 체크하는 시간을 기록할 때 사용
*/

/*
날짜 사용하기
DB에 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용
TO_DATE('문자열', '패턴')
예를 들어 2024-05-01자 이후 회원가입한 회원 조회
TO_DATE('2024-05-01', 'YYYY-MM-DD')
*/

/*
컬럼명에 별칭 지정

별칭 지정 방법
1) 컬럼명 AS "별칭"   : ★, 문자 가능, 띄어쓰기 가능, 특수문자 가능
2) 컬럼명 "별칭"      : 문자 가능, 띄어쓰기 가능, 특수문자 가능
3) 컬럼명 별칭        : 문자 가능, 띄어쓰기 불가능, 특수문자 불가능
4) 컬럼명 AS 별칭     : 문자 가능, 띄어쓰기 불가능, 특수문자 불가능
*/

--EMPLOYEE 테이블에서 이름, 이메일 가져오기, 이메일 (@ 포함)이라는 별칭 사용
--1) 컬럼명 AS "별칭"
SELECT EMP_NAME, EMAIL AS "이메일 (@ 포함)"
FROM EMPLOYEE;
--2) 컬럼명 "별칭"
SELECT EMP_NAME, EMAIL "이메일 (@ 포함)"
FROM EMPLOYEE;
--3) 컬럼명 별칭
SELECT EMP_NAME, EMAIL 이메일
FROM EMPLOYEE;
/*
SELECT EMP_NAME, EMAIL 이메일 (@ 포함)
FROM EMPLOYEE;
오류 발생 : 띄어쓰기와 특수문자(@) 사용 불가능
*/
--4) 컬럼명 AS 별칭
SELECT EMP_NAME, EMAIL AS 이메일
FROM EMPLOYEE;
/*
SELECT EMP_NAME, EMAIL AS 이메일 (@ 포함)
FROM EMPLOYEE;
오류 발생 : 띄어쓰기와 특수문자(@) 사용 불가능
*/

/*
DISTINCT(별개의, 전혀 다른)
    중복 제거
    
--조회 결과 집합(RESULT SET)에서
지정된 컬럼의 값이 중복되는 경우 중복되는 값을 한 번만 표시할 때 사용
컬럼값이 존재하지 않는 경우에는 출력되지 않음

사용방법
SELECT DISTINCT 중복제거할컬럼명1, 중복제거할컬럼명2, ...
FROM 테이블명
*/
--EMPLOYEE 테이블에서 모든 사원의 부서코드 조회
SELECT DEPT_CODE
FROM EMPLOYEE;
--EMPLOYEE 테이블에서 사원이 존재하는 부서코드만 조회
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;
-->D3, D4, D7부서는 사원이 없기 때문에 조회되지 않음

--EMPLOYEE 테이블에 존재하는 직급 코드의 종류 조회
SELECT JOB_CODE
FROM EMPLOYEE;
--EMPLOYEE 테이블에 사원이 존재하는 직급 코드의 종류 조회
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

/*
WHERE절

--테이블에서 조건을 충족하는 행을 조회할 때 사용
WHERE 절에는 조건식(TRUE/FALSE)만 작성

비교 연산자   : >, <, >=, <=, =(같다), !=, <> (같지 않다)
논리 연산자   : AND, OR, NOT

작성방법
SELECT 컬럼명, 컬럼명, ...
FROM 테이블명
WHERE 조건식;
-->지정된 테이블 모든 행에서 컬럼명이 일치하는 컬럼 값 조회
*/
--EMPLOYEE 테이블에서 급여가 300만원을 초과하는 사원의 이름, 급여, 부서코드 조회
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;

--EMPLOYEE 테이블에서 D9 부서에 해당하는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE 테이블에서 D9 부서에 해당하지 않는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

/*
NULL, NOT NULL

IS NULL      : 컬럼값이 존재하지 않는 경우
IS NOT NULL  : 컬럼값이 존재하는 경우
*/
--EMPLOYEE 테이블에서 DEPT_CODE가 없는 사원 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

--EMPLOYEE 테이블에서 DEPT_CODE가 있는 사원 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL;

/*
컬럼명 BETWEEN (A) AND (B)
--컬럼의 값이 A 이상 B 이하이면 TRUE

컬럼명 NOT BETWEEN (A) AND (B)
--컬럼의 값이 A 이상 B 이하이면 FALSE
--컬럼의 값이 A 미만 또는 B 초과시 TRUE
*/

--월급이 300이상 500이하
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 5000000;

--월급이 300미만이거나 500 초과일 때
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 3000000 AND 5000000;


/*
WHERE OR 사용해서 값1, 값2, 값3, ...과 같은 표시를 진행하기도 함
컬럼명 IN (값1, 값2, 값3, ...)
--컬럼의 값이 ()내 값과 일치하면 TRUE

컬럼명 NOT IN (값1, 값2, 값3, ...)
--컬럼의 값이 ()내 값과 일치하지 않으면 TRUE
--컬럼의 값이 ()내 값과 일치하면 FALSE
*/

---------------
/* OR 사용 */
--EMPLOYEE 테이블에서 부서코드가 'D5', 'D6', 'D9'인 사원의 이름, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
OR DEPT_CODE = 'D6'
OR DEPT_CODE = 'D9';
---------------
/* IN 사용 */
--EMPLOYEE 테이블에서 부서코드가 'D5', 'D6', 'D9'인 사원의 이름, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5', 'D6', 'D9');
---------------
/* NOT IN 사용 */
--EMPLOYEE 테이블에서 부서코드가 'D5', 'D6', 'D9'가 아닌 사원의 이름, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN ('D5', 'D6', 'D9');

/*
LIKE
비교하려는 값이 특정한 패턴을 만족시키면 조회하는 연산자
WHERE 컬럼명 LIKE '패턴'

%(포함)
%A : 문자열에서 앞은 어떤 문자든 포함되고 마지막은 A
    끝말있기 처럼 A로 끝나는 단어
    예시 : %륨 - 검색창에 륨으로 끝나는 단어를 검색한 것과 비슷
        칼륨, 나트륨, ...
A% : 문자열에서 A로 시작하고, 끝나는 것은 상관 없음
    예시 : 기% - 검색창에 기로 시작하는 단어를 검색한 것과 비슷
        기차, 기러기, ...
%A% : 문자열의 시작과 끝 문자는 관계 없이 중간에 A가 들어가면 됨
    예시 : %로% - 검색창에 로가 중간에 들어가는 단어를 검색한 것과 비슷
        뽀로로, 케로로, 기로로, ...
        
_ : 글자 수
    A_ : A뒤에 아무거나 한 글자만 있는 문자열
        AB, AI, AQ, A가, A나
    가_ : 가로 시작하는 두 글자 단어만 검색
        가나, 가구, ...
    나__ : 나로 시작하는 세 글자 단어만 검색
        나그네, 나니아, ...
    
    _A : A 앞에 아무거나 한 글자만 있는 문자열
        BA, 1A, QA, 가A
    _가 : 가로 끝나는 두 글자 단어만 검색
        국가, 아가, ...
    __나 : 나로 끝나는 세 글자 단어만 검색
        반다나, 레모나, ...
*/
--EMPLOYEE 테이블에서 성이 전씨인 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';
--EMPLOYEE 테이블에서 이름이 '수'로 끝나는 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%수';
--EMPLOYEE 테이블에서 '하'가 포함되는 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';
--EMPLOYEE에서 이름이 전으로 시작하고 돈으로 끝나는 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%돈';

--이메일의 아이디 글자 수가 5글자인 사원의
--이름, 이메일 조회 5글자@
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '_____@%';

--이메일의 아이디 중 _앞 쪽의 글자 수가 세 글자인 사원의 사번, 이름 이메일 조회
--이메일의 형태가 "세 글자_%@.or.kr"이다.
    --먼저 지금까지 배운 내용으로 코드를 작성
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___%';

    --ESCAPE 옵션 : LIKE 의미를 벗어나 단순 문자열로 인식
    -->적용범위 : 특수문자 뒤 한 글자
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%' ESCAPE '#';
                        --ESCAPE '#' : #으로 구분을 지을 것이다.
    --Like의 패턴을 '___'와 '_%'로 나눈다는 의미
                 --'___' : 세 글자
                        --'_%' : _로 시작하는 글자

/*
LIKE '__#@%' ESCAPE '#' : "두 글자 + @로 시작하는 글자"를 의미

^로 구분짓고 싶다면
LIKE '___^_%' ESCAPE '^'

*로 구분짓고 싶다면
LIKE '___*_%' ESCAPE '*'
*/

--SELECT FROM, AS, DISTINCT
--EMPLOYEE 테이블
--1. EMP_NAME을 "이름", SALARY를 "급여"
SELECT EMP_NAME AS "이름", SALARY AS "급여"
FROM EMPLOYEE;
--2. DEPT_CODE를 "부서코드", JOB_CODE를 "직무코드"
SELECT DEPT_CODE AS "부서코드", JOB_CODE AS "직무코드"
FROM EMPLOYEE;
--3. EMAIL을 "이메일", PHONE을 "전화번호
SELECT EMAIL AS "이메일", PHONE AS "전화번호"
FROM EMPLOYEE;
--4. EMP_ID를 "사원ID", HIRE_DATE를 "입사일"로 표시
SELECT EMP_ID AS "사원ID", HIRE_DATE AS "입사일"
FROM EMPLOYEE;
--5. EMP_NAME, DEPT_CODE, SALARY를 각각 "이름", "부서", "급여"로 표시
SELECT EMP_NAME AS "이름", DEPT_CODE AS "부서", SALARY AS "급여"
FROM EMPLOYEE;
--6. 중복되지 않은 DEPT_CODE를 선택
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;
--7. 중복되지 않은 JOB_CODE를 선택
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;
--8. 중복되지 않은 SAL_LEVEL를 선택
SELECT DISTINCT SAL_LEVEL
FROM EMPLOYEE;
--9. 중복되지 않은 MANAGER_ID를 선택
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEE;
--10. 중복되지 않은 EMP_NAME를 선택
SELECT DISTINCT EMP_NAME
FROM EMPLOYEE;

--OR
--DEPT_CODE가 'D5'이거나 SALARY가 2000000보다 큰 사원의 이름과 급여 선택
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
OR SALARY > 2000000;

--DEPT_CODE가 'D6'이거나 JOB_CODE가 J3인 사원의 이름과 급여를 선택
SELECT DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6'
OR JOB_CODE = 'J3';

--SAL_LEVEL이 'S5'이거나 BONUS가 0.2인 사원의 이름과 급여수준 선택
SELECT SAL_LEVEL, BONUS
FROM EMPLOYEE
WHERE SAL_LEVEL = 'S5'
OR BONUS = 0.2;

--ENT_YN이 N이거나 HIRE_DATE가 2000년 이후인 사원의 이름과 입사일 선택
SELECT EMP_NAME, ENT_YN, SALARY
FROM EMPLOYEE
WHERE ENT_YN = 'N'
OR HIRE_DATE > TO_DATE('2000.01.01', 'YYYY-MM-DD');

/*
DUAL(DUmmy tAbLe)
     Dummy : 실제로 사용되지 않은 데이터
    더미테이블 : 실제로 존재하지 않는 테이블
        테이블을 만들기는 번거롭고,, 테스트나 사용은 해봐야겠고,,
        단순히 데이터를 조회하거나 확인할 때 사용
*/
--존재하지 않는 테이블을 이용해서 현재 시간 확인하기
SELECT SYSDATE, SYSTIMESTAMP
FROM DUAL;

