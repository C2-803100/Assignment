                                    /* Assignment - 5 */


/*1.Write a query for the HR department to produce the addresses of all the departments. 
Use the LOCATIONS and COUNTRIES tables. 
Show the location ID, street address, city, state or province,andcountryintheoutput.
UseanInnerJOINtoproducetheresults */
select e.location_id,e.street_address,e.city,e.state_province,d.country_name,d.country_id  
from hr.locations e 
inner join hr.countries d 
on e.country_id = d.country_id

/*2.The HR department needs a report of all employees. 
Write a query to display the last name, department number, and department name for all employees. */
select e.last_name,e.department_id,d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id;

/*3.The HR department needs a report of employees in Toronto. 
Display the last name, job, department number, and department name for all employees who work in Toronto.*/

select e.last_name,e.department_id,d.department_name
from hr.employees e 
inner join hr.departments d
on e.department_id = d.department_id
inner join hr.locations l
on d.location_id = l.location_id
where l.city = 'Toronto';

/*4.Create a report to display the last name and employee number of employees along with their manager’s last name and manager number.
 Label the columns Employee, Emp#, Manager, and Mgr#, respectively */
select  e.last_name "Employee" , e.employee_id "Emp#",
        m.last_name "Manager" , m.employee_id "Mgr#"
from    hr.employees e join hr.employees m
on      (e.manager_id = m.employee_id); 

/*5.Write a query to displayall employees, including King, who has no manager. Order the results by the employee number */
 
select	 w.last_name "Employee", w.employee_id "EMP#",
	         m.last_name "Manager", m.employee_id "Mgr#"
from     hr.employees w 
left outer join hr.employees m
ON       (w.manager_id = m.employee_id)
order by m.employee_id;

/*6. Create a report for the HR department that displays employee last names, department numbers, and all the employees who work in the same department as a given employee.
 Give each column an appropriate label*/

select e.department_id "Department",e.last_name "Employee",c.last_name "colleague"
from hr.employees e 
inner join hr.employees c
on (e.department_id = c.department_id)
where e.employee_id <> e.employee_id
order by e.department_id,e.last_name,c.last_name;

 
/* 7. The HR department needs a report on job grades and salaries. To familiarize yourself with the JOB_GRADES table, first show the structure of the JOB_GRADES table.
 Then create a query that displays the name, job, department name, salary, and grade for all employees.*/
 
DESC JOB_GRADES

select e.last_name, e.job_id, d.department_name,
e.salary, j.grade_level
from employees e 
inner join departments d
on (e.department_id = d.department_id)
join job_grades j
on (e.salary between j.lowest_sal and j.highest_sal);
 
 
 /*8.
 The HR department wants to determine the names of all employees who were hired after Davies.
 Create a query to display the name and hire date of any employee hired after employeeDavies
 */
1.	SELECT e.last_name, e.hire_date
	FROM HR.employees e
	inner join hr.employees d
	on d.last_name = 'Davies'
	AND d.hire_date > e.hire_date;

2.  SELECT e.last_name, e.hire_date
	FROM HR.employees e, HR.employees d	
	WHERE d.last_name = 'Davies'
	AND d.hire_date < e.hire_date; 
 
/* 9.
The HR department needs to find the names and hire dates for all employees 
who were hired before their managers, along with their managers’ names and hire date.
 */
 
 select e.last_name,e.hire_date,m.last_name,m.hire_date
 from hr.employees 
 inner join hr.eemployees m
 on m.manager_id = e.employee_id
 where e.manager_id < m.hire_date;
 
 
 
 
 
 
 
 
 
 