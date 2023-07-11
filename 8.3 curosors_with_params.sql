DECLARE
    CURSOR c_emps (
        p_dept_id NUMBER
    ) IS
    SELECT
        first_name,
        last_name,
        department_name
    FROM
        employees
        JOIN departments USING ( department_id )
    WHERE
        department_id = p_dept_id;

    v_emps c_emps%rowtype;
BEGIN
    OPEN c_emps(:b_dept_id);
    FETCH c_emps INTO v_emps;
    dbms_output.PUT_LINE('The employees of department '
                         || v_emps.department_name
                         || ' are : ');
    CLOSE c_emps;
    FOR i IN c_emps(:b_dept_id) LOOP dbms_output.put_line(i.first_name
                                                          || ' '
                                                          || i.last_name);
    END LOOP;

END;