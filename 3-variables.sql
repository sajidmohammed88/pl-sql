DECLARE
    v_text1     VARCHAR2(50) NOT NULL DEFAULT 'HELOO';
    v_text2     VARCHAR2(50) NOT NULL := 'Welcome';
    v_number1   NUMBER(4, 2) NOT NULL := 50.42;
    v_number2   PLS_INTEGER NOT NULL := 50; -- use this instead NUMBER for integers, because it's more perf
    v_number3   BINARY_FLOAT NOT NULL := 50.42f; -- used for scientific calculation
    v_number4   BINARY_DOUBLE NOT NULL := 50.42d; -- idem
    v_number5   BINARY_INTEGER NOT NULL := 50;
    v_date1     DATE NOT NULL := SYSDATE;
    v_date2     TIMESTAMP(3) NOT NULL := systimestamp;
    v_date3     TIMESTAMP(3) WITH TIME ZONE NOT NULL := systimestamp;
    v_date4     INTERVAL DAY (4 ) TO SECOND ( 3 ) := '24 12:22:12.123'; -- fraction of second, by default is 6 caracter, the others 2.
    v_date5     INTERVAL DAY TO SECOND := '24 12:22:12.123';
    v_date6     INTERVAL YEAR TO MONTH := '12-3';
    v_bool1     BOOLEAN := true;
    v_bool2     BOOLEAN := false;
BEGIN
    v_text1 := 'pl/sql';
    dbms_output.put_line(v_text1
                         || ' '
                         || v_text2);
    dbms_output.put_line(v_number1
                         || chr(10)
                         || v_number2
                         || chr(10)
                         || v_number3
                         || chr(10)
                         || v_number4
                         || chr(10)
                         || v_number5);

    dbms_output.put_line(v_date1
                         || chr(10)
                         || v_date2
                         || chr(10)
                         || v_date3
                         || chr(10)
                         || v_date4
                         || chr(10)
                         || v_date5
                         || chr(10)
                         || v_date6);

    dbms_output.put_line(sys.diutil.bool_to_int(v_bool1)
                         || chr(10)
                         || sys.diutil.bool_to_int(v_bool2));

END;