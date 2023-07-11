-- COPY TABLE
-- CREATE TABLE employee_copy AS SELECT * FROM employees;
-- SELECT * FROM employee_copy
DECLARE
    v_name              VARCHAR2(50);
    v_salary            employees.salary%TYPE;
    v_increase_salary   NUMBER := 100;
BEGIN
--SELECT
    dbms_output.put_line('SELECT');
    SELECT
        first_name
        || ' '
        || last_name,
        salary
    INTO -- must be one row
        v_name,
        v_salary
    FROM
        employees
    WHERE
        employee_id = 120;

    dbms_output.put_line('The salary of the '
                         || v_name
                         || ' is : '
                         || v_salary);
    FOR i IN 207..216 LOOP 
    /*INSERT INTO employee_copy 
        (employee_id, FIRST_NAME, last_name, email, HIRE_DATE, JOB_ID, SALARY) 
    VALUES (i, 'employee_id#'|| i, 'temp', 'a@gmail.com', sysdate, 'IT_PROG', 100);*/
    
    /*UPDATE employee_copy
    SET
        salary = salary + v_increase_salary
    where employee_id= i;*/
    /*
    DELETE FROM employee_copy
    WHERE
        employee_id = i;
        */ NULL;
    END LOOP;
END;