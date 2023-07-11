DECLARE
-- if statement
    v_number            NUMBER := null;
-- case statements
    v_job_code          VARCHAR2(10) := 'IT_PROG';
    v_salary_increase   NUMBER;
BEGIN
-- if statement
    IF v_number IS NULL THEN
        dbms_output.put_line('null value');
    ELSIF v_number < 10 THEN
        dbms_output.put_line('Smaller then 10');
    ELSIF v_number < 20 THEN
        dbms_output.put_line('Between 10 and 20');
    ELSIF v_number <= 30 THEN
        dbms_output.put_line('Smaller or Equal to 30');
    ELSE
        dbms_output.put_line('More than 30');
    END IF;
    
-- case statements

-- case expression

    v_salary_increase := CASE v_job_code
            WHEN 'SA_MAN' THEN
                0.2
            WHEN 'SA_REP' THEN 
                0.3
            ELSE 0
        END;

    dbms_output.put_line('Salary increase is ' || v_salary_increase);
-- search condition
    v_salary_increase :=
        CASE
            WHEN v_job_code = 'SA_MAN' THEN
                0.2
            WHEN v_job_code = 'SA_REP' or v_job_code = 'IT_PROG' THEN
                0.3
            ELSE 0
        END;

    dbms_output.put_line('Salary increase is ' || v_salary_increase);
-- case statements
    CASE
        WHEN v_job_code = 'SA_MAN' THEN
            v_salary_increase := 0.2;
            dbms_output.put_line('Salary increase is ' || v_salary_increase);
        WHEN v_job_code = 'SA_REP' OR v_job_code = 'IT_PROG' THEN
            v_salary_increase := 0.3;
            dbms_output.put_line('Salary increase is ' || v_salary_increase);
        ELSE
            v_salary_increase := 0;
            dbms_output.put_line('Salary increase is ' || v_salary_increase);
    END CASE;

END;