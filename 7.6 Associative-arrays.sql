DECLARE
    TYPE e_list1 IS
        TABLE OF employees.first_name%TYPE INDEX BY PLS_INTEGER;
    emps1          e_list1;
    idx1           PLS_INTEGER;
    -----------------------------
    TYPE e_list2 IS
        TABLE OF employees.first_name%TYPE INDEX BY employees.email%TYPE;
    emps2          e_list2;
    v_email        employees.email%TYPE;
    idx2           employees.email%TYPE;
    v_first_name   employees.first_name%TYPE;
    ---------------------------------------
    TYPE e_list3 IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    emps3          e_list3;
    idx3           PLS_INTEGER;
    -----------------------------------------------
    TYPE e_type IS RECORD (
        first_name   employees.first_name%TYPE,
        last_name    employees.last_name%TYPE,
        email        employees.email%TYPE
    );
    TYPE e_list4 IS
        TABLE OF e_type INDEX BY PLS_INTEGER;
    emps4          e_list4;
    idx4           PLS_INTEGER;
    -----------------------------------------------
BEGIN
    FOR i IN 100..110 LOOP SELECT
                               first_name
                           INTO
                               emps1
                           (i)
                           FROM
                               employees
                           WHERE
                               employee_id = i;

    END LOOP;

    idx1 := emps1.first;
    WHILE idx1 IS NOT NULL LOOP -- FOR has problems if we select null value in the select statement.
        dbms_output.put_line(emps1(idx1)
                             || ' , '
                             || idx1);
        idx1 := emps1.next(idx1);
    END LOOP;

    dbms_output.put_line(chr(10));
    --------------------------------------
    FOR j IN 100..110 LOOP
        SELECT
            first_name,
            email
        INTO
            v_first_name,
            v_email
        FROM
            employees
        WHERE
            employee_id = j;

        emps2(v_email) := v_first_name;
    END LOOP;

    idx2 := emps2.first;
    WHILE idx2 IS NOT NULL LOOP -- FOR has problems if we select null value in the select statement.
        dbms_output.put_line(emps2(idx2)
                             || ' , '
                             || idx2);
        idx2 := emps2.next(idx2);
    END LOOP;

    dbms_output.put_line(chr(10));

    ------------------------------------------------------------
    FOR k IN 100..110 LOOP SELECT
                               *
                           INTO
                               emps3
                           (k)
                           FROM
                               employees
                           WHERE
                               employee_id = k;

    END LOOP;

    idx3 := emps3.first;
    WHILE idx3 IS NOT NULL LOOP -- FOR has problems if we select null value in the select statement.
        dbms_output.put_line(emps3(idx3).first_name
                             || ' '
                             || emps3(idx3).email
                             || ' '
                             || emps3(idx3).last_name
                             || ' , '
                             || idx3);

        idx3 := emps3.next(idx3);
    END LOOP;

    dbms_output.put_line(chr(10));
    ------------------------------------------------------------
    FOR l IN 100..110 LOOP SELECT
                               first_name,
                               last_name,
                               email
                           INTO
                               emps4
                           (l)
                           FROM
                               employees
                           WHERE
                               employee_id = l;

    END LOOP;

    --emps4.DELETE(100,109);

    idx4 := emps4.last;
    WHILE idx4 IS NOT NULL LOOP -- FOR has problems if we select null value in the select statement.
        dbms_output.put_line(emps4(idx4).first_name
                             || ' email: '
                             || emps4(idx4).email
                             || ' lastname :'
                             || emps4(idx4).last_name
                             || ' , '
                             || idx4);

        idx4 := emps4.PRIOR(idx4);
    END LOOP;

END;
/
--select * from employees