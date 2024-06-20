SELECT * FROM snacks;

SELECT * FROM company;

SELECT s.snack_name, s.price, c.company_name, c.company_phone
FROM snacks s, company c
WHERE s.company_id = c.company_id;

