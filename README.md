# Pewlett-Hackard-Analysis

## Overview 
Pewlett Hackard (PH) is planning for the future "Silver Tsunami" by determining which positions will need to be filled with upcoming retirements. The purpose of this analysis is to determine the number of employees retiring based on their title and identify employees who are eligible for the mentorship program using SQL.

## Results

### Number of Employees Retiring per Title
A retirement_titles table was created by retrieving the applicable columns from both the Employees (emp_no, first_name and last_name) and Titles (title, from_date and to_date) tables. However, this table had duplicate entries for employees who switched titles over the years and it included employees who have already retired due to the query having no filter for the to_date column. Since PH is trying to determine positions that need to be filled, there are no issues with including retired employees. The unique_titles table was created to remove the duplicate entries by using a DISTINCT ON function to only include the first occurence of the employee number. Finally, the retiring_titles table was created using the data from the unique_titles table to show a summary of the number of employees per title. 

The image below shows that based on employees near the retirement-age (born between 1952-1955) and most recent job title: 
- The highest number of positions that will need to be filled are Senior Engineers and Senior Staff
- The lowest number of positions that will need to be filled are Managers and Assistant Engineers

![retiring_titles](https://user-images.githubusercontent.com/78664640/114323841-18e11000-9af5-11eb-8203-ee502a6d069c.png)

### Employees Eligible for the Mentorship Program
A mentorship_eligibility table was created by retrieving the applicable columns from the Employees (emp_no, first_name, last_name and birth_date), Department Employees (from_date and to_date) and Titles (title) tables. To ensure that the table displayed the current title for each eligible employee, a filter with the Titles to_date column equal to '9999-01-01' was added. A mentorship_titles table was created from the mentorship_eligibility table to show the number of eligible employees per title.

The image below shows that based on current employees born in 1965:
- There are 1,549 employees who are eligible for the Mentorship Program
- The majority of eligible employees hold a Senior Staff or Senior Engineer title

![mentorship_titles](https://user-images.githubusercontent.com/78664640/114324490-4aa7a600-9af8-11eb-9785-279e2abc4585.png)

## Summary
- The analysis on retiring employees based on title has shown that there are 7 different types of positions that will need to be filled. For further insight on roles that will be vacant once the "Silver Tsunami" begins, another query was made using the unique_titles table to show the total number of roles that will need to be filled. The image below shows that the Total Roles that will be vacant is 90,398 based on employees near the retirement age and their title.

![total_roles](https://user-images.githubusercontent.com/78664640/114334316-51deac00-9b18-11eb-8f76-8511cf46918e.png)


- Another query was executed to determine if there are enough retirement-ready employees to mentor in each department, for retiring employees born between 1952 to 1955. The total available mentors with the updated criteria are 72,458 as shown in the image below. The table below shows the number of retirement-ready employees per department. Most departments have between 3,000-5,000 eligible mentors, except for Development which has 18,368 mentors, Production has 16,172 mentors and Sales has 11,336 mentors. This analysis shows that PH should have enough retirement-ready employees in each department, considering that Production, Development and Sales are the 3 largest departments in the company. 

![total_mentors](https://user-images.githubusercontent.com/78664640/114336861-e8fa3280-9b1d-11eb-9033-14599cb864ac.png)

![dept_mentorship](https://user-images.githubusercontent.com/78664640/114335359-953a1a00-9b1a-11eb-82d0-d676bc5754b8.png)

