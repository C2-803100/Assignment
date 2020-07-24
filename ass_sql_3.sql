  
									-- Assignment-3. -- 

--1.Write a query to display the current date. Label the column Date.
select sysdate "date" 
from dual;

--2.The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.
select  employee_id,last_name,salary, 
round(salary*1.15,0) "New_salary"  
from hr.employees;

--3.Modify the query created in the last question to add a column that subtracts the old salary from the new salary. Label the column Increase.
select  employee_id,last_name,salary, 
round(salary*1.15,0) "New_salary", 
round(salary*1.15,0)-salary "Increase..." 
from hr.employees;

--4.Write a query that displays the last name (with the first letter uppercase and all other letters lowercase) and the length of the last name for all employees whose name starts with the letters J, A, or M. Give each column an appropriate label. Sort the results by the last names of the employees.
select initcap(last_name) "Name",  
length(last_name) "Length"  
from hr.employees 
where last_name like '%J' 
or    last_name like '%M' 
or    last_name like '%A' 
order by last_name;

--4.1 Rewrite the query so that the user is prompted to enter a letter that starts the last name. For example, if the user enters H when prompted for a letter, the output should show all employees whose last name starts with the letter H
select initcap(last_name) "Name",length(last_name) "Length"  
from hr.employees 
where last_name like '%H%' 
order by last_name;

--5.The HR department wants to find the duration of employment for each employee. For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order b
select last_name , round(months_between(sysdate,hire_date)) MONTHS_WORKED           --NESTED FUNCTION 
FROM hr.employees 
order by months_between(sysdate,hire_date);

--6.Create a report that produces the following for each employee: <employee last name> earns <salary> monthly but wants <3 times salary>. Label the column Dream Salaries.
select last_name || 'earn' || to_char(salary,'fm99999') || ' monthly but wants ' || to_char(salary*3,'fm99999') ||'.' "Dream Salary" 
from hr.employees;

--7.Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with the $ symbol. Label the column SALARY.
select last_name,lpad(salary,15,'$') salary  
from hr.employees;

--8.Display each employee’s last name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the format similar to “Monday, the Thirty-First of July, 2000.
select last_name, hire_date, 
    to_char(next_day(add_months(hire_date , 6) , 'Monday') , 
    'fmday , "the" Ddspth, "of" month , yyyy') REVIEW 
from hr.employees;

--9.Display the last name, hire date, and day of the week on which an employee started. Label the column DAY. Order the results by the day of the week, starting with Monday
select last_name,hire_date, 
        to_char(hire_date,'Day') day 
from hr.employees 
order by to_char(hire_date-1,'d');


--10.Create a query that displays the employees’ last names and commission amounts. If an employee does not earn a commission, show “No Commission.” Label the column COMM
select last_name , 
    nvl(to_char(commission_pct),'No Commission') COMM 
from hr.employees;

--11.Create a query that displays the first eight characters of the employees’ last names and indicates the amounts of their salaries with asterisks. 
--Each asterisk signifies a thousand dollars. Sort the data in descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES
select rpad(last_name,8)|| ' '||rpad(' ',salary/1000+1,'*')EMPLOYEES_AND_THEIR_SALARIES
from hr.employees
order by salary desc;

--12.Using the DECODE function, write a query that displays the grade of all employees based on the value of the JOB_ID column, using the following data.
select job_id,
        CASE job_id
            when 'ST_CLERK' then 'E'
            when 'SA_REP' then 'D'
            when 'IT_PROG' then 'C'
            when 'ST_MAN' then 'B'
            when 'AD_PRES' then 'A' 
            else '0' end Grade
from hr.employees;

--13.Rewrite the statement in the preceding exercise using the CASE syntax.
select job_id, decode(job_id,
                     'ST_CLERK', 'E',
                         'SA_REP', 'D',
                         'IT_PROG','C',
                         'ST_MAN', 'B',
                         'AD_PRES', 'A', 
                         '0')Grade
from hr.employees;