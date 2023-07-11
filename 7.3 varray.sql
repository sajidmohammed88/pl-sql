DECLARE
    TYPE e_list IS
        VARRAY(6) OF VARCHAR2(30);
    employees e_list;
BEGIN
-- Count function
    dbms_output.put_line('Count : ' || chr(10));
    employees := e_list('hamza', 'sajid', 'fred', 'alex');
    employees.extend;
    employees(5) := 'msa'; -- we can add new element to varray if we use extend to add new null element.
    -- employees.delete(5); we cannot delete from varray
    FOR i IN 1..employees.count() LOOP dbms_output.put_line(employees(i)); -- count of varray retunr only the number of values on it  count always equal last in varray
    END LOOP;

    employees.extend;
    dbms_output.put_line(chr(10)
                         || 'last and first functions : '
                         || employees.count()
                         || chr(10));
-- Last and first functions

    FOR i IN employees.first()..employees.last() LOOP dbms_output.put_line(employees(i));
    END LOOP;

    dbms_output.put_line(chr(10)
                         || 'Exists function : '
                         || chr(10));
-- Exists functions

    FOR i IN 1..5 LOOP IF employees.EXISTS(i) THEN
        dbms_output.put_line(employees(i));
    END IF;
    END LOOP;

    dbms_output.put_line(chr(10)
                         || 'limit function :'
                         || chr(10));
-- Limit function

    dbms_output.put_line(employees.limit());
END;