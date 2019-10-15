--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.Emp_no,
    employees.First_name,
    employees.Last_name,
    employees.Gender,
    salaries.Salary
FROM employees
INNER JOIN salaries ON
salaries.Emp_no = employees.Emp_no;

--2. List employees who were hired in 1986.
SELECT First_name, Last_name
FROM employees
WHERE Hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.Dept_no, departments.Dept_name, dept_manager.Emp_no, employees.First_name, employees.Last_name, dept_manager.From_date, dept_manager.To_date
FROM dept_manager
LEFT JOIN departments
ON dept_manager.Dept_no = departments.Dept_no
LEFT JOIN employees
ON dept_manager.Emp_no = employees.Emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT departments.Dept_name, dept_emp.Emp_no, employees.Last_name, employees.First_name
FROM dept_emp
LEFT JOIN departments
ON dept_emp.Dept_no = departments.Dept_no
LEFT JOIN employees
ON dept_emp.Emp_no = employees.Emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT First_name, Last_name
FROM employees
WHERE First_name = 'Hercules' and Last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT departments.Dept_name, dept_emp.Emp_no, employees.Last_name, employees.First_name
FROM dept_emp
LEFT JOIN departments
ON dept_emp.Dept_no = departments.Dept_no
LEFT JOIN employees
ON dept_emp.Emp_no = employees.Emp_no
WHERE departments.Dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT departments.Dept_name, dept_emp.Emp_no, employees.Last_name, employees.First_name
FROM dept_emp
LEFT JOIN departments
ON dept_emp.Dept_no = departments.Dept_no
LEFT JOIN employees
ON dept_emp.Emp_no = employees.Emp_no
WHERE departments.Dept_name = 'Sales' OR departments.Dept_name = 'Development';


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(Last_name) as "Last_name_count"
FROM employees
GROUP BY Last_name
ORDER BY "Last_name_count" DESC;
