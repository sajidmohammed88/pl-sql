CREATE USER my_user IDENTIFIED BY oracle;

GRANT
    CREATE SESSION
TO my_user;

GRANT
    SELECT ANY TABLE
TO my_user;

GRANT UPDATE ON hr.employee_copy TO my_user;

GRANT UPDATE ON hr.departments TO my_user;