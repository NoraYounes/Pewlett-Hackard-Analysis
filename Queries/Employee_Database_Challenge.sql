# Employee_Database_Challenge
-- Deliverable 1 
-- Create Retirement Titles Table
SELECT e.emp_no,
	e.first_name, 
	e.last_name,
	ts.title,
	ts.from_date,
	ts.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS ts
ON e.emp_no = ts.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Remove duplicate employees 
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Titles Count
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;
------------------------------------------------
-- Deliverable 2
-- Create Mentorship Eligibility Table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ts.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_employees AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS ts
ON e.emp_no = ts.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
AND (ts.to_date = '9999-01-01') 
ORDER BY e.emp_no;

SELECT COUNT(title), title
INTO mentorship_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(title) DESC;
------------------------------------------------
-- Deliverable 3 Summary
-- Total Vacant Roles
SELECT COUNT (title) AS "Total Roles"
FROM unique_titles;

-- Departments Mentorship 
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.dept_no,
	de.from_date,
	de.to_date,
	ts.title
INTO mentorship_dept
FROM employees AS e
INNER JOIN dept_employees AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS ts
ON e.emp_no = ts.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (de.to_date = '9999-01-01')
AND (ts.to_date = '9999-01-01') 
ORDER BY e.emp_no;

SELECT COUNT(d.dept_name), d.dept_name,
	md.dept_no,
	md.title
INTO dept_mentorship
FROM mentorship_dept AS md
INNER JOIN departments as d
ON md.dept_no = d.dept_no
GROUP BY md.title, md.dept_no, d.dept_name
ORDER BY md.dept_no;

SELECT COUNT(dept_no) AS "Total Mentors"
FROM mentorship_dept;