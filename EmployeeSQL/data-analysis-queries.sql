CREATE TABLE departments(
    "dept_no" VARCHAR,
    "dept_name" VARCHAR);
select * from departments

CREATE TABLE dept_emp(
	"emp_no" INT,
    "dept_no" VARCHAR);
select * from dept_emp

CREATE TABLE dept_manager(
	"dept_no" VARCHAR   NOT NULL,
	"emp_no" INT   NOT NULL);
select * from dept_manager;

CREATE TABLE employees(
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL);
select * from employees;

CREATE TABLE salaries (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);
select * from salaries

CREATE TABLE titles (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL);
select * from titles


--#1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;

--#2
SELECT first_name, last_name, hire_date 
FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--#3
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

--#4
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

--#5
SELECT first_name, last_name, sex
FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--#6
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--#7
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--#8
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

---Epilogue
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.emp_no = '499942';