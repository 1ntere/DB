/*
ROWNUM
쿼리의 결과 집합에서 각 행에 순차적으로 1부터 시작하는 번호를 부여

결과 집합의 크기를 제한
*/
--예제1) 상위 5개의 행만 선택하는 예제
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5;
/*
ROWNUM  EMP_ID  EMP_NAME    SALARY
1	    200	    선동일	    8000000
2	    201	    송종기	    6000000
3	    202	    노옹철	    3700000
4	    203	    송은희	    2800000
5	    204	    유재식	    3400000
*/

--정렬된 결과 집합에서 상위 5개의 행만 선택
--예제2) 급여가 높은 상위 5명의 직원 선택
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM (SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;
/*
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM (SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC);
를 진행하면 SALARY DESC(내림차순)으로 정렬되어 모두 출력 된다.
*/
--ROWNUM은 무조건 1부터 시작하기 때문에 5 이후는 처음부터 나올 수 없는 조건

--ROWNUM을 이용해서 월급이 가장 높은 3명을 조회
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;

SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 3
ORDER BY SALARY DESC;
/*
★ 오류가 발생한 코드
SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 3
ORDER BY SALARY DESC;
★ 오류코드
에러는 아니므로 오류 코드 없음
★ 원인
ROWNUM을 이용해서 월급이 가장 높은 3명을 뽑으려 했지만 되지 않음
테이블의 맨 위에 있던 3명이 출력됨
★ 문제를 해결한 코드
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;
★ 해결방안
FROM에 반드시 데이터를 조회할 테이블의 이름만 들어가야 하는 것은 아니고
☆서브쿼리☆도 들어갈 수 있다.
따라서, 위 코드와 같이 FROM에 서브쿼리를 통해 급여를 먼저 내림차순 정렬해주고
SELECT절에서 컬럼 선택은 마지막에 한다고 생각하면 된다.
*/

/*
NVL
NULL로 되어 있는 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
사용법
SELECT NVL(원하는컬럼명, 컬럼값이NULL이면표기하고싶은값), ...
FROM 테이블명

NVL2
NULL이 아닌 컬럼의 값과 NULL로 되어 있는 컬럼의 값을 각각 지정한 숫자 또는 문자로 변경해서 반환
사용법
SELECT NVL(원하는컬럼명, 컬럼값이NULL이아닌경우변경할값, 컬럼값이NULL이면표기하고싶은값), ...
FROM 테이블명
*/
--EMPLOYEE 테이블에서 사번, 이름, 전화번호 조회
--전화번호가 없으면 없음으로 조회
SELECT EMP_ID, EMP_NAME, NVL(PHONE, '없음') AS "전화번호"
FROM EMPLOYEE;

--EMPLOYEE 테이블에서 이름, 급여, 성과급(급여 * 보너스) 조회
--단, 성과급이 없으면 0으로 표시
SELECT EMP_NAME, SALARY, NVL(SALARY * BONUS, 0) AS "성과급"
FROM EMPLOYEE;

--EMPLOYEE 테이블에서 사번, 이름, 전화번호 조회
--전화번호가 없으면 없음으로 표기
--전화번호가 있으면 010********형식으로 변경해서 조회
SELECT EMP_ID, EMP_NAME, NVL2(PHONE, '010********' , '없음') AS "전화번호"
FROM EMPLOYEE;

--전화번호를 '01012345678' 형식으로 다시 변경해서 조회
SELECT EMP_ID, EMP_NAME, NVL2(PHONE, '010'||SUBSTR(PHONE, 4, 8) , '없음') AS "전화번호"
FROM EMPLOYEE;
/*
SELECT EMP_ID, EMP_NAME, NVL(PHONE, '없음') AS "전화번호"
FROM EMPLOYEE;
도 가능
*/