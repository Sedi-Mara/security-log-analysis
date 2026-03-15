-- Security Log Investigation Queries
-- Author: Lesedi Marakalala

-- ---------------------------------------------------
-- 1. Retrieve After-Hours Failed Login Attempts
-- Purpose: Identify failed login attempts after 18:00
-- ---------------------------------------------------

SELECT *
FROM log_in_attempts
WHERE login_time > '18:00'
AND success = 0;


-- ---------------------------------------------------
-- 2. Retrieve Login Attempts on Suspicious Dates
-- Purpose: Investigate activity on May 8 and May 9
-- ---------------------------------------------------

SELECT *
FROM log_in_attempts
WHERE login_date = '2022-05-09'
OR login_date = '2022-05-08';


-- ---------------------------------------------------
-- 3. Retrieve Login Attempts Outside Mexico
-- Purpose: Identify logins from unexpected locations
-- ---------------------------------------------------

SELECT *
FROM log_in_attempts
WHERE country NOT LIKE 'MEX%';


-- ---------------------------------------------------
-- 4. Retrieve Employees in the Marketing Department
-- Purpose: Identify machines requiring security updates
-- ---------------------------------------------------

SELECT *
FROM employees
WHERE department = 'Marketing'
AND office LIKE 'East%';


-- ---------------------------------------------------
-- 5. Retrieve Employees in Finance or Sales
-- Purpose: Identify additional machines requiring updates
-- ---------------------------------------------------

SELECT *
FROM employees
WHERE department = 'Finance'
OR department = 'Sales';


-- ---------------------------------------------------
-- 6. Retrieve Employees Not in IT
-- Purpose: Identify employees requiring a separate update
-- ---------------------------------------------------

SELECT *
FROM employees
WHERE NOT department = 'Information Technology';
