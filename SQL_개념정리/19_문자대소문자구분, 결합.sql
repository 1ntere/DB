/*
LOWER / UPPER / INITCAP

컬럼의 문자 혹은 문자열을 소문자 / 대문자 / 첫 글자만 대문자로 변환해서 반환
*/
--LOWER : 모두 소문자로 변환해서 적용
SELECT LOWER('Welcome tO My woRLd')
FROM DUAL;
/*
welcome to my world
*/

--UPPER : 모두 대문자로 변환해서 적용
SELECT UPPER('Welcome tO My woRLd')
FROM DUAL;
/*
WELCOME TO MY WORLD
*/

--INITCAP : 첫 글자만 대문자로 변환해서 적용
SELECT INITCAP('Welcome tO My woRLd')
FROM DUAL;
/*
Welcome To My World
*/

/*
문자 처리 함수 CONCAT
CONCAT : 컬럼의 문자 혹은 문자열을 두 개 전달받아 하나로 합친 후 반환
작성법
CONCAT(STRING, STRING)
*/
/*
CONCAT함수와 ||연산자의 차이점
CONCAT   : 두 개의 문자열을 결합, 두 개 이상은 불가능
           ex. 성 + 이름 합칠 때 사용
               성 + 미들네임 + 이름 은 불가능
||       : 두 개 이상의 문자열을 결합할 때 사용
작성법
string1 || string2 || string3, ... 여러개 결합 가능
*/
SELECT CONCAT ('가나다라', 'ABCD') FROM DUAL;

SELECT '가나다라'||'ABCD' FROM DUAL;