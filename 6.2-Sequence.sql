-- CREATE TABLE employee_copy AS SELECT * FROM employees;
-- SELECT * FROM employee_copy
-- DROP TABLE employee_copy
-- CREATE SEQUENCE employee_id_seq START WITH 207 INCREMENT BY 1;
DECLARE
    v_num NUMBER;
BEGIN
    NULL;
/*
    FOR i IN 1..10 LOOP
        INSERT INTO employee_copy (
            employee_id, FIRST_NAME, last_name,
            email, HIRE_DATE,
            job_id,
            salary
        ) VALUES (
            employee_id_seq.NEXTVAL,
            'employee_id#' || employee_id_seq.NEXTVAL,
            'temp',
            'a@gmail.com',
            SYSDATE,
            'IT_PROG', 100);
    END LOOP;
*/

/*
    SELECT employee_id_seq.nextval
    INTO v_num
    FROM DUAL;
*/
    -- v_num := employee_id_seq.nextval;
    dbms_output.put_line(employee_id_seq.currval);
END;