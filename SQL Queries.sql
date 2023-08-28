/*INITIATE SCHEMA*/

Create Tables
CREATE TABLE employees (
						emp_no INT NOT NULL PRIMARY KEY,
						emp_title VARCHAR(5) NOT NULL,
						birth_date VARCHAR(10) NOT NULL,
						first_name VARCHAR(100) NOT NULL,
						last_name VARCHAR(100) NOT NULL,
						sex VARCHAR(1) NOT NULL,
						hire_date DATE NOT NULL
						);
						
CREATE TABLE titles (
						title_id VARCHAR(5) NOT NULL,
						title VARCHAR(100) NOT NULL
						);
						

/* Start Data Analysis

- List the employee number, last name, first name, sex, and salary of each employee; 

CREATE VIEW employees_salaries_join AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,
		salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

SELECT * FROM employees_salaries_join; */

/* 
-List the first name, last name, and hire date for the employees who were hired in 1986.


CREATE VIEW employees_1986 AS
SELECT employees.first_name, employees.last_name,  employees.hire_date
FROM employees
WHERE EXTRACT(year FROM employees.hire_date) = 1986;

SELECT * FROM employees_1986; */

/*
- List the manager of each department along with their department number, department name, employee number, last name, and first name

CREATE VIEW employees_department_dept_manager_join AS
SELECT department.dept_no, department.dept_name,
		dept_manager.emp_no, 
		employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN department ON dept_manager.dept_no=department.dept_no;

SELECT * FROM employees_department_dept_manager_join */

/* 
- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

CREATE VIEW department_employees_dept_emp_join AS
SELECT department.dept_no, 
		employees.emp_no, employees.last_name, employees.first_name,
		department.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN department ON dept_emp.dept_no=department.dept_no;

SELECT * FROM department_employees_dept_emp_join */

/* 
- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

CREATE VIEW employees_hercules_b AS
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%';

SELECT * FROM employees_hercules_b */

/*
- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT department_employees_dept_emp_join.dept_name,
		department_employees_dept_emp_join.emp_no,
		department_employees_dept_emp_join.last_name,
		department_employees_dept_emp_join.first_name
FROM department_employees_dept_emp_join
WHERE department_employees_dept_emp_join.dept_name= 'Sales' */

/* 
- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT department_employees_dept_emp_join.emp_no,
		department_employees_dept_emp_join.last_name,
		department_employees_dept_emp_join.first_name,
		department_employees_dept_emp_join.dept_name
FROM department_employees_dept_emp_join
WHERE department_employees_dept_emp_join.dept_name= 'Sales'
OR department_employees_dept_emp_join.dept_name= 'Development'
*/

/*
- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

CREATE VIEW employees_freq_count AS
SELECT employees.last_name, COUNT(employees.last_name) AS freq_count
FROM employees
GROUP BY employees.last_name
ORDER BY freq_count DESC;

SELECT * FROM employees_freq_count
*/





	
