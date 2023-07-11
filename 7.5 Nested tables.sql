DECLARE
    --TYPE e_list IS TABLE OF VARCHAR(30);
    TYPE e_list IS
        TABLE OF employees.first_name%TYPE;
    emps1   e_list;
    emps2   e_list := e_list();
    idx     PLS_INTEGER := 1;
BEGIN
    emps1 := e_list('sajid', 'hamza', 'jilali');
    emps1.extend;
    emps1(4) := 'uncle bob';
    FOR i IN 1..emps1.count() LOOP dbms_output.put_line(emps1(i)
                                                        || chr(10));
    END LOOP;

    FOR j IN 100..110 LOOP
        emps2.extend; -- extend is used just for varray and nested table not for ass array
        SELECT
            first_name
        INTO
            emps2
        (idx)
        FROM
            employees
        WHERE
            employee_id = j;

        idx := idx + 1;
    END LOOP;
    --emps2.extend;

    dbms_output.put_line('emps count before delete : '
                         || emps2.count()
                         || chr(10));

    FOR ii IN 1..emps2.count() LOOP dbms_output.put_line(emps2(ii));
    END LOOP;

    emps2.DELETE(2, 4);
    dbms_output.put_line('emps count after delete : ' -- count is 8 and last is 11 are not the same bcq we are delete 3 elements
                         || emps2.count()
                         || ' '
                         || emps2.last
                         || ' '
                         || chr(10));

    FOR k IN 1..emps2.count() LOOP IF emps2.EXISTS(k) THEN
        dbms_output.put_line(emps2(k));
    END IF;
    END LOOP;

END;