
                                                         --Assignment - 6 --


/* 1. 
The HR department needs a query that prompts users for an employee last name. 
The query then displays the last name and hire date of any employee in the same department as the employee whose name they supply
(excluding that employee).
For example, if the user enters Zlotkey, 
find all employees who work with Zlotkey (excluding Zlotkey).*/

select last_name , hire_date 
from hr.emloyees 
where department_id = (select department_id from hr.employees where last_name = 'Zoltkey')
and last_name <> 'Zoltkey';

/*2.Create a report that displays the employee number, last name, and salary of all employees who earn more than the average salary.
Sort the results in ascending order by salary.
*/

select employee_id,last_name,salary 
from hr.employees
where salary > (select avg(salary) from hr.employees) order by salary asc;

/*3. Write a query that displays the employee number and last name of all employees who work in 
a department with any employee whose last name contains a u.  
*/

select employee_id,last_name from hr.employees
where department_id in (select department_id from hr.employee where last_name like '%u');

/*4. The HR department needs a report that displays the last name, department number, and job ID 
of all employees whose department location ID is 1700.
*/
select last_name,department_id,job_i
from hr.employees 
where department_id in (select department_id from hr.departments where location_id = 1700);

/*5.Create a report for the HR department that displays the last name and salary of every employee who reports to King. */

select last_name,salary , manager_id , employee_id 
from hr.employees 
where manager_id in (select last_name from hr.employees where last_name = 'king');

/* 6.Create a report for the HR department that displays the department number, last name, and job ID 
for every employee in the Executive department. */

select department_id,last_name,job_id 
from hr.employees
where department_id in (select department_id from hr.departments where department_name = 'Executive');

/*7.Write a query to display the employee number, last name, and salary of all 
the employees who earn more than the average salary and who work in a department with 
any employee whose last name contains a 'u'.*/

select employee_id,last_name,salary from hr.employees
where salary > (select avg(salary) from hr.employees)
               and department_id in (select department_id 
			                         from hr.employees 
									 where last_name like '%u%');















