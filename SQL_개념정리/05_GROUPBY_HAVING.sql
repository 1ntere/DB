/*
[SELECT문 정리]

5   SELECT 컬럼명1, 컬럼명2 AS "별칭", 컬럼명3, ...
1   FROM 테이블명
2   WHERE 컬럼명 조건식(함수식|비교연산자|비교값)
3   GROUP BY 그룹을묶을컬럼명
4   HAVING 조건식(그룹함수식|비교연산자|비교값)
6   ORDER BY  컬럼명|별칭|컬럼순번 정렬방식

--SELECT~WHERE절 까지만 존재할 경우
3   SELECT 컬럼명1, 컬럼명2 AS "별칭", 컬럼명3, ...
1   FROM 테이블명
2   [WHERE 컬럼명 조건식(함수식|비교연산자|비교값)]

--WHERE 없이 SELECT~ORDER BY절까지 존재할 경우
2   SELECT 컬럼명1, 컬럼명2 AS "별칭", 컬럼명3, ...
1   FROM 테이블명
3   ORDER BY  컬럼명|별칭|컬럼순번 정렬방식

--SELECT~ORDER BY절까지 존재할 경우
3   SELECT 컬럼명1, 컬럼명2 AS "별칭", 컬럼명3, ...
1   FROM 테이블명
2   WHERE 컬럼명 조건식(함수식|비교연산자|비교값)
4   ORDER BY  컬럼명|별칭|컬럼순번 정렬방식
*/

/*
[GROUP BY절]

같은 값들이 여러 개 기록된 컬럼을 가지고 같은 값들을 하나의 그룹으로 묶은 것
여러 개의 값을 묶어서 하나로 처리할 목적으로 사용
그룹으로 묶은 값에 대해서 SELECT 절에서 그룹함수를 사용

그룹함수는 단 한개의 결과 값만 산출하기 때문에 그룹이 여러 개일 경우 오류 발생
여러 개의 결과 값을 산출하기 위해 그룹 함수가 적용된 그룹의 기준을 ORDER BY 절에 기술해서 사용
*/

--EMPLOYEE 테이블에서 부서코드, 부서별 급여 합계 조회
SELECT DEPT_CODE, SUM(SALARY) AS "부서별 급여의 합"
     --DEPT_CODE, SUM(SALARY) : 부서코드와 각 부서의 급여 합계를 선택
FROM EMPLOYEE
GROUP BY DEPT_CODE;
       --DEPT_CODE : DEPT_CODE를 기준으로 그룹을 생성
       --            동일한 부서코드를 가진 사람들을 하나의 그룹으로 묶고
       --            각 그룹에 급여의 합인 SUM(SALARY)를 적용해서
       --            해당 부서의 모든 직원의 급여 합계를 계산한 것
/*
DEPT_CODE   부서별 급여의 합
NULL        5210000
D1	        7820000
D9	        17700000
D5	        15760000
D6	        10100000
D2	        6520000
D8	        6986240
*/

--EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수 조회
--1. SELECT 절에서 부서코드랑 보너스 사원수 카운트 진행
SELECT DEPT_CODE, COUNT(*) AS "보너스받은사원수"
--2. EMPLOYEE 테이블에서 조회
FROM EMPLOYEE
--3. WHERE 절을 통해 보너스를 받은 사람만 보자
WHERE BONUS IS NOT NULL
--4. 각 부서를 기준으로 보너스를 몇 명이나 받았는지 계산하자
GROUP BY DEPT_CODE
--5. ORDER BY를 통해 부서코드 순으로 정렬
ORDER BY DEPT_CODE;
/*
DEPT_CODE   보너스 받은 사원 수
NULL        1
D1	        2
D5	        2
D6	        1
D8	        2
D9	        1
*/

--EMPLOYEE 테이블에서 부서코드가 D5, D6인 부서의 평균 급여 조회
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) AS "부서별 평균 급여"
                --FLOOR(AVG(SALARY)) : 내림(평균(급여))
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5', 'D6')
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

/*
여러 컬럼을 묶어서 그룹으로 지정 가능

★ GROUP BY 사용시 주의할 점
SELECT문에 GROUP BY절을 사용할 경우
SELECT 절에 명시한 조회 컬럼 중 그룹 함수가 적용되지 않은 컬럼은 모두 GROUP BY절에 작성해야 함

*/
--EMPLOYEE 테이블에서 부서별로 같은 직급인 사원의 급여 합계를 조회하고
--부서코드를 오름차순으로 정렬
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
       --DEPT_CODE : 같은 부서코드(DEPT_CODE)
                  --JOB_CODE : 같은 직무코드(JOB_CODE)
       --DEPT_CODE, JOB_CODE : DEPT_CODE안에서 같은 JOB_CODE끼리 급여 합계 계산
ORDER BY DEPT_CODE;
/*
EMPLOYEE 테이블에서 부서코드(DEPT_CODE), 직급코드(JOB_CODE) 각 코드 별로 급여 합계 계산해서 그룹화 하고
부서코드 순서대로 정렬
D1  	J6	6440000
D1  	J7	1380000
D2	    J4	6520000
D5	    J3	3500000
D5	    J5	8460000
D5	    J7	3800000
D6	    J3	7300000
D6	    J4	2800000
D8  	J6	6986240
D9	    J1	8000000
D9  	J2	9700000
NULL	J6	2320000
NULL	J7	2890000

예를 들어 ㅇㅇ초등학교라는 테이블 존재, 컬럼 1반, 2반 존재
각 반의 총 학생수가 궁금 - 반, 성별, 총 학생수

SELECT 반, 성별, SUM(*) AS "총 학생수"
FROM oo초등학교
GROUP BY 반, 성별
ORDER BY 반;--반의 숫자로 오름차순 정렬
*/


/*
WHERE절      : 지정된 테이블에서 어떤 행 만을 조회 결과로 삼을 것인지 조건을 지정하는 구문
               테이블 내에서 특정 컬럼만 뽑아서 사용하겠다는 조건문

HAVING절     : 그룹 함수로, 그룹에 대한 조건을 설정할 때 사용
               그룹에 대한 조건, 어떤 그룹만 조회하겠다     

WHERE절의 경우 조건에 맞는 값만 가지고 온 후 보여준다면
HAVING절의 경우 모든 값을 확인하고 조건에 부합하는 그룹만 보여줌
*/
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--부서별 평균 급여가 3000000원 이상인 사원만 조회하고 오름차순 정렬
--급여가 3000000원 이상인 직원들만 대상으로 각 부서의 평균 급여 계산
--그룹화 되기 전에 필터링
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
WHERE SALARY >= 3000000
    --SALARY >= 3000000 : 일단 급여가 3000000원 이상인 직원만 간추림
GROUP BY DEPT_CODE
       --DEPT_CODE : 부서코드로 그룹화
ORDER BY DEPT_CODE;
/*
D1	3660000
D5	3630000
D6	3650000
D9	5900000
*/

--부서별 평균 급여가 3000000원 이상인 부서만 조회하고 부서코드 오름차순 정렬
--모든 직원들을 대상으로 그룹화한 후, 각 부서별로 평균 급여를 계산
--HAVING절을 이용해서 계산된 평균 급여가 3000000원 이상인 부서만 필터링
--모든 급여를 고려해서 평균을 계산한 다음 조건에 맞는 결과만 필터링
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
--WHERE SALARY >= 3000000
GROUP BY DEPT_CODE
       --DEPT_CODE : 모든 직원을 일단 부서코드로 그룹화
HAVING AVG(SALARY) >= 3000000
     --AVG(SALARY) >= 3000000 : 부서 중에서 평균 급여가 3000000원이 넘는 부서만 필터링
ORDER BY DEPT_CODE;
/*
D6	3366666.66666666666666666666666666666667
D9	5900000
*/

/*
집계함수 (ROLLUP, CUBE)
그룹 별 산출한 결과 값의 집계를 계산하는 함수
GROUP BY 절에서만 작성할 수 있는 함수
WHERE, ORDER, SELECT에서 사용하지 않고 GROUP BY에서 작성
*/

/*
ROLLUP 함수 : 그룹별로 중간 집계를 처리하는 함수
그룹별로 묶여진 값에 대한 '중간 집계'와 '총 집계'를 계산해서 자동으로 추가하는 함수
* 인자로 전달받은 그룹 중에서 가장 먼저 지정한 그룹별 합계와 총 합계를 구하는 함수
*/
--EMPLOYEE 테이블에서 각 부서에 소속된 직급별 급여 합과 부서별 급여 합과 전체 직원 급여 총합 조회
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE;
/*
EMPLOYEE 테이블에서 DEPT_CODE와 JOB_CODE를 기준으로 SALARY 합계를 구한 것
특정 그룹의 합계와 전체 그룹의 합계
중간 중간에 직급에 NULL이 들어가 있는데 이때의 값은 부서코드가 동일한 모든 행의 합계
부서    직급     급여 합
D1	    J6	    6440000 --D1부서의 J6직급의 급여 합
D1  	J7  	1380000 --D1부서의 J7직급의 급여 합
D1  	NULL	7820000     --D1부서의 전체(J6, J7) 급여 합
D2  	J4  	6520000 --D2부서의 J4직급의 급여 합
D2	    NULL	6520000     --D2부서의 전체(J4) 급여 합
D5  	J3  	3500000 --D5부서의 J3직급의 급여 합
D5  	J5  	8460000 --D5부서의 J5직급의 급여 합
D5  	J7  	3800000 --D5부서의 J7직급의 급여 합
D5  	NULL	15760000     --D5부서의 전체(J3, J5, J7) 급여 합
D6  	J3  	7300000 --D6부서의 J3직급의 급여 합
D6  	J4	    2800000 --D6부서의 J4직급의 급여 합
D6  	NULL	10100000     --D6부서의 전체(J3, J4) 급여 합
D8	    J6	    6986240 --D8부서의 J6직급의 급여 합
D8  	NULL	6986240      --D8부서의 전체(J6) 급여 합
D9	    J1	    8000000 --D9부서의 J1직급의 급여 합
D9	    J2	    9700000 --D9부서의 J2직급의 급여 합
D9	    NULL	17700000     --D9부서의 전체(J1, J2) 급여 합
NULL	J6	    2320000 --NULL부서의 J6직급의 급여 합
NULL	J7	    2890000 --NULL부서의 J7직급의 급여 합
NULL	NULL	70096240        --전체 데이터의 급여 합계(총 계)

예시

카페의민족 테이블

빠나쁘레소   아메리카노 총 매출
            카페라떼 총 매출
            아메리카노 + 카페라떼 총 매출
멕아커피     아메리카노 총 매출
            카페라떼 총 매출
            아메리카노 + 카페라떼 총 매출
*/

/*
CUBE 함수 : 그룹별 산출한 결과를 집계하는 함수
* 그룹으로 지정된 모든 그룹에 대한 집계와 총 합계를 구함
*/
--EMPLOYEE 테이블에서 각 부서마다 직급별 급여 합, 부서별 급여 합 조회
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE;
/*
CU?BE는 ROLLUP보다 더 포괄적인 집계 결과 생성
CUBE는 가능한 모든 것을 조합하고 조합에 해당 결과와 총합을 계산
부서    직급     급여 합
D1	    J6	    6440000 --D1부서의 J6직급의 급여 합
D1  	J7  	1380000 --D1부서의 J7직급의 급여 합
D1  	NULL	7820000     --D1부서의 전체(J6, J7) 급여 합
D2  	J4  	6520000 --D2부서의 J4직급의 급여 합
D2	    NULL	6520000     --D2부서의 전체(J4) 급여 합
D5  	J3  	3500000 --D5부서의 J3직급의 급여 합
D5  	J5  	8460000 --D5부서의 J5직급의 급여 합
D5  	J7  	3800000 --D5부서의 J7직급의 급여 합
D5  	NULL	15760000     --D5부서의 전체(J3, J5, J7) 급여 합
D6  	J3  	7300000 --D6부서의 J3직급의 급여 합
D6  	J4	    2800000 --D6부서의 J4직급의 급여 합
D6  	NULL	10100000     --D6부서의 전체(J3, J4) 급여 합
D8	    J6	    6986240 --D8부서의 J6직급의 급여 합
D8  	NULL	6986240      --D8부서의 전체(J6) 급여 합
D9	    J1	    8000000 --D9부서의 J1직급의 급여 합
D9	    J2	    9700000 --D9부서의 J2직급의 급여 합
D9	    NULL	17700000     --D9부서의 전체(J1, J2) 급여 합
----------------------------------------------------여기까진 ROLLUP과 동일한 데이터
NULL	J1	    8000000      --모든 부서의 J1 직급의 전체 급여 합
NULL	J2	    9700000      --모든 부서의 J2 직급의 전체 급여 합
NULL	J3	    10800000     --모든 부서의 J3 직급의 전체 급여 합
NULL	J4	    9320000      --모든 부서의 J4 직급의 전체 급여 합
NULL	J5	    8460000      --모든 부서의 J5 직급의 전체 급여 합
NULL	J6	    15746240     --모든 부서의 J6 직급의 전체 급여 합
NULL	J7	    8070000      --모든 부서의 J7 직급의 전체 급여 합
NULL	NULL	70096240         --전체 데이터의 급여 합계(총 계)
*/

--UNION INTERSECT MINUS