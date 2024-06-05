/*
함수

컬럼값이나 지정된 값을 읽어 연산한 결과를 반환하는 것

단일 행 함수     : N 개의 행의 커럶 값을 전달하여 N 개의 결과가 반환

그룹 함수        : N 개의 행의 컬럼 값을 전달하여 1개의 결과가 반환
                  (그룹의 수가 늘어나면 그룹의 수 만큼 결과를 반환)

함수는 SELECT절, WHERE절, ORDER BY절, HAVING절에서 사용 가능

SELECT절 : 새로운 테이블에 표시가 될 행을 정리해 놓은 컬럼
            찾는 기준이 아닌, 눈으로 표기되는 총 합, 계산 결과 등에 대한 것을 정리해놓은 컬럼
            -> 정리해서 보여주자!
WHERE절 : 찾는 조건을 작성해줌
            길이, 크기, 결과가 조건에 부합하는 결과만 볼 수 있도록 설정
            -> 해당 행에서 내가 원하는 조건에 부합하는 값 만 보여줘!
*/

/*****단일행 함수*****/
--문자열 관련 함수
--LENGTH(문자열|컬럼명) : 문자열의 길이 반환
SELECT 'HELLO WORLD', LENGTH('HELLO WORLD')
                    --LENGTH('HELLO WORLD') : 띄어쓰기 포함하여 11글자라고 표시됨
FROM DUAL;

--EMPLOYEE 테이블에서 사원명, 이메일, 이메일 길이 조회
--이메일 길이 오름차순(작은 것부터 큰 순서대로) 조회
SELECT EMP_NAME, EMAIL, LENGTH(EMAIL) AS "이메일 길이"
FROM EMPLOYEE
WHERE LENGTH(EMAIL) <= 12
    --LENGTH(EMAIL) <= 12 : 12길이보다 이하인 이메일만 조회
ORDER BY "이메일 길이";
--ORDER BY "이메일 길이" : 오름차순으로 조회

--INSTR(문자열|컬럼명, '찾을 문자열' [,찾는 것을 시작할 위치 [, 순번] ] )

--찾을 시작 위치부터 지정된 순번째 찾은 문자열의 시작 위치를 반환

--LIKE와 INSTR의 차이점
--LIKE : @가 들어있는지 검색
--INSTR : @가 몇번째에 있는지 검색

--문자열에서 맨 앞에 있는 'B'의 위치를 조회
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA', 'B')--5 : B가 첫 번째로 나타나는 위치는 5이다.
                     --INSTR('AABAACAABBAA', 'B') : B가 문자열에서 처음 나타나는 위치
FROM DUAL;--5
   --DUAL : 존재하지 않는 테이블로 어떤 값을 테스트할 때 사용

--문자열에서 5부터 검색해서 첫 번째로 찾은 'B'의 위치 조회
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA', 'B', 5)--9 : B가 두 번째로 나타나는 위치는 9이다.
                     --INSTR('AABAACAABBAA', 'B', 5) : 5번째 자리 이후에 처음 찾은 'B'의 위치를 조회
                     --INSTR('AABAACAABBAA', 'B') : 처음부터 검색해서 처음 찾은 'B'의 위치를 조회
FROM DUAL;--9

--만약에 AABAACAABBAA가 아니라 AAB AAC AA BB AA였다면 --12가 나옴
SELECT 'AAB AAC AA BB AA', INSTR('AAB AAC AA BB AA', 'B', 5)
FROM DUAL;--12가 나옴

--    문자열에서 5부터 검색해서 두 번째로 찾은 'B'의 위치 조회
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA', 'B', 5, 2)--10 : B가 세 번째로 나타나는 위치는 10이다.
FROM DUAL;--10

--SUBSTR(문자열|컬럼명, 시작위치 [,길이])

--문자열을 시작 위치부터 지정된 길이만큼 잘라내서 반환
--길이를 작성하지 않은 경우 시작 위치부터 끝까지 잘라내서 반환

--시작 위치, 자를 길이 지정
SELECT SUBSTR('ABCDE', 2, 3)
                     --2 : 2번째 자리에 존재하는 B부터 시작해서
                        --3 : 3개만 가지고 오겠다
FROM DUAL;--BCD

--시작 위치만 지정하고, 자를 길이는 미지정
SELECT SUBSTR('ABCDE', 4)
                     --4 : 4번째 자리에 존재하는 D부터 시작해서 마지막까지 모두 가지고 오겠다
FROM DUAL;--DE

--시작위치의 부호를 - 로 설정하면 뒤에서 부터 가져옴
--앞에서부터 값을 가지고 올 때는 + 로 작성해주지만
--뒤에서부터 값을 가지고 오길 원할 때는 - 로 작성해주면 됨
SELECT SUBSTR('ABCDE', -3)
                     ---3 : 뒤에서 부터 3자리를 가져옴
FROM DUAL;--CDE

--EMPLOYEE 테이블에서 사원명, 이메일 아이디를 가져오는데
--이메일 아이디에서 @ 앞에 있는 아이디만 가지고 오고, 이메일 아이디를 오름차순 조회
SELECT EMP_NAME, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) AS "이메일 아이디"
               --SUBSTR(EMAIL, 1) : EMAIL을 모두 출력함
                                --INSTR(EMAIL, '@') : EMAIL에서 @위치를 찾음
               --SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')) : EMAIL을 처음부터 @까지 출력함, "아이디+@" 형태로 출력됨
               --SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) : EMAIL에서 @위치를 찾고, @를 지우고 "아이디"만 출력
FROM EMPLOYEE
ORDER BY "이메일 아이디";

/*****그룹 함수*****/
--1. COUNT : 행의 총 갯수를 셀 때 사용하는 함수

/*
COUNT 사용 방법
COUNT(*) : 조회된 모든 행의 개수 반환 -> 이름, 주소와 같은 항목이 몇 개 있는가?
COUNT(컬럼명) : 지정된 컬럼 값이 NULL이 아닌 행의 개수를 반환
                NULL은 제외하고 개수를 작성하겠다는 의미
COUNT(DISTINCT 컬럼명) : 지정된 컬럼에서 중복 값을 제외한 행의 개수 반환
*/

--EMPLOYEE 테이블 전체 행의 개수
SELECT COUNT(*)
FROM EMPLOYEE;--23

--전화번호가 있는 사원의 수
SELECT COUNT(*)
FROM EMPLOYEE
WHERE PHONE IS NOT NULL;--20

--좀 더 가볍게 WHERE을 사용하지 않고 전화번호가 있는 사원의 수
SELECT COUNT(PHONE)
FROM EMPLOYEE;--20

--2. AVG : 평균 조회
--EMPLOYEE 테이블에서 모든 사원의 평균 급여 조회
SELECT AVG(SALARY) AS "평균 급여"
FROM EMPLOYEE;
--D5 부서의 평균 급여 조회
SELECT AVG(SALARY) AS "D5 부서 평균 급여"
FROM EMPLOYEE
WHERE DEPT_CODE  = 'D5';
--부서별 평균 급여 조회
SELECT DISTINCT DEPT_CODE AS "부서", AVG(SALARY) AS "평균 급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;
/*
★ 에러 발생
SELECT DISTINCT DEPT_CODE AS "부서", AVG(SALARY) AS "평균 급여"
FROM EMPLOYEE;
★ 오류 zhem
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
131행, 17열에서 오류 발생
★ 추후 GROUP BY를 사용해야 함
*/

/*숫자 관련 함수*/
--CEIL(올림), ROUND(반올림), FLOOR(내림), TRUNC(버림)
SELECT (AVG(SALARY))
FROM EMPLOYEE;
--3047662.60869565217391304347826086956522

--CEIL 올림
SELECT CEIL(AVG(SALARY))
FROM EMPLOYEE;
--3047663

--ROUND 반올림
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;
--3047663

--FLOOR 내림
SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE;
--3047662

--TRUNC 버림
SELECT TRUNC(AVG(SALARY))
FROM EMPLOYEE;
--3047662

--FLOOR와 TRUNC의 차이
--1) FLOOR : 주어진 숫자보다 작거나 가장 큰 정수를 반환
--소수부분은 무조건 버림
SELECT FLOOR(5.7) FROM DUAL;
--결과 : 5
SELECT FLOOR(-5.7) FROM DUAL;
--결과 : -6
SELECT FLOOR(5.789,1) FROM DUAL;
--에러발생 : 소수 표현 X

--2) TRUNC : 숫자의 소수점을 잘라내는 역할
--자르고자 하는 자릿수를 지정, 지정하지 않으면 기본 값 0
SELECT TRUNC(5.7) FROM DUAL;
--결과 : 5
SELECT TRUNC(-5.7) FROM DUAL;
--결과 : -5
SELECT TRUNC(5.789,1) FROM DUAL;
--결과 : 5.7
SELECT TRUNC(5.789,2) FROM DUAL;
--결과 : 5.78

/*
TRIM
공백 관련 함수

TRIM({[옵션] 문자열|컬럼명 FROM] 문자열|컬럼명)

주어진 문자열의 앞쪽|위쪽|양쪽에 존재하는 지정된 문자열 제거
-- 옵션 앞 쪽 (LEADING)
       뒤 쪽 (TRAILING)
       양 쪽 (BOTH 기본값)
*/

SELECT '     점     심     ', TRIM(LEADING' 'FROM'     점     심     ') --앞 쪽 공백 제거
FROM DUAL;--점     심     

SELECT '     점     심     ', TRIM(TRAILING' 'FROM'     점     심     ') --뒤 쪽 공백 제거
FROM DUAL;--     점     심 : 육안 상으로는 뒤에 공백이 없어진지 모르지만 실제로는 뒤 쪽 공백이 제거되어 있음

SELECT '     점     심     ', TRIM(BOTH' 'FROM'     점     심     ') --양 쪽 공백 제거
FROM DUAL;--점     심 :

SELECT '     점     심     ', TRIM(' 'FROM'     점     심     ') --(기본값) 양 쪽 공백 제거
FROM DUAL;--점     심

--앞 쪽, 뒤 쪽, 양 쪽 공백 제거 한번에 사용하기
SELECT '     점     심     ',
        TRIM(LEADING' 'FROM'     점     심     '), --앞 쪽 공백 제거
        TRIM(TRAILING' 'FROM'     점     심     '), --뒤 쪽 공백 제거
        TRIM(BOTH' 'FROM'     점     심     ') --양 쪽 공백 제거
FROM DUAL;--점     심
/*
★ 오류 발생
SELECT '     점     심     ', TRIM(LEADING'  'FROM'     점     심     ')
FROM DUAL;
★ 해결 방법
SELECT '     점     심     ', TRIM(LEADING' 'FROM'     점     심     ')
FROM DUAL;
===
TRIM(LEADING' ' ...)
'' 안에 1개의 글자만 들어가야 한다.
현재는 '' 안에 띄어쓰기가 2글자 들어가 있음
★ 오류 코드
ORA-30001: trim set should have only one character
30001. 00000 -  "trim set should have only one character"
*Cause:    Trim set contains more or less than 1 character. This is not
           allowed in TRIM function.
*/

/*
REPLACE : 특정 문자열을 대체할 때 사용

사용방법
(문자열|컬럼명, 찾을 문자열, 바꿀 문자열)
*/

--NATIONAL 테이블에서 한국으로 적혀있는 글자를 대한민국으로 변경하기
SELECT *
FROM NATIONAL;

SELECT NATIONAL_CODE, NATIONAL_NAME, REPLACE(NATIONAL_NAME, '한국', '대한민국')
FROM NATIONAL;

/*
TO_NUMBER

Oracle dql 존재
문자열을 숫자 데이터 형식으로 변환하는데 사용
추후에 java int 값이 아니라 String으로 값이 넘어오고
추후 변환이 필요할 때는 TO_NUMBER를 사용할 일이 있을 수 있음
*/
--DUAL 가상 테이블을 이용해서 단순히 문자열을 숫자로 변환하는 코드
SELECT TO_NUMBER('12345')
FROM DUAL;