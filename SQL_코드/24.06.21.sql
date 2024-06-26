CREATE SEQUENCE clothes_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE clothes (
    clothes_id NUMBER PRIMARY KEY,
    clothes_name VARCHAR2(100) NOT NULL,
    clothes_price NUMBER(10, 2) NOT NULL,
    clothes_category VARCHAR2(50) NOT NULL,
    clothes_image_path VARCHAR2(255) NOT NULL
);

INSERT INTO clothes (clothes_id, clothes_name, clothes_price, clothes_category, clothes_image_path)
VALUES (clothes_seq.NEXTVAL, 'T-Shirt', 2000, 'Top', '/images/clothes/tshirt.jpg');