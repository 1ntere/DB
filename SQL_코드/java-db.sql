CREATE Table member (
    member_id NUMBER PRIMARY KEY,
    member_name VARCHAR2(50),
    member_age NUMBER,
    member_phone VARCHAR2(20)
);

CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;