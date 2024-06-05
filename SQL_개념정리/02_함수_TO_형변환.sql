/*
형변환(Parsing) 함수

문자열(CHAR, VARCHAR2) <-> 숫자(NUMBER)
문자열(CHAR, VARCHAR2) <-> 날짜(DATE)
숫자(NUMBER) ------------> 날짜(DATE)
*/

/*
TO_CHAR(날짜|숫자 [,포멧]) : 문자열로 변환

숫자 -> 문자열 포멧
1) 9 : 숫자 한 칸 의미, 오른쪽 정렬
2) 0 : 숫자 한 칸 의미, 오른쪽 정렬, 빈칸에 0을 추가
3) L : 현재 시스템이나 DB에 설정된 나라의 화폐 기호
4) , : 숫자의 자릿수 구분
*/
--DUAL 가상 테이블을 이용해서 조회
SELECT 1234, TO_CHAR(1234)
FROM DUAL;
           --TO_CHAR(1234) : 숫자 -> 문자열
/*
1234    TO_CHAR(1234)
1234	1234
*/
           
--데이터 타입 변경 시작
SELECT 1234, TO_CHAR(1234,'99999999')
FROM DUAL;
           --TO_CHAR(1234,'99999999') : 9가 8개이고, 9는 오른쪽 정렬을 의미하므로
           --                           1234 앞에 공백 4칸을 생성
/*
1234    TO_CHAR(1234)
1234	     1234
*/

SELECT 1234, TO_CHAR(1234,'00000000')
FROM DUAL;
           --TO_CHAR(1234,'00000000') : 0이 8개이고, 0은 오른쪽 정렬, 빈칸에 0 출력을 의미하므로
           --                           1234 앞에 0을 4개 생성
/*
1234    TO_CHAR(1234)
1234	 00001234
*/

--숫자 -> 문자열 변환 시 주의사항
--지정된 칸 수가 숫자 길이보다 적으면 전부 #으로 변환되어 출력
SELECT 1234, TO_CHAR(1234,'000')
FROM DUAL;
           --TO_CHAR(1234,'000') : 0이 3개이고, 0은 오른쪽 정렬, 빈칸에 0 출력을 의미하지만
           --                      지정한 칸 수(3칸)가 1234(4칸)보다 작으므로 전부 #으로 변환되어 출력
/*
1234    TO_CHAR(1234)
1234	####
*/

--화폐기호 + 자릿수 구분
SELECT
    TO_CHAR(123456789, 'L999999999'), --L9아홉개
    --'L999999999' : L의 경우 현재 시스템에서 사용하는 화폐 단위 기호, 한국 = ￦
    TO_CHAR(123456789, '$999999999'), --$9아홉개
    TO_CHAR(123456789, '$999,999,999') --$9세개,9세개,9세개
FROM DUAL;
/*
￦123456789	 $123456789	 $123,456,789
*/

--모든 사원의 연봉 조회
--현재 화폐단위 , 사용해서 조회
SELECT EMP_NAME AS "이름", TO_CHAR(SALARY*12, 'L999,999,999') AS "연봉"
FROM EMPLOYEE;
/*
이름              연봉
선동일	         ￦96,000,000
송종기	         ￦72,000,000
노옹철	         ￦44,400,000
*/

--날짜
--1) DUAL 테이블을 사용해서 현재 날짜(SYSDATE), YYYY-MM-DD
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;
/*
24/06/05	2024-06-05
*/

--2) DUAL 테이블을 사용해서 현재 날짜(SYSDATE), YYYY-MM-DD 수요일
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY')
FROM DUAL;
/*
24/06/05	2024-06-05 수요일
*/

--3) DUAL 테이블을 사용해서 현재 날짜(SYSDATE), YYYY-MM-DD (수)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY)')
                                            --DY : DAY가 '수요일'로 표기될 때, DY는 '수'만 표기
FROM DUAL;
/*
24/06/05	2024-06-05 (수)
*/

--4) DUAL 테이블을 사용해서 현재 날짜(SYSDATE), YYYY-MM-DD (수) 오전 시:분:초
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY) AM HH:MI:SS')
                                                      --MI : SQL에서는 대소문자 구별을 안하기 때문에
                                                      --     다른 언어와 달리 분을 'mm'으로 사용하지 않고
                                                      --     'MI'로 사용함
FROM DUAL;
/*
24/06/05	2024-06-05 (수) 오전 10:24:36
*/

--5) DUAL 테이블을 사용해서 현재 날짜(SYSDATE), YYYY년 MM월 DD일 오전 00시 00분 00초
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" AM HH"시" MI"분" SS"초"')
FROM DUAL;
/*
24/06/05	2024년 06월 05일 오전 10시 24분 51초
*/

--RR, YY 차이점
--년도가 두 자리만 작성이 되어 있는 경우 50을 기준으로 살펴 봄
--50미만 : Y, R 둘 다 누락된 연도 앞부분에 현재 2000년대 세기를 추가
--50이상 : Y 현재 세기(2000년대 기준 이후), R 이전 세기(1900년대 기준)

--1)50 미만 확인
SELECT
    TO_DATE('49-12-01', 'YY-MM-DD') AS "YY", --2049
    TO_DATE('49-12-01', 'YY-MM-DD') AS "RR"  --2049
FROM DUAL;
/*
49/12/01	49/12/01
*/

--2) 50 이상 확인
SELECT
    TO_DATE('50-12-01', 'YY-MM-DD') AS "YY",  --2050
    TO_DATE('50-12-01', 'YY-MM-DD') AS "RR"   --1950
FROM DUAL;
/*
50/12/01	50/12/01
*/

/*
TO_DATE(문자열|숫자 [,포멧]) : 문자열 또는 숫자를 날짜 형식으로 변환
*/
--DUAL 가상 테이블 문자열이 날짜를 표현하는 형식이면 형식 지정 없이 바로 변경 가능
SELECT TO_DATE('2024-05-05')
FROM DUAL;
/*
24/05/05
*/

--날짜-월-년 으로 표기
SELECT TO_DATE('06-05-2024', 'DD-MM-YYYY')
FROM DUAL;
     --TO_DATE('06-05-2024', 'DD-MM-YYYY') : 06-05-2024를 TO_DATE형식으로 년/월/일로 변경하겠다
/*
24/05/06
*/

SELECT TO_DATE('05월 27일 월요일 12시 50분', 'MM"월" DD"일" DAY HH"시" MI"분"')
FROM DUAL;
     --TO_DATE('05월 27일 ...', 'MM"월" ...') : TO_DATE형식으로 년/월/일로 변경하겠다

--숫자 -> 날짜
SELECT TO_DATE(20240605, 'YYYYMMDD')
FROM DUAL;
     --TO_DATE(20240605, 'YYYYMMDD') : TO_DATE형식으로 년/월/일로 변경하겠다