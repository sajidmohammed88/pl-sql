DECLARE
-- Without record
    CURSOR c_emps IS
    SELECT
        first_name,
        last_name
        --department_name
    FROM
        employees;
        --JOIN departments USING ( department_id )
    --WHERE
        --department_id BETWEEN 30 AND 60;

    v_first_name         employees.first_name%TYPE;
    v_last_name          employees.last_name%TYPE;
    v_departement_name   departments.department_name%TYPE;
-- With defined record
    TYPE r_emp IS RECORD (
        first_name   employees.first_name%TYPE,
        last_name    employees.last_name%TYPE
        --departement_name   departments.department_name%TYPE
    );
    v_emp                r_emp;
-- With rowtype
    v_emp1               c_emps%rowtype; -- recommended
BEGIN
    OPEN c_emps;
    FETCH c_emps INTO
        v_first_name,
        v_last_name;
        --,v_departement_name;
    dbms_output.put_line(v_first_name
                         || ', '
                         || v_last_name
                         --|| ' in departement : '
                         --|| v_departement_name
                         || chr(10));

    FETCH c_emps INTO v_emp;
    dbms_output.put_line(v_emp.first_name
                         || ', '
                         || v_emp.last_name
                         --|| ' in departement : '
                         --|| v_emp.departement_name
                         || chr(10));
                         
                          -- with rowtype

    FETCH c_emps INTO v_emp1;
    dbms_output.put_line(v_emp1.first_name
                         || ', '
                         || v_emp1.last_name
                         || chr(10));

    CLOSE c_emps;
END;