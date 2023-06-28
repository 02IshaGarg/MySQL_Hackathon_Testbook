-- Major Question 1

-- A)List the salary of all the employees.
SELECT salary FROM employee;

-- B)Display the names of all employees with any “A” at any place of the name.
SELECT ename FROM employee WHERE ename LIKE '%a%' OR ename LIKE 'a%' OR ename LIKE '%a';

-- C)Show all employees who were hired in the first half of the month (Before the 16th of the month).
SELECT em.ename, dp.MGRSTARTD from employee as em 
inner join department as dp on em.dno = dp.dnumber where day(dp.mgrstartd) <16;

SELECT ename, bdate from employee where day(bdate) < 16;

-- D)Display the name of all female employees.
SELECT ename FROM employee WHERE sex="F";

-- E) Display the employee who is paid most in the company.
SELECT ename, salary FROM employee WHERE salary = (SELECT max(salary) FROM employee);

-- Major Question 2

-- A)Display employee name, address, department no and department name.
SELECT em.ename, em.address, em.dno, dp.dname FROM employee as em inner join department as dp on em.dno = dp.dnumber;

-- B)Display all the employees who are not in ACADEMIC department
SELECT em.*, dp.dname FROM employee as em inner join department as dp on em.dno = dp.dnumber WHERE dp.dname not like "Academic";

-- C)Display SATYAS’ project location.
SELECT em.ename, pr.plocation FROM employee as em inner join project as pr on em.dno = pr.dnum WHERE em.ename = "Satya";

-- D)Find the total working hours of each female employee. 
SELECT em.ename, sum(wr.hours) as Tot_Wor_Hours FROM employee as em inner join works_on as wr on em.esrno = wr.esrno where em.sex = "F" GROUP BY em.ename;

-- E) Display the details of the people whose projects are located at SOUTH AFRICA. 
SELECT em.*, pr.plocation FROM employee as em inner join project as pr on em.dno = pr.dnum WHERE pr.plocation = "South Africa";


