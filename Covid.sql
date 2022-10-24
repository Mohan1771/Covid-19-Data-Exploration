CREATE database covid;
use covid;
SELECT * 
FROM covid_deaths
ORDER BY 3, 4;

SELECT * 
FROM covid_vaccination
ORDER BY 3, 4;

SELECT location, date, total_cases, new_cases, total_deaths
FROM covid_deaths
ORDER BY 1, 2;

-- Total cases vs Total deaths
SELECT location, date, total_cases, total_deaths, round((total_deaths/total_cases)*100,2) as death_percentage
FROM covid_deaths
where location like '%India%'
ORDER BY year(2);

-- Total cases vs Population
SELECT location, date, total_cases, population, round((total_cases/population)*100,2) as death_percentage
FROM covid_deaths
where location like '%India%'
ORDER BY year(2);

-- Countries with Highest infection rate compared to population
SELECT location, population, max(total_cases) as highest_infection_count, round((max(total_cases/population))*100,2) as 
Percentage_Population_infected
FROM covid_deaths
-- where location like '%India%'
group by Location, population 
ORDER BY Percentage_Population_infected desc;

-- Showing countries with higest death count per population
SELECT continent, location, max(cast(total_deaths as double)) as total_death_count 
FROM covid_deaths
-- where location like '%India%'
-- where continent != ' ' -- not working
group by Location
ORDER BY total_death_count desc; 

-- Showing continent with higest death count per population
SELECT continent, max(cast(total_deaths as double)) as total_death_count 
FROM covid_deaths
group by continent
ORDER BY total_death_count desc; 

-- Total deaths and cases.
select SUM(new_cases) as total_case, sum(new_deaths ) as total_Deaths,  sum(new_deaths )/SUM(new_cases)*100 as
death_percentage
from covid_deaths;




