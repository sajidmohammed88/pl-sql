--create table employees_salary_history as select * from employees where 1=2;
--alter table employees_salary_history add insert_date date;
--select * from employees_salary_history;
DECLARE
    TYPE e_list IS
        TABLE OF employees_salary_history%rowtype INDEX BY PLS_INTEGER;
    emps   e_list;
    idx    PLS_INTEGER;
BEGIN
    FOR i IN 100..110 loop
    select
                               e.*,
                               '01-JAN-13'
                           INTO
                               emps
                           (i)
                           FROM
                               employees e
                           WHERE
                               e.employee_id = i;
    end LOOP;

    idx := emps.first;
    WHILE idx IS NOT NULL LOOP
        emps(idx).salary := emps(idx).salary * 1.2;

        INSERT INTO employees_salary_history VALUES emps( idx );

        dbms_output.put_line(emps(idx).first_name
                             || ' email: '
                             || emps(idx).email
                             || ' lastname :'
                             || emps(idx).last_name
                             || ' , '
                             || emps(idx).salary
                             || ' '
                             || emps(idx).insert_date);

        idx := emps.next(idx);
    END LOOP;

END;