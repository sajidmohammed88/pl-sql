--DESC employees;

SET AUTOPRINT ON;

VARIABLE v_number NUMBER; -- bind variable

DECLARE
    v_type1   employees.job_id%TYPE;
    v_type2   v_type1%TYPE;
    v_type3   employees.job_id%TYPE; -- /!\ the job_id is not null, but when decalred by %type is null by default, we should use NOT NULL to match the exact type.
BEGIN
    v_type1 := 'IT-PROG';
    v_type2 := 'IT-PROG2';
    :v_number := 50;
    dbms_output.put_line(v_type1);
    dbms_output.put_line(v_type2);
    dbms_output.put_line(v_type3 || 'ME');
END;