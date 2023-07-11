DECLARE
    TYPE t_edu IS RECORD (
        primary_school      VARCHAR2(100),
        high_school         VARCHAR2(100),
        university          VARCHAR2(100),
        uni_graduate_date   DATE
    );
    TYPE t_emp IS RECORD (
        first_name   VARCHAR2(50),
        last_name    employees.last_name%TYPE,
        salary       employees.salary%TYPE,
        hire_date    DATE,
        dept_id      employees.department_id%TYPE,
        department   departments%rowtype,
        education    t_edu
    );
    r_emp t_emp;
BEGIN
    SELECT
        first_name,
        last_name,
        salary,
        hire_date,
        department_id
    INTO
            r_emp
        .first_name,
        r_emp.last_name,
        r_emp.salary,
        r_emp.hire_date,
        r_emp.dept_id
    FROM
        employees
    WHERE
        employee_id = 146;

    SELECT
        *
    INTO
        r_emp
    .department
    FROM
        departments
    WHERE
        department_id = r_emp.dept_id;

    r_emp.education.primary_school := 'ps';
    r_emp.education.high_school := 'hs';
    r_emp.education.university := 'uni';
    r_emp.education.uni_graduate_date := '01-JAN-13';
    dbms_output.put_line(r_emp.first_name
                         || ' '
                         || r_emp.last_name
                         || ' '
                         || r_emp.salary
                         || ' '
                         || r_emp.hire_date
                         || ' '
                         || r_emp.dept_id);

    dbms_output.put_line(r_emp.department.department_name
                         || ' '
                         || r_emp.department.manager_id
                         || ' '
                         || r_emp.department.location_id);

    dbms_output.put_line(r_emp.education.primary_school
                         || ' '
                         || r_emp.education.high_school
                         || ' '
                         || r_emp.education.university
                         || ' '
                         || r_emp.education.uni_graduate_date);

END;