SELECT * FROM snacks;

SELECT * FROM company;

SELECT s.snack_name, s.price, c.company_name, c.company_phone
FROM snacks s, company c
WHERE s.company_id = c.company_id;

CREATE TABLE pigs (
    pig_id NUMBER PRIMARY KEY,
    pig_name VARCHAR2(50 BYTE) NOT NULL,
    pig_age NUMBER NOT NULL,
    pig_image_path VARCHAR2(255 BYTE) NOT NULL
);        
CREATE SEQUENCE pig_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
        
INSERT INTO pigs (pig_id, pig_name, pig_age, pig_image_path) VALUES (pig_seq.NEXTVAL,'Tamworth', 2, '/images/Tamworth.jpg');
INSERT INTO pigs (pig_id,pig_name, pig_age, pig_image_path) VALUES (pig_seq.NEXTVAL,'mangalica', 3, '/images/Mangalica-pigs3.jpg');
INSERT INTO pigs (pig_id,pig_name, pig_age, pig_image_path) VALUES (pig_seq.NEXTVAL,'kunekune', 1, '/images/kunekune-pigs3.jpg');

COMMIT;
--COMMIT을 꼭 해야 이미지가 정상적으로 나옴

SELECT * FROM pigs;