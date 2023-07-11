DECLARE
    CURSOR c_emp1 IS
    SELECT
        *
    FROM
        employees
    WHERE
        department_id = 30;

    v_emp1 c_emp1%rowtype;
BEGIN
    dbms_output.put_line('standar use : ');
    OPEN c_emp1;
    LOOP
        FETCH c_emp1 INTO v_emp1;
        EXIT WHEN c_emp1%notfound;
        dbms_output.put_line(v_emp1.first_name
                             || ', '
                             || v_emp1.last_name
                             || chr(10));

    END LOOP;

    CLOSE c_emp1;

-- recommended
    dbms_output.put_line('Use cursor without declarations : ');
    FOR i IN c_emp1 LOOP dbms_output.put_line(i.first_name
                                              || ', '
                                              || i.last_name
                                              || chr(10));
    END LOOP;

    dbms_output.put_line('No curosor: ');
    FOR i IN (
        SELECT
            *
        FROM
            employees
        WHERE
            department_id = 30) LOOP dbms_output.put_line(i.first_name
                                || ', '
                                || i.last_name
                                || chr(10));
                         end LOOP;

END;