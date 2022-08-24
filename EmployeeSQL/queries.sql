--1. List the following details of each employee:
-- employee number, last name, first name, sex, and salary
SELECT s.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM "Employees" AS e
INNER JOIN "Salaries" AS s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

--2. List employees who were hired in 1986
SELECT emp_no, last_name, first_name, hire_date
FROM "Employees"
WHERE EXTRACT(year FROM hire_date) = 1986;

--3. List the manager of each department with the following info:
-- department number, department name, manager's employee number,
-- last name, first name
SELECT DISTINCT ON ("DeptManager".dept_no) "DeptManager".dept_no, "Departments".dept_name, "DeptManager".emp_no, "Employees".last_name, "Employees".first_name
FROM "DeptManager" 
INNER JOIN "Departments" 
ON "DeptManager".dept_no = "Departments".dept_no
INNER JOIN "Employees"
ON "DeptManager".emp_no = "Employees".emp_no
ORDER BY "DeptManager".dept_no


--4. List the department of each employee with the following info:
-- employee number, last name, first name, department name
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e
LEFT JOIN "DeptEmp" AS de
ON e.emp_no = de.emp_no
INNER JOIN "Departments" AS d
ON de.dept_no = d.dept_no
ORDER BY e.emp_no

--5. List all employeess whose first name is "Hercules" and last names start with "B"
SELECT e.last_name, e.first_name
FROM "Employees" AS e
WHERE (e.first_name = 'Hercules') AND (LOWER(e.last_name) LIKE 'b%')
ORDER BY e.last_name;

SELECT DISTINCT ON (emp_no) *
INTO current_dept_emp
FROM "DeptEmp"
ORDER BY emp_no;

--6. List all employees in Sales dept, including their employee number, last name, first name, and dept name
SELECT e.emp_no, e.last_name, e.first_name, d,dept_name
FROM "Employees" AS e
INNER JOIN current_dept_emp AS cde
ON e.emp_no = cde.emp_no
INNER JOIN "Departments" as d
ON cde.dept_no = d.dept_no
WHERE lower(d.dept_name) = 'sales';

--7. List all employees in the sales and development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e
INNER JOIN current_dept_emp as cde
ON e.emp_no = cde.emp_no
INNER JOIN "Departments" as d
ON cde.dept_no = d.dept_no
WHERE (lower(d.dept_name) = 'sales') OR (lower(d.dept_name)= 'development');

--7. In descending order, list the frequency count of employee last names
SELECT last_name, count(last_name) as Frequency
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC;