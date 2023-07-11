-- Record : store one row with multiple type
-- Collection : multiple row with same type
    -- Nested tables => unbounded and index start from 1
    -- Varrays : bounded and index start from 1
    -- Ass.Arrays : unbounded and we can choose index(string , int)
    
-- CREATE TABLE retired_employee AS SELECT * FROM employees where 1 = 2;
-- SELECT * FROM retired_employee
DECLARE
    r_emp1   employees%rowtype;
    TYPE t_emp IS RECORD (
        first_name   VARCHAR(50),
        last_name    employees.last_name%TYPE,
        salary       employees.salary%TYPE,
        hire_date    DATE
    );
    r_emp2   t_emp;
BEGIN
-- Record using rowtype

    SELECT * INTO r_emp1 FROM employees WHERE employee_id = 104;
    
    r_emp1.salary := 10;
    r_emp1.commission_pct := 0;
    
    --INSERT INTO retired_employee VALUES r_emp1; -- insert row to table by using recod
    UPDATE retired_employee set row = r_emp1 where employee_id = 104;
    
    dbms_output.put_line(r_emp1.last_name);
    
-- Recod using recod definition
-- 1 - Initialize recod like
    r_emp2.first_name := 'mohammed';
    r_emp2.last_name := 'sajid';
    r_emp2.salary := 1000;
    r_emp2.hire_date := '01-JAN-20';
    
-- 2 or with select
    SELECT
        first_name,
        last_name,
        salary,
        hire_date
    INTO r_emp2
    FROM
        employees
    WHERE
        employee_id = 101;

    dbms_output.put_line(r_emp2.first_name
                         || ' '
                         || r_emp2.last_name
                         || ' '
                         || r_emp2.salary
                         || ' '
                         || r_emp2.hire_date);

END;