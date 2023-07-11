DECLARE
    v_counter           NUMBER(2) := 1;
    v_inner             NUMBER := 1;
    v_searched_number   NUMBER := 5;
    v_is_prime          BOOLEAN := true;
    v_x_value           NUMBER := 2;
BEGIN

-- BASIC LOOP
    dbms_output.put_line('LOOP');
    LOOP
        dbms_output.put_line('My loop counter is : ' || v_counter);
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 10;
    END LOOP;
    
-- WHILE

    dbms_output.put_line('WHILE');
    WHILE v_counter < 20 LOOP
        dbms_output.put_line('My while counter is : ' || v_counter);
        v_counter := v_counter + 1;
        -- EXIT WHEN v_counter > 14;  :!\ exit override the condition of while
    END LOOP;
    
-- FOR LOOP

    dbms_output.put_line('FOR');
    FOR i IN reverse - 1..3 LOOP dbms_output.put_line('My for counter is : ' || i);
    END LOOP;
    
-- NESTED LOOP and LABELING

    << outer_loop >> FOR v_outer IN 1..5 LOOP
        dbms_output.put_line('My outer counter is : ' || v_outer);
        v_inner := 1;
        << inner_loop >> LOOP
            v_inner := v_inner + 1;
            dbms_output.put_line('  My inner counter is : ' || v_inner);
            EXIT outer_loop WHEN v_inner * v_outer >= 16;
            EXIT WHEN v_inner * v_outer >= 15;
        END LOOP inner_loop;

    END LOOP outer_loop;
    
-- NESTED LOOP  and CONTINUE STATEMENT

    FOR v_outer IN 1..3 LOOP
        dbms_output.put_line('My outer counter is : ' || v_outer);
        v_inner := 1;
        WHILE v_inner * v_outer < 15 LOOP
            v_inner := v_inner + 1;
            CONTINUE WHEN MOD(v_inner * v_outer, 3) = 0;
            dbms_output.put_line('  My inner counter is : ' || v_inner);
        END LOOP;

    END LOOP;
    
-- CONTINUE STATEMENT instead EXIT;

    << outer_loop1 >> FOR v_outer IN 1..10 LOOP
        dbms_output.put_line('My  outer_loop1 outer counter is : ' || v_outer);
        v_inner := 1;
        << inner_loop1 >> LOOP
            v_inner := v_inner + 1;
            CONTINUE outer_loop1 WHEN v_inner = 10;
            dbms_output.put_line('  My inner_loop1 inner counter is : ' || v_inner);
        END LOOP inner_loop1;

    END LOOP outer_loop1;
    
-- GOTO STATEMENT

    FOR x IN 2..v_searched_number - 1 LOOP IF MOD(v_searched_number, x) = 0 THEN
        dbms_output.put_line(v_searched_number || ' is not a prime number inside loop');
        v_is_prime := false;
        GOTO end_point;
    END IF;
    END LOOP;

    IF v_is_prime THEN
        dbms_output.put_line(v_searched_number || ' is a prime number inside loop');
    END IF;
    << end_point >> dbms_output.put_line('The check is completed inside');
    << start_point >> IF MOD(v_searched_number, v_x_value) = 0 THEN
        dbms_output.put_line(v_searched_number || ' is not a prime number with goto');
        v_is_prime := false;
        GOTO end_point1;
    END IF;

    v_x_value := v_x_value + 1;
    IF v_x_value = v_searched_number THEN
        GOTO prime_point;
    END IF;
    GOTO start_point;
    << prime_point >> IF v_is_prime THEN
        dbms_output.put_line(v_searched_number || ' is a prime number with goto');
    END IF;

    << end_point1 >> dbms_output.put_line('The check is completed');
END;