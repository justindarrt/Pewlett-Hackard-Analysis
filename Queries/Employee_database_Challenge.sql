--1st Query (retirement_titles)
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date 
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON (e.emp_no = t.emp_no) 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


--2nd Query (unique_titles)
SELECT DISTINCT ON (r.emp_no) r.emp_no,
	r.first_name, 
	r.last_name,
	r.title
INTO unique_titles
FROM retirement_titles AS r
WHERE r.to_date ='9999-01-01'
ORDER BY r.emp_no,r.to_date DESC;


--3rd Query (retiring_titles)
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;


--4th Query (mentorship_eligibilty)
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name,
	e.birth_date,
	t.title,
	d.from_date,
	d.to_date 
INTO mentorship_eligibilty
FROM employees AS e
JOIN titles AS t
ON (e.emp_no = t.emp_no) 
JOIN dept_emp AS d
ON (e.emp_no = d.emp_no) 
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND (d.to_date ='9999-01-01')
ORDER BY e.emp_no;
