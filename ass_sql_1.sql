--1.The following SELECT statement executes successfully:
 --SELECT last_name, job_id, salary AS Sal FROM   employees;
 --> TRUE.
 
 --2.The following SELECT statement executes successfully: 
 --SELECT * FROM   job_grades.
 --> TRUE.
 
 --3.There are four coding errors in the following statement. Can you identify them? 
 /*SELECT    employee_id, last_name sal x 12 
 ANNUAL SALARY FROM employees;*/
 -->
->The EMPLOYEES table does not contain a column called sal. The column is called
  SALARY.
–> The multiplication operator is *, not x, as shown in line 1.
–> The ANNUAL SALARY alias cannot include spaces. The alias should read
   ANNUAL_SALARY or be enclosed in double quotation marks. 
–> A comma is missing after the column, LAST_NAME.

--4.You have been hired as a sql programmer for ABC corporation. Your first task is to create some reports based on the data from the human resources tables.
DESCRIBE hr.departments;

select * from hr.departments

--5.You need to determine the structure of the EMPLOYEES table. 
 --The HR department wants a query to display the last name, job code, hire date, and employee number for each employee, with the employee number appearing first.
 --Provide an alias STARTDATE for the HIRE_DATE column. Save your SQL statement to a file named so that you can dispatch this file to the HR department. 

SELECT employee_id, last_name, job_id, hire_date "STARTDATE"
FROM hr.employees

--6.The HR department needs a query to display all unique job codes from the EMPLOYEES table.
SELECT distinct job_id 
FROM hr.employees;

--7.The HR department wants more descriptive column headings for its report on employees. Name the column headings Emp #, Employee, Job, and Hire Date, respectively. Then run your query again.
SELECT employee_id "Emp #", last_name "Employee", 
job_id "Job", hire_date "Hire Date" 
FROM hr.employees;

--8.The HR department has requested a report of all employees and their job IDs. Display the last name concatenated with the job ID (separated by a comma and space) and name the column Employee and Title.
select last_name||','||job_id "Employee and Title" 
from hr.employees;

--9.To familiarize yourself with the data in the EMPLOYEES table, create a query to display all the data from that table. Separate each column output with a comma. Name the column THE_OUTPUT.
select employee_id||','||first_name||','||last_name||','||email||','||phone_number||','||hire_date||','||job_id||','||salary||','||commission_pct||','||manager_id||','||department_id The_Output 
from hr.employees;


