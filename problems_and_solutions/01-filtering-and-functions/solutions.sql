

/*Problem 1: Retrieve all columns from `departments` table sorted
 alphabetically by `dept_name` */

SELECT *    
FROM   employees.departments
ORDER BY   dept_name ASC;


/* also if we replace "ORDER BY dept_name ASC;" with "ORDER BY dept_name;"
it will still display the same result as the default order is ASCENDING ASC
"lowest to highest" */


/*Problem 2: Find the `emp_no`, `first_name`, `last_name` and `hire_date`
of all employees hired in the year 2000, ordered by `hire_date` 
in descending order. */
 
SELECT emp_no, first_name, last_name, hire_date 
FROM employees.employees 
WHERE YEAR(hire_date) =  2000
ORDER BY hire_date DESC;

/* Problem 3: List all female employees whose `first_name` is either 'Elvis', 'Saniya', or 
  'Parto', sorted by last_name ascending. */

SELECT emp_no, first_name , last_name, gender
FROM employees.employees 
WHERE gender = 'F'
AND first_name IN ('Elvis', 'Saniya', 'Parto')
ORDER BY last_name ASC;


/*Problem 4: Find all employees whose `last_name` starts with 'Fac' 
  and is exactly 6 characters long.*/

SELECT emp_no, first_name, last_name   
FROM employees.employees
WHERE last_name LIKE 'Fac%' 
	AND CHAR_LENGTH(last_name) = 6;

/* problem 5: Retrieve a deduplicated(distinct) list of all historical
  job titles from the `titles` table in
   alphabetical order. */
SELECT DISTINCT title 
FROM employees.titles
ORDER BY title ASC;

/*problem 6: Display the top 15 highest salary records ever recorded in the  
 `salaries` table, showing `emp_no`, `salary`, and `from_date`.
 */
SELECT emp_no, salary, from_date 
FROM employees.salaries
ORDER BY salary DESC 
LIMIT 15;

/* Problem 7: Calculate each employee's approximate age in 
  years at the time they were hired using `TIMESTAMPDIFF`, 
 returning the 10 oldest hires at onboarding.   
    */

SELECT emp_no, first_name, last_name, 
TIMESTAMPDIFF(YEAR, birth_date, hire_date) AS age_at_hire
FROM employees.employees
ORDER BY age_at_hire DESC
LIMIT 10;

/* Problem 8: Return a single column named `employee_label`  
 formatted as `"LAST_NAME, First_name (emp_no)"` for the first 25 
 employes ordered by `emp_no` */

SELECT 
    CONCAT(UPPER(last_name), ', ', first_name, ' (', emp_no, ')') AS employee_label
FROM employees.employees 
ORDER BY emp_no ASC
LIMIT 25;









