/*
PL / SQL
SQL의 조작 언어
SQL 단점을 보완해서 SQL 문장 내에서 변수의 정의 / 조건처리 / 반복처리 등 지원
ORACLE 자체에 내장 되어있는 절차적 언어

사용법
DECLARE SECTION
    변수나 상수를 선언하는 부분

EXECUTABLE SECTION BEGIN 으로 시작
    제어문, 반복문, 함수 정의 등 로직을 기술
    
    System.out.println(""); 대신
    PS/SQL에서는 DBMS_OUTPUT.PUT_LINE(':'||);를 사용한다
    
    예외가 없는 경우
    END;를 통해 마무리한다.

EXCEPTION SECTION EXCEPTION 으로 시작
    예외사항 발생 시 해결하기 위한 문장을 기술

자바처럼 코딩
한 문장이 끝날 때 마다 ;(세미콜론) 붙여주어야 함
*/
DECLARE
    EMP_ID NUMBER;
    EMP_NAME VARCHAR2(30); --변수 선언
BEGIN
    EMP_ID := 888;
    EMP_NAME := '홍길동';
    
    DBMS_OUTPUT.PUT_LINE('EMP_ID :'||EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME :'||EMP_NAME);
END;