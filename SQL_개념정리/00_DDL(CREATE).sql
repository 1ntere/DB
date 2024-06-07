/*
올림    CEIL
반올림 ROUND
버림     FLOOR
오름차순 ASC(ASCENDING)
내림차순 DESC(DESCENDING)

자료형

NUMBER : 숫자형(정수, 실수)
                실수 자리 : 소수자리 몇 번째까지 가능한지
                NUMBER(2,2) -> 0.00 ~ 99.99까지 가능 

CHAR(크기) : 고정길이 문자형 -> 현재 사용 거의 하지 않음

VARCHAR   : 이전버전 사용 많이 하지 않음
VARCHAR2 : 최신버전 제일 많이 사용
                       가변길이 문자형
                       
        CHAR    VS   VARCHAR2
          고정                   가변
          
    예를들어 CHAR(10BYTE) VARCHAR2(10BYTE)
                     CHAR = 1;  -> 1하나를 넣는데 10을 모두 사용
            VARCHAR2 = 1;  -> 1하나를 넣으면 나머지 99를 돌려줌

VARCHAR2 같은 경우 공간 확보는 하되, 사용하지 않은 크기는 돌려줌

DATE : 날짜 타입
CLOB : 메일, 항소문, 소설 등 VARCHAR2에서 감당하지 못할 크기의
            글 내용을 삽입할 때 사용
BLOB : 이미지, 동영상 과 같은 파일 저장


영어, 숫자, 특수문자 == 1BYTE
이외 문자 (한글포함) == 3BYTE
ㄱ = 3BYTE
가 = 3BYTE
힇 = 3BYTE
*/


/*
PRIMARY KEY (기본키)
 - 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미
 - NOT NULL + UNIQUE (한 행에서 COLUMN에서 똑같은 모양의 데이터는 존재해선 안됨) 
 
 - 한 테이블 한 개만 설정
 
 - 컬럼 레벨, 테이블 레벨 설정 가능함
*/



/*
테스트를 진행하거나 컬럼에 대한 설정을 변경한 후
특정한 내용을 확인하길 원한다면
테이블을 복제해서 사용할 수 있음(사본 만들기)

사본 만들기를 진행하는 방법

모두 동일하게 사본 만들기
CREATE TABLE 새로운테이블이름 AS SELECT * FROM 복사할테이블이름;

특정한 컬럼만 선택해서 사본 만들기
CREATE TABLE 새로운테이블이름 AS SELECT 컬럼명1, 컬럼명2, ... FROM 복사할테이블이름;
*/

--INSERT, UPDATE, DELETE 연습을 위해 연습용 테이블 만들어 줄 것
--EMPLOYEE 테이블에 있는 정보를 EMPLOYEE2 테이블에 그대로 복사, 붙여넣기 한 것
CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;
--테이블을 만들 때 다른 테이블과 동일하게 (컬럼, 데이터값) 복사, 붙여넣기를 진행할 때는
    --CREATE TABLE 테이블명 AS 복사하고 싶은 테이블 SELECT

--복사한 테이블에 제대로 만들어졌는지 확인하기
    --SELECT * FROM 새로운테이블이름;

--EMPLOYEE2가 EMPLOYEE를 제대로 복사했는지 확인하기
SELECT * FROM EMPLOYEE2;





/*
5. CHECK 제약조건
컬럼에 기록되는 값에 조건을 설정할 수 있음
CHECK (컬럼명 비교연산자 비교값)
                       비교값은 변하는 값이나 함수 사용 불가능
*/

CREATE TABLE USER_CHECK (
    USER_NO NUMBER PRIMARY KEY, 
    USER_ID VARCHAR2(20) UNIQUE, 
    USER_PW VARCHAR2(30) NOT NULL, 
    USER_NAME VARCHAR2(30), 
    
    GENDER VARCHAR2(10) CHECK (GENDER IN ('남', '여'))
                      --CHECK (GENDER IN ('남', '여')) : GENDER 라는 컬럼에는
                      --                                 남 이나 여 라는 글자만 들어갈 수 있음
);
--Table USER_CHECK이(가) 생성되었습니다.

INSERT INTO USER_CHECK VALUES (1, 'USER01', 'pw01', '홍길동', '남');
--1 행 이(가) 삽입되었습니다.

SELECT * FROM USER_CHECK;

INSERT INTO USER_CHECK VALUES (2, 'USER02', 'pw02', '박철수', '남');
--1 행 이(가) 삽입되었습니다.
/*
★ 오류가 발생한 코드
INSERT INTO USER_CHECK VALUES (2, 'USER02', 'pw02', '박철수', '남자');
★ 오류코드
ORA-02290: check constraint (KH_T.SYS_C007159) violated
★ 원인
제약조건으로 남 이나 여 만 가능하게 했는데 남자 라는 값을 적용해서 에러 발생
★ 문제 해결한 코드
INSERT INTO USER_CHECK VALUES (2, 'USER02', 'pw02', '박철수', '남');
*/

INSERT INTO USER_CHECK VALUES (3, 'USER03', 'pw03', '강영희', '여');
--1 행 이(가) 삽입되었습니다.

/*
CHECK 사용 방법
1번 : 따로 index에 기록하지 않고 조건 설정만 할 경우
컬럼명 자료형 CHECK(컬럼명 IN ('조건1', '조건2'));

2번 : 따로 index에 기록한 다음 조건 설정한 경우 (한 줄 작성)
컬럼명 자료형 CONSTRAINT 인덱스에기록할이름 CHECK(컬럼명 IN ('조건1', '조건2'));

3번 : 따로 index에 기록한 다음 조건 설정한 경우 (여러 줄 작성)
컬럼명 자료형.
CONSTRAINT 인덱스에기록할이름 CHECK(컬럼명 IN ('조건1', '조건2'));
*/