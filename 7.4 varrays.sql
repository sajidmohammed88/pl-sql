CREATE OR REPLACE TYPE e_list IS
    VARRAY(30) OF VARCHAR2(100);
/

DECLARE
    --TYPE e_list IS VARRAY(15) OF VARCHAR2(50);
    idx         NUMBER := 1;
    employees   e_list := e_list();
BEGIN
    FOR i IN 100..110 LOOP
        employees.extend;
        SELECT
            first_name
        INTO
            employees
        (idx)
        FROM
            employees
        WHERE
            employee_id = i;

        idx := idx + 1;
    END LOOP;

    FOR x IN 1..employees.count() LOOP dbms_output.put_line(employees(x));
    END LOOP;

END;
/

DROP TYPE e_list;