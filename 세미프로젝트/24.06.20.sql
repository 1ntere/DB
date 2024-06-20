CREATE TABLE product (
	product_no      NUMBER  PRIMARY KEY,
	member_no       NUMBER,
	product_name	VARCHAR2(255),
	product_image	VARCHAR2(255),
	product_info    VARCHAR2(255),
	product_price	NUMBER,
	product_count	NUMBER,
	product_date	DATE    DEFAULT SYSDATE
);