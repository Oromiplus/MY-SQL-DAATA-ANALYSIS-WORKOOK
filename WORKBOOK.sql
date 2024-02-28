 
--adding values to an exisitng table
INSERT INTO EmployeeDemographics VALUES
(1002, 'Trim', 'Faye', 32, 'Female'),
(1003, 'Meng', 'Fred', 30, 'Female'),
(1004, 'Howard', 'Ross', 29, 'Male'),
(1005, 'Dent', 'Asee', 32, 'Male'),
(1006, 'Taye', 'Taye', 36, 'Female'),
(1007, 'Ricky', 'Jones', 43, 'Male'),
(1008, 'Sands', 'Mud', 64, 'Male')

--adding new values to an existing table


--using SELECT and FROMfunction in SQL to return 
--select everything
select*  
FROM EmployeeDemographics  --This returns all rows& columns from the table

--extracting first names from the table
select FrirstName  
FROM EmployeeDemographics

select top 5 *
from EmployeeDemographics

--selecting unique values from employeeid column
select distinct(EmployeeID)
from EmployeeDemographics

--using count, we have 8 last names here
select count(LastName)
from EmployeeDemographics

--the maximum salary is 60000
select max(Salary)
from EmployeeSalary


--the average salary is 49444
select avg(Salary)
from EmployeeSalary

--All the salaries
select * 
from EmployeeSalary

--using WHERE function to find locations of data
select *
FROM EmployeeDemographics
WHERE  FrirstName= 'Taye'

--Using <> for the same function above, it returns evertything except Taye
select *
FROM EmployeeDemographics
WHERE  FrirstName<>'Taye'

--everyone above the age of 40, there are only 2
select *
FROM EmployeeDemographics
WHERE  Age > 40

--using and or  to get males who are younger than 32 years
select *
FROM EmployeeDemographics
WHERE  Age <= 32 AND Gender = 'MAle'

--using and or  to get males who are older or equal 32 years
select *
FROM EmployeeDemographics
WHERE  Age >= 32 AND Gender = 'MAle'

--using and or  to get males and females who are younger than 32 years
select *
FROM EmployeeDemographics
WHERE  Age <= 32 or Gender = 'Female'

--all last names that start with T, there's only one
select *
FROM EmployeeDemographics
WHERE LastName LIKE 'T%'

--all last names that start with Ro, there's only one
select *
FROM EmployeeDemographics
WHERE LastName LIKE 'Ro%'


--Using NULL and not NULL , it returns nothing we don't have any empty cell
select *
FROM EmployeeDemographics
WHERE LastName is NULL

--Using NULL and not NULL , it returns everything bcuz
--we don't have any empty cell
select *
FROM EmployeeDemographics
WHERE LastName is NOT NULL

--Using GROUPBY to classify all males and females into diff rows
select Gender
FROM EmployeeDemographics
GROUP BY Gender 

--gives the number of males and females
select Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender 

--gives the number of males and females and their column number and arranges them
select Gender, Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
GROUP BY Gender, Age
order by CountGender ASC

--gives the number of males and females and their column number and arranges them
select Gender, Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
GROUP BY Gender, Age
order by Gender DESC

--gives age in asc order but gender in desc order
select Gender, Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
GROUP BY Gender, Age
order by Age ASC, Gender DESC

--using numbers to query columns
select *
FROM EmployeeDemographics
order by 2 ASC, 5 DESC

--using JOIN  to jpoin tbales togther

select*
FROM master.dbo.EmployeeDemographics
Inner join master.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Picking only employeeid, lastname, first name and salary
select EmployeeDemographics.EmployeeID, FrirstName, LastName, Salary
FROM master.dbo.EmployeeDemographics
 Inner join master.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--An average salesman salary
select JobTitle, AVG(Salary)
FROM master.dbo.EmployeeDemographics
 Inner join master.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'

--suing UNION to joinb tables together and removes duplicates


--select FrirstName, LastName, Age,
CASE
	WHEN age > 40 THEN "Old",
	WHEN Age BETWEEN 27 AND 35 THEN "Young",
	ELSE "Baby"
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age  

select FrirstName, LastName, JobTitle,Salary
CASE
	WHEN JobTitle = 'Salesman' THEN Salary +(Salary*.10)
	WHEN JobTitle = 'Secretary' THEN Salary +(Salary*.05)
	WHEN JobTitle = 'Clerk' THEN Salary +(Salary *.07)
	ELSE Salary + (salary * .3)

--joining Demograpics with with salary


select EmployeeDemographics.EmployeeID, FrirstName, LastName,Salary
FROM master.dbo.EmployeeDemographics
full outer join master.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FrirstName <> 'Michael'

--The average salary for the secreatry
select JobTitle,AVG(Salary)
FROM master.dbo.EmployeeDemographics
full outer join master.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Secretary'
GROUP BY JobTitle

--The average salary for the salesman
select JobTitle,AVG(Salary)
FROM master.dbo.EmployeeDemographics
full outer join master.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle

--using unions join demographics and salary
--tables must always be the same while using union
select EmployeeID, FrirstName, Age
from master.dbo.EmployeeDemographics
UNION
select employeeID, JobTitle, Salary
from master.dbo.EmployeeSalary
order by EmployeeID

--Selecting first and last names with age 
--values in descending order
select FrirstName, LastName,Age,
CASE
	WHEN Age > 38 THEN 'Old'
	WHEN Age BETWEEN 27 and 30 THEN 'Baby'
	ELSE 'Young'
END
FROM master.dbo.EmployeeDemographics
WHERE Age is not null
Order by Age DESC

--1:10 minutes

--running the tables sepaarately.
select EmployeeID, FrirstName, Age
from master.dbo.EmployeeDemographics


select employeeID, JobTitle, Salary
from master.dbo.EmployeeSalary
order by EmployeeID

--The age value is wrong, age cannot be 3000
select EmployeeID, FrirstName, Age
from master.dbo.EmployeeDemographics
UNION
select employeeID, JobTitle, Salary
from master.dbo.EmployeeSalary
order by EmployeeID

select FrirstName, LastName, Age,
case
	when Age > 36 then 'old'
	when Age between 30 and 35 then 'baby' 
	else 'young'
END
from master.dbo.EmployeeDemographics
where Age is not null
order by Age 


--updating and deleting table
select*
from master.dbo.EmployeeDemographics
delete from master.dbo.EmployeeDemographics
where EmployeeID = 1005 --1005 employeeids are deleted

--aliasing

select FrirstName as Fname
from [master].[dbo].[EmployeeDemographics]

select a.EmployeeID, a.FrirstName
from [master].[dbo].[EmployeeDemographics] a

select a.EmployeeID, a.FrirstName,b.JobTitle,c.Age
from [master].[dbo].[EmployeeDemographics] a
left join [master].[dbo].[EmployeeSalary] b
on a.EmployeeID = b.EmployeeID
left join

--partition by
select FrirstName, LastName, Gender, Salary
, count (Gender) OVER (partition by Gender) as TotalGender
from master.dbo.EmployeeDemographics dem
join master.dbo.EmployeeSalary sal
on dem.EmployeeID = sal.EmployeeID


/* 
CTEs not working
with CTE_employee as 
(select FrirstName, LastName, Gender, Salary
, count (Gender) OVER (partition by Gender) as TotalGender
, AVG(Salary)OVER (partition by Gender) as AvgSalary
from master.dbo.EmployeeDemographics emp
join master.dbo.EmployeeSalary sal
on emp.EmployeeID = sal.EmployeeID),
WHERE Salary > '3000'
)
select* 
from cte_employee */

--Temporary tables

create table #temp_employee(
Employee_ID int,
JobTitle varchar (50),
Salary int
)

select *
from #temp_employee

insert into #temp_employee values (
'1001', 'HR', 200000)

--adding another table into this 

insert into #temp_employee values (
'1001', 'HR', 200000)
select *
from master.dbo.EmployeeSalary

--1:44 mins

/*
string funcrtions:
trim,  ltrim, rtrim, replace,
substring, upper, lower
*/

--doesn't work
drop table if exists
create table #temp_employee (
JobTitle varchar(50),
EmployeeperJob int,
AvAge int,
AvgSalary int
)

insert into #temp_employee
select JobTitle, count(JobTitle), Avg(Age), Avg(Salary),
from master.dbo.EmployeeDemographics emp,
join master.dbo.EmployeeSalary sal,
on emp.EmployeeID = sal.EmployeeID
group by JobTitle

--selecting only lastnames
select LastName
from EmployeeDemographics

--writing in small letters
select FrirstName, lower(FrirstName)
from EmployeeDemographics

--writing in cap letters
select FrirstName, upper(LastName)
from EmployeeDemographics

--writing in cap left trim
select FrirstName, ltrim(LastName)
from EmployeeDemographics


create table Rubbish_table
(
EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

select *
from Rubbish_table

INSERT INTO rubbish_table VALUES
(002, 'Trim', 'Faye', 32, 'Female'),
(003, 'Meng', 'Fred', 30, 'male'),
(004, 'Howard', 'Ross', 29, 'Male'),
(005, 'Dent', 'Asee', 32, 'Male'),
(006, ' Taye', 'Taye', 36, 'male'),
(007, 'Ricky', 'Jon  es', 43, 'Male'),
(008, 'Sands', 'Mud', 64, 'Male'),
(005, 'Dent', 'Asee', 32, 'Male  '),
(006, 'Baayye', 'TSee', 36, 'male'),
(007, 'Rasy', 'fjkjfs', 43, 'Male'),
(008, 'Sasa', 'Mided', 64, 'Male')

select FirstName, trim (FirstName) as TRIM
from Rubbish_table


select LastName, trim (LastName) as TRIM
from Rubbish_table

-- trimming from right
select LastName, rtrim (LastName) as rTRIM
from Rubbish_table


select LastName, ltrim (LastName) as LTRIM
from Rubbish_table

--using substring- picks first 3 letters from first names
select SUBSTRING(FirstName, 1,3)
from Rubbish_table

select SUBSTRING(FirstName, 3,3) --next 3 letters from 3rd letter
from Rubbish_table

--The 3rd letters in each lastname
select SUBSTRING(LastName,3 ,1)
from Rubbish_table

select  FirstName
from Rubbish_table

--stored procdures
CREATE PROCEDURE TEST
AS 
select *
from EmployeeDemographics

-- use EXEC command to run procedures
exec TEST

CREATE PROCEDURE RUB
AS
from  EmployeeDemographics
--2hours 3 mins

--using upper and lower
select FrirstName lower
from EmployeeDemographics

--using upper and lower
--repeating firstnme again creates it in another column
select FrirstName, upper(FrirstName)
from EmployeeDemographics

CREATE PROCEDURE RUB
AS
select *
from  EmployeeDemographics


--i dont even know whats happening here
/*select*
from Employee2

insert into Employee2
select JobTitle, count(JobTitle), 
AVG(Age), AVG(salary)
from master.dbo.EmployeeDemographics
join master.dbo.EmployeeSalary
*/

--suqueries, not working still
select Salary,(select(AVG(Salary) from EmployeeSalary)
from EmployeeSalary

-- my data was inported in sheets instaed of one table
select *
from PortfolioProject.dbo.Sheet1$

--sheet 2 only f1 is here
select *
from PortfolioProject.dbo.Sheet2$

-- only f1 again
select *
from PortfolioProject.dbo.Sheet3$

select *
from PortfolioProject.dbo.Sheet1$
order by 3, 4

select Location, date, total_cases, new_cases,total_deaths, population
from PortfolioProject.dbo.Sheet1$
order by 1,2

--total cases vs total deaths, doesn't work
select Location, date, total_cases,total_deaths, (total_cases/total_deaths) *100 as DeathPercent
from PortfolioProject.dbo.Sheet1$
where location like '%states%'
order by 1,2

select *
from PortfolioProject.dbo.CovidDeaths

--cases from United States
select Location, date, total_cases,total_deaths
from PortfolioProject.dbo.CovidDeaths
where location like '%states%'
order by 1,2

select *
from PortfolioProject.dbo.CovidDeaths

--Shows the percentage of the population that got covid
select Location, date, total_cases,population, (total_cases/Population) *100 as DeathPercent
from PortfolioProject.dbo.Sheet1$
where location like '%states%'
order by 1,2

--likelihood of dying if you got covid
select Location, date, total_cases,population, (total_cases/Population) *100 as DeathPercent
from PortfolioProject.dbo.CovidDeaths
where location like '%states%'
order by 1,2

--country with the highest infection rate compared
-- to population.

select Location, Population, max(total_cases) as Highest_InfectionCountry, max(total_cases/Population)*100 as PercentPopulationInfected
from PortfolioProject.dbo.CovidDeaths
group by location population
order by PercentPopulationInfected desc


--Total cases, worldwide daily
select date, sum(new_cases) -- as Highest_InfectionCountry, max(total_cases/Population)*100 as PercentPopulationInfected
From PortfolioProject.dbo.CovidDeaths
where continent is not null
Group by date
order by 1, 2

--Cases from Asian continent
select * 
From PortfolioProject.dbo.CovidDeaths 
where continent like '%Asia%'

--Nigeria covid report descending order by date
select Location, date
From PortfolioProject.dbo.CovidDeaths 
where Location like '%Nigeria%'
order by date desc

select *
 from PortfolioProject.dbo.CovidVaccination

--THIS DOESNT RUN
select sum(new_cases) AS total_cases, sum(cast(new_deaths AS int)) AS total_deaths, sum(cast(
 (new_deaths AS INT))/sum(New_cases)*100 AS DeathPercentage
from PortfolioProject.dbo.CovidDeaths
where continent is not null
order by 1, 2

--total population of each country vs vaccination
select dea.continent, dea.location, dea.date, dea.population, vac.total_vaccinations
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2, 3

--rolling count
select dea.continent, dea.location, dea.date, dea.population, vac.total_vaccinations
, sum(convert(int, vac.total_vaccinations)) over (partition by dea.Location order by dea.location,
dea.Date)
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2, 3
--using CTE

--rolling count with CTE, doesn't work
with PopsVac(dea.continent, dea.Location, dea.date, dea.Population, total_vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.total_vaccinations
, sum(convert(int, vac.total_vaccinations)) over (partition by dea.Location order by dea.location,
dea.Date)
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2, 3
)
select *, (RollingPeopleVaccinated/Population*100)
from PopsVac

--temp table
create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations nvarchar(255),
RollingPeopleVaccinated Numeric
)

Drop table if exists #PercentPopulationVaccinated
select *
from #PercentPopulationVaccinated


--creating views for data visualizations, there is an error with this code
create View PercentPopulationVaccinated
insert into PercentPopulationVaccinated 

select dea.continent, dea.location, dea.date, dea.population, vac.total_vaccinations
, sum(convert(int, vac.total_vaccinations)) over (partition by dea.Location order by dea.location,
dea.Date) as RollingPeopeVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2, 3



