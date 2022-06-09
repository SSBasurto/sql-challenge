--Data Analysis
-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" as e
INNER JOIN "Salaries" as s ON
e.emp_no = s.emp_no
;

-- 2.List first name, last name, and hire date for employees hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM "Employees" as e
WHERE hire_date < '1/1/87'::date
and hire_date >='1/1/86'::date
;

-- 3.List the manager of each department as follows: department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM "Departments" as d
INNER JOIN "Dept_Manager" as de ON
d.dept_no = de.dept_no
INNER JOIN "Employees" as e ON
de.emp_no = e.emp_no
;

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
FROM "Employees" as e
INNER JOIN "Dept_Emp" as d ON
e.emp_no = d.emp_no
INNER JOIN "Departments" as de ON
d.dept_no = de.dept_no
;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex
FROM "Employees" as e
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%'
;

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
FROM "Employees" as e
INNER JOIN "Dept_Emp" as d ON
e.emp_no = d.emp_no
INNER JOIN "Departments" as de ON
d.dept_no = de.dept_no
WHERE "dept_name" = 'Sales'
;

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
FROM "Employees" as e
INNER JOIN "Dept_Emp" as d ON
e.emp_no = d.emp_no
INNER JOIN "Departments" as de ON
d.dept_no = de.dept_no
WHERE "dept_name" = 'Sales' OR "dept_name" = 'Development'
;

-- 8.List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) as Frequency
FROM "Employees"
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC
;