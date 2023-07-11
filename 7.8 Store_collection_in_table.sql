CREATE OR REPLACE TYPE t_phone_number AS OBJECT (
    p_type     VARCHAR(10),
    p_number   VARCHAR(50)
);
/

CREATE OR REPLACE TYPE v_phone_numbers AS
    VARRAY(3) OF t_phone_number;
/

CREATE TABLE emps_with_phones (
    employee_id    NUMBER,
    first_name     VARCHAR(50),
    last_name      VARCHAR(50),
    phone_number   v_phone_numbers
);
/

SELECT
    *
FROM
    emps_with_phones;
/

    INSERT INTO emps_with_phones VALUES (
        10,
        'mohammed',
        'sajid',
        v_phone_numbers(t_phone_number('Home', '123456'), t_phone_number('Home', '123456'), t_phone_number('Home', '123456'))
    );
/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    p.p_type,
    p.p_number
FROM
    emps_with_phones        e,
    TABLE ( e.phone_number ) p;
    
------------------------------------------------------------
    
/

CREATE OR REPLACE TYPE n_phone_numbers AS
    TABLE OF t_phone_number;
/

CREATE TABLE emps_with_phones2 (
    employee_id    NUMBER,
    first_name     VARCHAR(50),
    last_name      VARCHAR(50),
    phone_number   n_phone_numbers
)
NESTED TABLE phone_number STORE AS phone_numbers_table;
/

    INSERT INTO emps_with_phones2 VALUES (
        10,
        'mohammed',
        'sajid',
        n_phone_numbers(t_phone_number('Home', '123456'), t_phone_number('work', '123456'), t_phone_number('fix', '123456'))
    );
/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    p.p_type,
    p.p_number
FROM
    emps_with_phones2       e,
    TABLE ( e.phone_number ) p;
/

DECLARE
    p_num n_phone_numbers;
BEGIN
    SELECT
        phone_number
    INTO p_num
    FROM
        emps_with_phones2
    WHERE
        employee_id = 10;

    p_num.extend;
    p_num(4) := t_phone_number('FAX', '123456');
    UPDATE emps_with_phones2
    SET
        phone_number = p_num
    WHERE
        employee_id = 10;

END;