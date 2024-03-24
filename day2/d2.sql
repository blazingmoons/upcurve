--1 to display the lastname, department number, and department name of all employees
select E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;

--2.  unique listing of all jobs that in department 30. Include the location id in the output.
SELECT DISTINCT j.JOB_ID, d.LOCATION_ID
FROM jobs j
JOIN job_history jh ON j.JOB_ID = jh.JOB_ID
JOIN departments d ON jh.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_ID = 30;

--3. Write a query to display the employee lastname, department name, location id, and city of all employees who earn a commission.
SELECT e.LASTNAME, d.DEPARTMENT_NAME, l.LOCATION_ID, l.CITY
FROM employees e
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID
WHERE e.COMMISSION_PCT IS NOT NULL;

--4. Display the employee lastname, and department name for all employees who have an "a" in their lastname.
SELECT e.LASTNAME, d.DEPARTMENT_NAME
FROM employees e
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.LASTNAME LIKE '%a%';

--5. Write a query to display the lastname, job, department number, and department name for all employees who work in Toronto.
SELECT e.LASTNAME, j.JOB_TITLE, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM employees e
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID
JOIN jobs j ON e.JOB_ID = j.JOB_ID
WHERE l.CITY = 'Toronto';

--6. Display the employee lastname and employee number along with their manager's lastname and manager number. Label the columns "Employee", "Emp#", "Manager" and "Manager#" respectively.
SELECT e1.LASTNAME AS Employee, e1.EMPLOYEE_ID AS "Emp#", e2.LASTNAME AS Manager, e2.EMPLOYEE_ID AS "Manager#"
FROM employees e1
JOIN employees e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID;

--7. Modify the above to display the same columns for all employees (including "King", who has no manager). Order the result by the employee number.
SELECT e1.LASTNAME AS Employee, e1.EMPLOYEE_ID AS "Emp#", e2.LASTNAME AS Manager, e2.EMPLOYEE_ID AS "Manager#"
FROM employees e1
LEFT JOIN employees e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID
ORDER BY e1.EMPLOYEE_ID;

--8. Create query that displays employee lastnames, department numbers, and all the employees who work in the same department as a given employee. Give each column an appropriate label.
SELECT 
    e1.LASTNAME AS Employee_Lastname,
    e1.DEPARTMENT_ID AS Department_Number,
    e2.LASTNAME AS Same_Department_Employee_Lastname
FROM 
    employees e1
JOIN 
    employees e2 ON e1.DEPARTMENT_ID = e2.DEPARTMENT_ID
WHERE 
    e1.LASTNAME = 'Kumar'; 

--9. query that displays the name, job, department name, salary and grade for all employees.


--10. Create a query to display the name and hiredate of any employee hired after employee "Davies"
SELECT 
    FIRSTNAME, LASTNAME, HIRE_DATE 
FROM employees 
WHERE 
    HIRE_DATE > (SELECT HIRE_DATE FROM employees WHERE LASTNAME = 'Davies');

--11. Display the names and hire dates for all employees who were hired before their managers, along with their manager's names and hiredates. Label the columns "Employee", "Emp hired", "Manager", and "Manager hired" respectively.

SELECT 
    e1.FIRSTNAME AS Employee,
    e1.HIRE_DATE AS "Emp hired",
    e2.FIRSTNAME AS Manager,
    e2.HIRE_DATE AS "Manager hired"
FROM 
    employees e1
JOIN 
    employees e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID
WHERE 
    e1.HIRE_DATE < e2.HIRE_DATE;

--12. Display the highest, lowest, sum and average salary of all employees. Label the columns "Maximum", "Minimum", "Sum", and "Average" respectively.
SELECT 
    MAX(SALARY) AS Maximum,
    MIN(SALARY) AS Minimum,
    SUM(SALARY) AS Sum,
    AVG(SALARY) AS Average
FROM 
    employees;


--13. Modify the above query to display the same data for each job type.
SELECT 
    JOB_ID,
    MAX(SALARY) AS Maximum,
    MIN(SALARY) AS Minimum,
    SUM(SALARY) AS Sum,
    AVG(SALARY) AS Average
FROM 
    employees
GROUP BY 
    JOB_ID;

--14. Write a query to display the number of people with the same job.
SELECT 
    JOB_ID,
    COUNT(*) AS Number_of_People
FROM 
    employees
GROUP BY 
    JOB_ID;

--15. Determine the number of managers without listing them. Label the column "Number of Managers". [Hint: use the MANAGER_ID column to determine the number of managers]
SELECT 
    COUNT(DISTINCT MANAGER_ID) AS "Number of Managers"
FROM 
    employees;

--16. Write a query that displays the difference between the highest and the lowes salaries. Label the column as "Difference".
SELECT 
    (SELECT MAX(SALARY) FROM employees) - (SELECT MIN(SALARY) FROM employees) AS Difference;

--17. Display the manager number and the salary of the lowest paid employee for that manager. Exclude anyone whose manager is not known. Exclude any group where the minimum salary is less than $6000. Sort the output in descending order of salary.
SELECT 
    e2.MANAGER_ID AS Manager_Number,
    MIN(e1.SALARY) AS Lowest_Salary
FROM 
    employees e1
JOIN 
    employees e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID
WHERE 
    e2.MANAGER_ID IS NOT NULL
GROUP BY 
    e2.MANAGER_ID
HAVING 
    MIN(e1.SALARY) >= 6000
ORDER BY 
    Lowest_Salary DESC;

--18. Write a query to display each department's name, location, number of employees, and the average salary for all employees in that department. Label the columns "Name", "Location", "No.of people", and "SAlary" respectively. Round the average salary to two decimal places.
SELECT 
    d.DEPARTMENT_NAME AS Name,
    l.CITY AS Location,
    COUNT(e.EMPLOYEE_ID) AS "No.of people",
    AVG(e.SALARY) AS Salary
FROM 
    departments d
JOIN 
    employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
JOIN 
    locations l ON d.LOCATION_ID = l.LOCATION_ID
GROUP BY 
    d.DEPARTMENT_NAME, l.CITY;

--19. Write a query to display the lastname, and hiredate of any employee in the department as the employee "Zlotkey". Exclude "Zlotkey".
SELECT 
    LASTNAME, 
    HIRE_DATE
FROM 
    employees
WHERE 
    DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM employees WHERE LASTNAME = 'Zlotkey')
    AND LASTNAME != 'Zlotkey';

--20. Create a query to display the employee numbers and lastnames of all employees who earn more than the average salary. Sort the result in ascending order of salary.
SELECT 
    EMPLOYEE_ID,
    LASTNAME
FROM 
    employees
WHERE 
    SALARY > (SELECT AVG(SALARY) FROM employees)
ORDER BY 
    SALARY ASC;
--21. Write a query that displays the employee number and lastname of all employees who work in a department with any employee whose lastname contains a "u".
SELECT 
    EMPLOYEE_ID, 
    LASTNAME 
FROM 
    employees 
WHERE 
    DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM employees WHERE LASTNAME LIKE '%u%');

--22. Display the lastname, department number, and job id of all employees whose department location id is 1700.
SELECT 
    LASTNAME, 
    DEPARTMENT_ID, 
    JOB_ID 
FROM 
    employees 
WHERE 
    DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM departments WHERE LOCATION_ID = 1700);

--23. Display the lastname and salary of every employee who reports to "King".
SELECT 
    LASTNAME, 
    SALARY 
FROM 
    employees 
WHERE 
    MANAGER_ID = (SELECT EMPLOYEE_ID FROM employees WHERE LASTNAME = 'King');

--24. Display the department number, lastname, and job id for every employee in the "Executive" department.
SELECT 
    DEPARTMENT_ID, 
    LASTNAME, 
    JOB_ID 
FROM 
    employees 
WHERE 
    DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM departments WHERE DEPARTMENT_NAME = 'Executive');
--25. Display the employee number, lastname, and salary of all employees who earn more than the average salary and who work in a department with any employee with a "u" in their lastname.
SELECT 
    EMPLOYEE_ID, 
    LASTNAME, 
    SALARY 
FROM 
    employees 
WHERE 
    SALARY > (SELECT AVG(SALARY) FROM employees) 
    AND DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM employees WHERE LASTNAME LIKE '%u%');


--26. Write a query to get unique department ID from employee table.
SELECT DISTINCT 
    DEPARTMENT_ID 
FROM 
    employees;

--27. Write a query to get all employee details from the employee table order by first name, descending.
SELECT 
    * 
FROM 
    employees 
ORDER BY 
    FIRSTNAME DESC;


--28. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
SELECT 
    FIRSTNAME, 
    LASTNAME, 
    SALARY, 
    SALARY * 0.15 AS PF 
FROM 
    employees;

--29. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
SELECT 
    EMPLOYEE_ID, 
    FIRSTNAME, 
    LASTNAME, 
    SALARY 
FROM 
    employees 
ORDER BY 
    SALARY ASC;

--30. Write a query to get the total salaries payable to employees.
SELECT 
    SUM(SALARY) AS Total_Salaries_Payable 
FROM 
    employees;

--31. Write a query to get the maximum and minimum salary from employees table.
SELECT 
    MAX(SALARY) AS Maximum_Salary, 
    MIN(SALARY) AS Minimum_Salary 
FROM 
    employees;

--32. Write a query to get the average salary and number of employees in the employees table.
SELECT 
    AVG(SALARY) AS Average_Salary, 
    COUNT(*) AS Number_of_Employees 
FROM 
    employees;

--33. Write a query to get the number of employees working with the company.
SELECT 
    COUNT(*) AS Number_of_Employees 
FROM 
    employees;

--34. Write a query to get the number of jobs available in the employees table.
SELECT 
    COUNT(DISTINCT JOB_ID) AS Number_of_Jobs 
FROM 
    employees;

--35. Write a query get all first name from employees table in upper case.
SELECT 
    UPPER(FIRST_NAME) AS Uppercase_First_Name 
FROM 
    employees;

--36. Write a query to get the first 3 characters of first name from employees table.
SELECT 
    LEFT(FIRST_NAME, 3) AS First_Three_Characters 
FROM 
    employees;

--37. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.
SELECT 
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS Employee_Name 
FROM 
    employees;

--38. Write a query to get first name from employees table after removing white spaces from both side.
SELECT 
    TRIM(FIRST_NAME) AS Trim_First_Name 
FROM 
    employees;

