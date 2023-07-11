-- my_user can not update the table, beacause the hr user should commit or rollback
UPDATE hr.employee_copy
SET
    phone_number = '1'
WHERE
    employee_id = 100;