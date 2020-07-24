--1.Group functions work across many rows to produce one result per group.
-->TRUE 

--2.Group functions include nulls in calculations.
-->FALSE. Group functions ignore null values. If you want to include null values, use the NVL function.

--3.The WHERE clause restricts rows before inclusion in a group calculation.
-->TRUE

--4.Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
SELECT ROUND(MAX(SALARY),0) "MAXIMUM",
        ROUND(MIN(SALARY),0) "MINIMUM",
        ROUND(AVG(SALARY),0) "AVERAGE",
        ROUND(SUM(SALARY),0) "SUM"
FROM HR.EMPLOYEES;

--5.Write a query to display the minimum, maximum, sum, and average salary for each job type. 
select job_id , ROUND(MAX(SALARY),0) "MAXIMUM",
        ROUND(MIN(SALARY),0) "MINIMUM",
        ROUND(AVG(SALARY),0) "AVERAGE",
        ROUND(SUM(SALARY),0) "SUM"
from hr.employees
group by job_id;

--6.Write a query to display the number of people with the same job.
select job_id, count(*)
from hr.employees
group by job_id;

--7.Determine the number of managers without listing them. Label the column Number of Managers. Hint: Use the MANAGER_ID column to determine the number of managers.
select count(distinct manager_id)" number of managers"
from hr.employees;

--8.Find the difference between the highest and the lowest salaries. Label the column DIFFERENCE.
select max(salary)-min(salary) "Difference"
from hr.employees;

--9.Create a report to display the manager number and the salary of the lowest-paid employee for that manager. 
--Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.

select manager_id , min(salary)
from hr.employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc;

--10.Create a query to display the total number of employees and, of that total, the number of employees hired in 1995, 1996, 1997, and 1998. Create appropriate column headings.
select count(*) total,
sum(decode(to_char(hire_date,'yyyy'),1995,1,0)) "1995",
sum(decode(to_char(hire_date,'yyyy'),1996,1,0)) "1996",
sum(decode(to_char(hire_date,'yyyy'),1997,1,0)) "1997",
sum(decode(to_char(hire_date,'yyyy'),1998,1,0)) "1998"
from hr.employees;



--11.Create a matrix query to display the job, the salary for that job based on the department number, and the total salary for that job, for departments 20, 50, 80, and 90, giving each column an appropriate heading. 
select distinct job_id,
    sum(case department_id when 20 then salary end)"dept 20",
    sum(case department_id when 50 then salary end)"dept 50",
    sum(case department_id when 80 then salary end)"dept 80",
    sum(case department_id when 90 then salary end)"dept 90"
from hr.employees
group by job_id;












