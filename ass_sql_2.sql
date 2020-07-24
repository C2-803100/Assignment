                    --Assignment-2. --
					
--1.Because of budget issues, the HR department needs a report that displays the last name and salary of employees who earn more than $12,000.
select * from hr.employees 
where salary > 12000;

--2.Create a report that displays the last name and department number for employee 176.
select last_name , department_id from hr.employees 
where employee_id = 176;

--3.The HR department needs to find high-salary and low-salary employees. Write a queryto display the last name and salary for any employee whose salary is not in the $5,000–$12,000 range.
select last_name , salary from hr.employees 
where salary not between 5000 and 12000;

--4.Create a report to display the last name, job ID, and start date for the employees whose last names are Matos and Taylor. Order the query in ascending order by start date.
select last_name , job_id , hire_date from hr.employees 
where last_name='Matos' or last_name='Taylor' order by hire_date asc;

/*select last_name , job_id , hire_date from hr.employees 
where last_name='Matos' order by hire_date asc;
*/
--5.Display the last name and department number of all employees in departments 20 or 50 in ascending alphabetical order by name.
select last_name , department_id from hr.employees 
where department_id in (20,50) 
order by last_name;

--6.Write a query to display the last name and salary of employees who earn between $5,000 and $12,000, and are in department 20 or 50. Label the columns Employee and Monthly Salary, respectively.
select last_name "Employee", salary "Monthly Salary" from hr.employees 
where salary between 5000 and 12000  
and department_id in(20,50);

--7.The HR department needs a report that displays the last name and hire date for all employees who were hired in 1994.
select last_name , hire_date from hr.employees 
where hire_date like '%94';

--8.Create a report to display the last name and job title of all employees who do not have a manager.
select last_name , job_id from hr.employees 
where manager_id is null;

--9.Create a report to display the last name, salary, and commission of all employees who earn commissions. Sort the data in descending order of salary and commissions.
select last_name , salary , commission_pct from hr.employees 
where commission_pct is not null 
order by salary,commission_pct desc;

--10.The HR department wants to run reports based on a manager. Create a query for the following managers and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.

--manager ID = 103, sorted by employee last name:
select employee_id ,last_name,salary ,department_id from hr.employees 
where manager_id = 103;

--manager ID = 201, sorted by salary: 
select employee_id ,last_name,salary ,department_id from hr.employees 
where manager_id = 201 
order by salary;

--manager ID = 124, sorted by employee ID:
select employee_id ,last_name,salary ,department_id from hr.employees 
where manager_id = 103 
order by last_name;

--11.Display all employee last names in which the third letter of the name is “a.”
select last_name from hr.employees 
where last_name like '__a%';

--12.Display the last names of all employees who have both an a and an e in their last name.
select last_name from hr.employees 
where last_name like '__a%' 
and last_name like '__e%';

--13.Display the last name, job, and salary for all employees whose jobs are either that of a sales representative or a stock clerk, and whose salaries are not equal to $2,500, $3,500, or $7,000.
select last_name,job_id,salary from hr.employees 
where job_id in ('SA_REP','ST_CLERK') 
and salary not in (2500,3500,7000);

--14.Create a query to display the last name, salary, and commission for all employees whose commission amount is 20%.
select last_name,salary,commission_pct from hr.employees 
where commission_pct = .20;











