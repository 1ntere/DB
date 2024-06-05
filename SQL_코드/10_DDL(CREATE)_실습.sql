/*****CREATE TABLE 실습*****/
/*
고객 테이블 CUSTOMER
CUSTOMER_ID NUMBER(10,0) 기본키
CUSTOMER_NAME VARCHAR2(100) NOT NULL
CUSTOMER_EMAIL VARCHAR2(100) 방법1, 중복허용X
CUSTOMER_PHONE VARCHAR2(20) 방법2, 중복허용X
CUSTOMER_ADDRESS VARCHAR2(255) 고객 주소 작성

COMMENT ON COLUMN "고객테이블명".CUSTOMER_ID IS "고객아이디"; --주석 작성
*/
--테이블 CREATE
CREATE TABLE CUSTOMER (
    CUSTOMER_ID NUMBER(10,0) PRIMARY KEY, 
    CUSTOMER_NAME VARCHAR2(100) NOT NULL, 
    CUSTOMER_EMAIL VARCHAR2(100) CONSTRAINT C_E_U UNIQUE, 
    CUSTOMER_PHONE VARCHAR2(20),
    CUSTOMER_ADDRESS VARCHAR2(255),
    
    CONSTRAINT C_P_UNIQUE UNIQUE(CUSTOMER_PHONE)
    --C_P_UNIQUE : C_P_U로 지정했다가
    --             오류코드 ORA-02264: name already used by an existing constraint가 떠서 바꿔줌
);
--Table CUSTOMER이(가) 생성되었습니다.

--주석 작성하기
COMMENT ON COLUMN CUSTOMER.CUSTOMER_ID IS '고객아이디'; --주석 작성
COMMENT ON COLUMN CUSTOMER.CUSTOMER_NAME IS '고객이름'; --주석 작성
COMMENT ON COLUMN CUSTOMER.CUSTOMER_EMAIL IS '고객이메일'; --주석 작성
COMMENT ON COLUMN CUSTOMER.CUSTOMER_PHONE IS '고객핸드폰번호'; --주석 작성
COMMENT ON COLUMN CUSTOMER.CUSTOMER_ADDRESS IS '고객주소'; --주석 작성
--Comment이(가) 생성되었습니다. * 5
/*
★오류가 발생한 코드
COMMENT ON COLUMN CUSTOMER.CUSTOMER_ID IS "고객아이디";
★ 오류코드
ORA-01780: string literal required
★ 원인
보통 string literal required 오류는 "" 를 사용해서 발생하는 오류
★ 문제 해결한 코드
COMMENT ON COLUMN CUSTOMER.CUSTOMER_ID IS '고객아이디';
*/

--커밋하기
COMMIT;
--커밋 완료.

--커밋 후 새로고침 하면 테이블에서 CUSTOMER 테이블을 볼 수 있음

/*
PRODUCT 테이블 생성
PRODUCT_ID NUMBER(10,0) 기본키
PRODUCT_NAME VARCHAR2(100) NULL 사용 불가
PRODUCT_PRICE NUMBER(10,2) NULL 사용 불가
PRODUCT_DESC VARCHAR2(200) 중복이 안되는 특별한 값 설정
*/
CREATE TABLE PRODUCT (
    PRODUCT_ID NUMBER(10,0) PRIMARY KEY, 
    PRODUCT_NAME VARCHAR2(100) NOT NULL, 
    PRODUCT_PRICE NUMBER(10,2) NOT NULL, 
    PRODUCT_DESC VARCHAR2(200) CONSTRAINT P_D_U UNIQUE
);
--Table PRODUCT이(가) 생성되었습니다.

/*
PROCUCT 값 추가 --아래를 그대로 입력하면 오류가 날 것임!
    아메리카노        3000    신선한 원두로 만든 아메리카노
2   카페라떼          2500    부드러운 우유가 들어간 라떼
    카푸치노          3500    진한 커피와 거품이 어우러지는 카푸치노
2   카라멜 마키아토    4000    달콤한 카라멜 시럽이 들어간 마키아토
*/
INSERT INTO PRODUCT VALUES (1, '아메리카노', 3000, '신선한 원두로 만든 아메리카노');
INSERT INTO PRODUCT VALUES (2, '카페라떼', 2500, '부드러운 우유가 들어간 라떼');
INSERT INTO PRODUCT VALUES (3, '카푸치노', 3500, '진한 커피와 거품이 어우러지는 카푸치노');
INSERT INTO PRODUCT VALUES (4, '카라멜 마키아토 ', 4000, '달콤한 카라멜 시럽이 들어간 마키아토');
--4 행 이(가) 삽입되었습니다.

COMMIT;
--커밋 완료.

--FOOD_COMPANY TABLE 생성
CREATE TABLE FOOD_COMPANY (
    COMPANY_ID      NUMBER(10,0) PRIMARY KEY,   --회사 ID 기본키
    COMPANY_NAME    VARCHAR2(100) NOT NULL,     --회사 이름(NULL 불가)
    COMPANY_ADDRESS VARCHAR2(255),              --회사 주소
    COMPANY_PHONE   VARCHAR2(20)                --회사 전화번호
);
--Table FOOD_COMPANY이(가) 생성되었습니다.
COMMIT;

--SNACKS 테이블 생성
CREATE TABLE SNACKS (
    SNACK_ID        NUMBER(10, 0) PRIMARY KEY,  --과자 ID(기본키)
    SNACK_NAME      VARCHAR2(100) NOT NULL,     --과자 이름 (NULL 불가)
    PRICE           NUMBER(10, 2) NOT NULL,     --가격 (NULL 불가)
    
    COMPANY_ID      NUMBER(10,0),               --97번 줄 코드를 작성하지 않으면 ORA-00904 오류 발생
    CONSTRAINT FK_COMPANY FOREIGN KEY (COMPANY_ID)
        REFERENCES FOOD_COMPANY(COMPANY_ID) ON DELETE CASCADE
      --REFERENCES FOOD_COMPANY(COMPANY_ID) : FOOD_COMPANY COMPANY_ID를 참조
                                          --ON DELETE CASCADE : 부모 삭제시 자식까지 삭제
);
--Table SNACKS이(가) 생성되었습니다.
/*
★ 문제가 발생한 코드
    PRICE           NUMBER(10, 2) NOT NULL,
    
    CONSTRAINT FK_COMPANY FOREIGN KEY (COMPANY_ID)
        REFERENCES FOOD_COMPANY(COMPANY_ID) ON DELETE CASCADE
);
★ 오류코드
ORA-00904: "COMPANY_ID": invalid identifier
★ 원인
부모에서 COMPANY_ID가 존재하는데 자식에서도 굳이 COMPANY_ID를 작성해야 하는가?
-> NO, 하지만 참조할 변수명을 작성해주어야 한다.
       사실, SNACK1 테이블처럼 COMPANY_ID가 아니라 ABCDEF로 해도 됨
             하지만, ABCDEF로 작성했다면 잘 맞춰서 작성해 주어야 함
    ABCDEF      NUMBER(10,0), 
    CONSTRAINT FK_COMPANY FOREIGN KEY (ABCDEF)
        REFERENCES FOOD_COMPANY(COMPANY_ID) ON DELETE CASCADE
);
★ 문제를 해결한 코드
    PRICE           NUMBER(10, 2) NOT NULL,
    
    COMPANY_ID      NUMBER(10,0),  
    CONSTRAINT FK_COMPANY FOREIGN KEY (COMPANY_ID)
        REFERENCES FOOD_COMPANY(COMPANY_ID) ON DELETE CASCADE
);
*/

CREATE TABLE SNACKS1 (
    SNACK_ID        NUMBER(10, 0) PRIMARY KEY,
    SNACK_NAME      VARCHAR2(100) NOT NULL,
    PRICE           NUMBER(10, 2) NOT NULL,
    ABCDEF      NUMBER(10,0),
    CONSTRAINT FK_COMPANY1 FOREIGN KEY (ABCDEF)
        REFERENCES FOOD_COMPANY(COMPANY_ID) ON DELETE CASCADE
);
--Table SNACKS1이(가) 생성되었습니다.

CREATE TABLE SNACKS2 (
    SNACK_ID        NUMBER(10, 0) PRIMARY KEY,
    SNACK_NAME      VARCHAR2(100) NOT NULL,
    PRICE           NUMBER(10, 2) NOT NULL,
    BBBBBB      NUMBER(10,0),
    CONSTRAINT FK_COMPANY2 FOREIGN KEY (BBBBBB)
        REFERENCES FOOD_COMPANY(COMPANY_ID) ON DELETE CASCADE
);
--Table SNACKS2이(가) 생성되었습니다.
