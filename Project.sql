--This project is to understand what are all the querries in SQL and how they work--

--Creating Tables
--1. I am going to make 3 tables: 1.1. Students
--                                1.2. Department

-- 1.1 Creating Student Table

create table student (Name char(100) not null,
                      Stu_ID int primary key,
					  location char(100) not null,
					  age int check(age >= 21),
					  email char(100) unique,
					  dept_id int not null)

-- 1.2 Creating Department Table

create table department (D_Name char(100) not null,
                      dept_ID int primary key)

-- 2. Inserting values into the table
--2.1 Inserting values into student table

insert into student (Name, stu_id, location, age, email, dept_id)
            values ('Abhishek Jain', 1, 'Bangalore', 28, 'abhishek1@gmail.com', 1),
			        ('Aisha Nizam', 2, 'Bangalore', 25, 'aisha22@gmail.com',1),
					('Ajith Joshep',3,'Kolkata', 31, 'ajithjosh@gmail.com', 1),
					('Akash Jose',4,'Bangalore', 25, 'akash2@gmail.com',1),
					('Akshatha Vijay', 5, 'Kolkata', 22, 'akshatha25@gmail.com', 2),
					('Annu Josh', 6, 'Kolkata', 29, 'anuu8@gmail.com', 2),
					('Anwita Ghosh', 7,'Kolkata', 26, 'anwita45@gmail.com', 2),
					('Areeb Ahmed',8, 'Bangalore', 21, 'areebahmed2@gmail.com', 1),
					('Barkha Tyagi', 9, 'Bangalore', 27, 'barkhat@gmail.com',1),
					('Devanshi Hingrajya', 10, 'Bangalore', 21, 'hingdeva@gmail.com',1),
					('Diksha Patel', 11,'Kolkata', 22, 'dpatel@gmail.com',2),
					('Disha Patel', 12, 'Bangalore', 25, 'dishapatel2@gamil.com', 1),
					('Gopesh Upamanyu', 13, 'Bangalore', 25, 'ugopesh@gmail.com', 2),
					('Himan Mohapatra', 14, 'Kolkata', 27, 'himanh3r3@gmail.com', 2),
					('Isha Gulzar', 15,'Kolkata', 21, 'ishagul@gmail.com',1),
					('Ishan Sharma', 16, 'Bangalore', 26, 'ishansharma2345@gmail.com',2),
					('Ishanee Panda', 17, 'Kolkata', 25, 'ishanee020@gmail.com',2),
					('Jivitesh Jivvy', 18, 'Bangalore', 22, 'jivvy34@gmail.com', 1),
					('Ketan Sonawane', 19, 'Bangalore', 26, 'ketan@gmail.com', 1),
					('Ksheetij Raj', 20, 'Kolkata', 25, 'khseetij4567@gmail.com',2)

-- 2.2 Inserting Values into Department table

insert into department (D_Name, dept_ID)
              values ('Data Engineering',1),
			         ('Data Science',2)

-- 3. Checking all the rows and columns in both the table

select * from student
select * from department

-- 4. Write a querry to retrieve data in the form - Student 'Name' is studying at 'location' location.

select 'Student ' + name + (' is studying at ') + location + 'location' as Student_loc from student

----------------------------------------------------Relational Operators--------------------------------------------------

-- 5. WAQR student name and age for all the students under dept no 2. while retrieving alias name as student_name.

select name as student_name, age
from student
where dept_id = 2

-- 6. WAQR student id, student name, location and age for all the students whose age is 22 and while retrieving alias name as student_name

select stu_id, name as student_name, location, age
from student
where age = 22

-- 7. WAQR all the students who is from Kolkata location

select * from student
where location = 'Kolkata'

-- 8. WAQR all the students whose age is atleat 22

select * from student
where age >= 22

-- 9. WAQR all the students who does not belong to dept no 1

select * from student
where dept_id != 1

--------------------------------------------------------Logical Operators---------------------------------------------------

-- 10. WAQR all the students who belong to 'Bangalore' location and belong to dept no 2

select *
from student
where location = 'Bangalore' and dept_id = 2

-- 11. WAQR all the students whose department id is 1 and age is more than 25

select *
from student
where dept_id = 1 and age > 25

-- 12. WAQR name, student id where age is either 25 or 26

select name, stu_id
from student
where age = 25 or age = 26

-------------------------------------------------------Special Operators------------------------------------------------------

-- in operator : we go for 'in' operator to eliminate 'or' condition
-- between and operator : when we have a range of values
-- like operator: uses wildcard operators (% - can hold 0-n chars, _ - can hold 1 char)

-- 13. WAQR all the students whose age is in between 22 to 30

select * from student
where age between 22 and 30

-- 14. WAQR all the students whose name has 's'

select name 
from student
where name like '%s%'

-- 15. WAQR all the students whose age is 22,25,29,31

select * from student
where age in (22,25,29,31)

-- 16. WAQR all the students whose name ends with N

select name as student_name
from student
where name like '%N'

-- 17. WAQR all the students whose last but one letter is A

select name as student_name
from student
where name like '%a_'

-- 18. WAQR all the students whose names are having 3rd char as R

select name as student_name
from student
where name like '__R%'

-- 19. WAQR all the students whose name are having exactly 10 characters

select name as student_name
from student
where name like '__________'

-- 20. WAQR all the students whose age has 3 in it

select * from student
where convert(nvarchar, age) like '%3%'

-- 21. WAQR all the students whose name does not have "S" in their email

select name, email, stu_id 
from student
where email not like '%s%'

-- 22. WAQR all the students whose age is more than 25 and having 'A' as last but one char in their name and are not in dept 1

select * from student
where age > 25 and name like '%a_'
and dept_id != 1

---------------------------------------------------------------Functions--------------------------------------------------------------------
-- Functions - These are pre-defined operations that perform specific task and returns a result based on the input provided.
-- Types: 1. Aggregate Functions (Multirow Functions) : Min(), Max(), Avg(),sum(), count()
--        2. String Functions : concat(),upper(),Lower(),length(),substring(), replace(), trim()
--        3. Numeric Functions : abs(),round(),power(),sqrt()
--        4. Date Functions : current_date(),current_time(),current_timestamp()
--        5. Window Functions : Row_number(), Rank(),dense_rank()

-- 23. what is the length of name of each student

select name, len(name) as len_name
from student

-- 24. Display student name and age with a space

select concat(name, concat(' ', age)) as Name_Age
from student

-- 25. WAQ to display as 'Smith is a student at loaction: London and is in department = dept_id'

select concat(name, concat(' is a student at location: ',concat(location, concat(' and is in department = ',concat(dept_id,'.')))))
from student

-- 26. WAQR all the students. While retrieving 1st 3 chars should be in lower case and remaining all chars should be in upper case

select concat(lower(substring(name,1,3)), upper(substring(name,4,20)))
from student

-- 27. WAQR all the student's name and while retrieving 1st and last char should be in upper case and all other should be in lower case

select concat(upper(substring(name,1,1)), 
              lower(substring(name,2,len(name)-2)), 
			  upper(substring(name, len(name),1))
			  )
from student

-- 28. WAQ to count the number of A in each name

select name, len(name) - len(replace(name,'A','')) as A_count
from student

-- 29. count the number of students

select count(name) from student

-- 30. find the maximum and minimum age of the students

select max(age), min(age)
from student

-- 31. find the name of student who has maximum length of name and minimum length of name

select max(len(name)) as max_name, min(len(name)) as min_name
from student

-- 32. WAQ to count the number of students in bangalore location

select count(*)
from student
where location = 'Bangalore'

-- 33. WAQ to find the average age of student in each department

select dept_id , avg(age)
from student
group by dept_id

-- 34. WAQ to find the maximum age of student for each department

select dept_id, max(age)
from student
group by dept_id

-- 35. WAQ to find maximum age of students for location except 'Kolkata'

select max(age)
from student
where location != 'Kolkata'
group by location

-- Using the already created employee and department table--

select * from emp
select * from dept

-- 36. WAQR number of employees in each department and select only those department which number of count is more than 3

select count(*), deptid
from emp
group by deptid
having count(*) > 3

-- 37. Find the 5th highest salary

select a.* 
from (select dense_rank() over (order by salary) as highest_sal, * from emp) as a
where a.highest_sal = 5

-- 38. Find the 6th maximum age from student table

select s.*
from (select DENSE_RANK() over (order by age) as highest_age, * from student) as s
where s.highest_age = 6

---------------------------------------------------------------------Subquerry-------------------------------------------------------
-- Sub querries mean querry inside another querry

-- 39. WAQR all the students whose department number is same as Disha Patel's dept no

select *
from student
where dept_id = (select dept_id
                 from student
				 where name = 'Disha Patel')

-- 40. WAQR all the students whose age is same as Isha Gulzar's age

select * 
from student
where age = (select age 
             from student
			 where name = 'Isha Gulzar')

-- Using employee table again--
-- 41. WAQR employee name, department id and salary for all the employees who are earning more than Bhuvana and whose department id is same as vipul's

select ename, deptid, salary
from emp
where salary > (select salary
                from emp
				where ename = 'Bhuvana')
and deptid = (select deptid
              from emp
			  where ename = 'Vipul')

-- 42. WAQR all the employee's information whose salary is more than avg salary of each dept

select *
from emp
where salary > (select avg(salary)
                from emp
				where deptid = emp.deptid)

---------------------------------------------------------------Joins------------------------------------------------------------------
-- Joins : it means combining two or more tables when they have common columns

-- 43. WAQR department information of an employee Ishanee

select * from emp
select * from dept

select e.*, d.depname
from emp e, dept d
where e.deptid = d.deptid
and e.ename = 'Ishanee'

-- Another Way--

select e.*, d.depname
from emp e join dept d on e.deptid = d.deptid
where e.ename = 'ishanee'

-- 44. WAQR all the employee names who are working under Ankur

select e.ename , m.ename as mgr_name
from emp e left join emp m on e.mgr_id = m.id
where m.ename = 'Ankur'

-- 45. WAQR employee name, their department names, their manager name as well as manager's dept name

SELECT e.ename AS emp_name, m.ename AS mgr_name, de.depname AS emp_dep_name, dm.depname AS mgr_dep_name
FROM emp e
LEFT JOIN emp m ON e.mgr_id = m.id
LEFT JOIN dept de ON e.deptid = de.deptid
LEFT JOIN dept dm ON m.deptid = dm.deptid

