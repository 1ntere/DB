/*
[JOIN]
하나 이상의 테이블에서 데이터를 조회하기 위해 사용
수행결과는 하나의 RESULT SET으로 나옴

관계형 데이터베이스에서 SQL을 이용해 테이블간 관계를 맺는 방법

관계형 데이터베이스는 최소한의 데이터를 테이블에 담고 있어
원하는 정보를 테이블에서 조회하려면
한 개 이상의 테이블에서 데이터를 읽어와야 하는 경우가 많음
이 때, 테이블간 관계를 맺기 위한 연결고리 역할이 필요한데
두 테이블에서 같은 데이터를 저장하는 컬럼이 연결고리가 됨

등가 조인 : 내부 조인(INNER JOIN), 
           JOIN USING, 
           ON, 
           자연조인(NATURAL JOIN)
포괄 조인 : 왼쪽 외부 조인(LEFT OUTER JOIN), 
           오른쪽 외부 조인(RIGHT OUTER JOIN), 
           전체 외부 조인(FULL OUTER JOIN)
자체 조인 : JOIN ON
교차 조인 : CROSS JOIN
*/
--지금까지 서로 다른 테이블 데이터를 조회할 경우 코드를 2개로 나눠서 조회했었음
--직원번호, 직원명, 부서코드, 부서명을 조회할 때
--직원번호, 직원명, 부서코드는 EMPLOYEE 테이블에서 조회 가능
--부서명은 DEPARTMENT 테이블에서 조회 가능
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;
/*
EMP_ID  EMP_NAME    DEPT_CODE
200     선동일       D9
201	    송종기	    D9
202	    노옹철	    D9
*/
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;
/*
DEPT_ID     DEPT_TITLE
D9	        총무부
*/

--하지만 JOIN을 사용하면 EMPLOYEE 테이블과 DEPARTMENT 테이블을 한 번에 조회 가능
--DEPT_CODE와 DEPT_ID가 동일한 값이므로
--DEPT_CODE = DEPT_ID 를 통해 연관된 테이블 2개를 한 번에 조회할 수 있다
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE
   --EMPLOYEE : 보통 컬럼이 많은 테이블명을 FROM 뒤에 작성
   --           네이버
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
   --DEPARTMENT : 
   --             네이버카페
   --DEPARTMENT ON ;
              --ON : 필수 아님
                 --(DEPT_CODE = DEPT_ID) : 필수,
                 --                        EMPLOYEE 테이블의 DEPT_CODE와 같은
                 --                        DEPT_ID를 DEPARTMENT 테이블에서 찾아서 연관시킴

/*
EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서
직원ID, 이름, 부서코드, 부서ID, 부서명을 조회하는 쿼리

JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

JOIN은 단순히 테이블 2개를 붙이는 것이 아닌

기준을 삼은 테이블의 한 컬럼을 지정해
다른 테이블의 한 컬럼과 같은 행을 찾아
기준 테이블 옆에 한 행 씩 붙여나가는 것

EMP_ID  EMP_NAME    DEPT_CODE   DEPT_ID     DEPT_TITLE
200	    선동일	    D9	        D9	        총무부
201	    송종기	    D9	        D9	        총무부
202	    노옹철	    D9	        D9	        총무부
*/

/*
1. 내부 조인 INNER JOIN
연결되는 컬럼의 값이 일치하는 행들만 조인 됨
일치하는 값이 없는 행은 조인에서 제외
작성방법은 ANSI / ORACLE로 나뉨
ANSI 표준 구문
    구문 기준을 정할 때 정의되는 기준
    가장 유명한 표준 : ASCII(아스키코드)
    연결에 사용할 두 컬럼이 다른 경우 : JOIN ON
    연결에 사용할 두 컬럼이 같은 경우 : JOIN USING
ORACLE 표준 구문
    FROM절에 . 로 구분해서 합칠 테이블명을 기술
    WHERE절에 합치기에 사용할 컬럼명 명시
*/

/*
ASNI 표준 구문
    1) 연결에 사용할 두 컬럼명이 다른 경우 : JOIN ON을 사용
       오라클에서는 JOIN ON을 사용하지 않고
       WHERE 절에 = 을 사용하면 됨
*/
--JOIN을 활용해서 EMPLOYEE 테이블과 DEPARTMENT 테이블을 한 번에 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

--DEPARTMENT 테이블, LOCATION 테이블 참조해서 부서명, 지역명 조회
SELECT *
FROM DEPARTMENT;
SELECT *
FROM LOCATION;

--ANSI 방식 JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);
SELECT DEPT_TITLE AS "부서명", LOCAL_CODE AS "코드명", LOCAL_NAME AS "지역명"
FROM DEPARTMENT
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

--ORACLE 방식 WHERE LOCATION_ID = LOCAL_CODE;
SELECT DEPT_TITLE AS "부서명", LOCAL_CODE AS "코드명", LOCAL_NAME AS "지역명"
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;

/*
ASNI 표준 구문 (이어서)
    2) 연결에 사용할 두 컬럼명이 샅은 경우 : JOIN USING을 사용
FROM 테이블명
JOIN 테이블명 USING (같은컬럼명)
*/
--EMPLOYEE 테이블과 JON 테이블을 참조해서
--사번, 이름, 직급코드, 직급명 조회

--EMPLOYEE 테이블과 JON 테이블에서 JOB_CODE로 컬럼명이 같은 상황
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE;
/*
EMP_ID  EMP_NAME    JOB_CODE
200	    선동일	    J1
201	    송종기	    J2
202	    노옹철	    J2
203	    송은희	    J4
204	    유재식	    J3
205	    정중하	    J3
206	    박나라	    J7
207	    하이유	    J5
208	    김해술	    J5
209	    심봉선	    J3
*/
SELECT * FROM JOB;
/*
JOB_CODE    JOB_NAME
J1	        대표
J2	        부사장
J3	        부장
J4	        차장
J5	        과장
J6	        대리
J7	        사원
*/

--ANSI 표준 연결방법
--연결에 사용할 컬럼이 같은 경우 USING(컬럼명) 사용
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);
/*
ASNI 표준 규격으로 작성해서 나온 조회 결과
EMP_ID  EMP_NAME    JOB_CODE    JOB_NAME
200	    선동일	    J1	        대표
201	    송종기	    J2	        부사장
202	    노옹철	    J2	        부사장
203	    송은희	    J4	        차장
204	    유재식	    J3	        부장
205	    정중하	    J3	        부장
206	    박나라	    J7	        사원
207	    하이유	    J5	        과장
208	    김해술	    J5	        과장
209	    심봉선	    J3	        부장
*/

--ORACLE 표준 연결방법
SELECT e.EMP_ID, e.EMP_NAME, e.JOB_CODE, j.JOB_NAME
FROM EMPLOYEE e, JOB j
WHERE e.JOB_CODE = j.JOB_CODE;
/*
ORACLE 표준 규격으로 작성해서 나온 조회 결과
EMP_ID  EMP_NAME    JOB_CODE    JOB_NAME
200	    선동일	    J1	        대표
201	    송종기	    J2	        부사장
202	    노옹철	    J2	        부사장
203	    송은희	    J4	        차장
204	    유재식	    J3	        부장
205	    정중하	    J3	        부장
206	    박나라	    J7	        사원
207	    하이유	    J5	        과장
208	    김해술	    J5	        과장
209	    심봉선	    J3	        부장
*/



/*
NATURAL JOIN(자연 조인)
JOIN에 별칭을 설정해서 테이블 표현하기

동일한 타입과 이름을 가진 컬럼이 있는 테이블 간의 조인을 표현한 방법
반드시 두 테이블 간에 동일한 컬럼명, 타입을 가진 컬럼이 필요
                                                  없을 경우 교차 조인이 됨

EMPLOYEE.JOB_CODE   (CHAR(2))
JOB.JOB_CODE        (CHAR(2))
컬럼명, 자료형이 모두 일치해야 자연 조인의 대상이 됨

SELECT 컬럼명, 컬럼명, 컬럼명, ...
FROM 테이블명
NATURAL JOIN 테이블명
-----자연조인보다 별칭을 설정해서 테이블 표현하는 방법이 더 많이 사용 됨

JOIN에 별칭을 설정해서 테이블 표현하기
JOIN과 FROM에서 테이블을 설정할 때
쿼리를 좀 더 간결하고 읽기 쉽게 만드는 방법
테이블을 다수, 여러개 참조할 때 유용

사용방법
1)
SELECT 테이블명1.컬럼명A, 테이블명2.컬럼명A
FROM 테이블명1, 테이블명2
WHERE 테이블명1.컬럼명A = 테이블명2.컬럼명A

2)
SELECT A.컬럼명C, B.컬럼명C
FROM 테이블명1 A, 테이블명2 B
WHERE A.컬럼명C = B.컬럼명C



*/
