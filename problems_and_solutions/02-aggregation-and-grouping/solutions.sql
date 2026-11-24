/*
Problem 9
Count the total number of male (M) and female (F) employees
*/

SELECT gender, COUNT(*) AS total
FROM employees.employees
GROUP BY gender;

/* problem 10
 Group employees hires y the calendar year of `hire_date` and display
   the year alongside the total number of hires, ordered chronologically.
 */
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_hires
FROM employees.employees
GROUP BY YEAR(hire_date)
ORDER BY hire_year ASC;

/* problem 11
 * List all jobs titles held by more than 50,000 employees historically,
 *  sorted from the highest headcount to the lowest.
 */
SELECT title, COUNT(*) AS headCount
FROM employees.titles 
GROUP BY title 
HAVING COUNT(*) > 50000
ORDER BY headCount DESC;

/*Problem 12
 * Find the `emp_no` and historical average salary 
 * (rounded to 2 decimal places) for employees who have received at 
 * least 10 salary entries and maintain an average salary above $100,000.
 */
SELECT emp_no, ROUND(AVG(salary), 2) AS Avg_salary
FROM employees.salaries
GROUP BY emp_no 
HAVING COUNT(*) >= 10 AND AVG(salary) > 100000;

/*Problem 13
 * Count the number of currently active employees 
 * in each `dept_no` using `dept_emp` table.
 */
SELECT dept_no, COUNT(*) AS active_employees
FROM employees.dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no;

/* problem 14
 * Categorize all current salaries into three tiers using
 *  `CASE WHEN`: '`Entry`'(< $60,000), '`mid`' ($60,000-$90,000), 
 * and '`senior`' (>$90,000), and count employees in each tier.
 */
SELECT CASE WHEN salary < 60000 THEN 'Entry'
			WHEN salary BETWEEN 60000 AND 90000 THEN 'mid'
			WHEN salary > 90000 THEN 'senior'
		END AS salary_tier, 
		COUNT(*) AS employee_count 
FROM employees.salaries
WHERE to_date = '9999-01-01'
GROUP BY salary_tier;

/* problem 15
 * Identify the `emp_no` of all employees who have worked in more 
 * than one department over their career.
 */
SELECT emp_no 
FROM employees.dept_emp
GROUP BY emp_no 
HAVING COUNT(DISTINCT dept_no) > 1;

/*problem 16
 * For employees hired after 1998-01-01, find the minimum salary,
 *  maximum salary, and total raise amount (MAX - MIN) per employee, 
 * ordered by largest raise descending.
 */

SELECT s.emp_no,
		MIN(s.salary) AS min_salary, MAX(s.salary) AS max_salary, (MAX(s.salary) - MIN(s.salary)) AS total_raise
FROM employees.employees e
JOIN employees.salaries s ON e.emp_no = s.emp_no
WHERE e.hire_date > '1998-01-01'
GROUP BY total_raise DESC;







