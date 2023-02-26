select * from dataproject..CovidDeath
where continent is not null
order  by 3,4

select * from dataproject..CovidVaccination order by 3,4

--select data that we are going to be using
select location, date, total_cases, new_cases, total_deaths, population
from dataproject..CovidDeath
order  by 1,2

-- looking at total cases vs total deaths
-- show likelihood of dying
select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from dataproject..CovidDeath
--where location like '%state%'
order  by 1,2

--looking at total cases vs population 
--shows what percentage of population got covid

select location, date, population, total_cases, (total_cases/population)*100 as percent_population_infected
from dataproject..CovidDeath
order  by 1,2


-- looking at countries with highest infection rate compared to population
select location, population, max(total_cases) as highest_infection_count, max((total_cases/population))*100 as percent_population_infected
from dataproject..CovidDeath
group by location, population
order  by percent_population_infected desc

--showing countries with highest death count per population

select location, max(cast(total_deaths as int)) as Total_death_count
from dataproject..CovidDeath
where continent is not null
group by location
order  by Total_death_count desc



--showing continent with the highest death count

select continent, max(cast(total_deaths as int)) as Total_death_count
from dataproject..CovidDeath
where continent is not null
group by continent
order  by Total_death_count desc

-- global numbers

select  date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_death, sum(cast(new_deaths as int))/sum(new_cases)*100 as death_percentage
from dataproject..CovidDeath
where continent is not null
group by date
order by 1,2


-- looking at total population vs vaccination

with PopvsVac(continent, location, date, population, new_vaccinations, Rolling_people_Vaccinated) 
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
sum(Cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, 
dea.date) as Rolling_people_Vaccinated
from dataproject..CovidDeath dea
join dataproject..CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
select * , (Rolling_people_Vaccinated/population)*100
from PopvsVac

--Temp table

drop table if exists Percent_population_vaccinated
create table Percent_population_vaccinated
(
continent nvarchar(225),
location nvarchar (225),
date datetime,
population numeric,
new_vaccination numeric,
Rolling_people_Vaccinated numeric
)
insert into Percent_population_vaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
sum(Cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, 
dea.date) as Rolling_people_Vaccinated
from dataproject..CovidDeath dea
join dataproject..CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null
--order by 2,3

select * , (Rolling_people_Vaccinated/population)*100
from Percent_population_vaccinated


create view Percent_population_vaccinated1 as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
sum(Cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, 
dea.date) as Rolling_people_Vaccinated
from dataproject..CovidDeath dea
join dataproject..CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3


select *
from Percent_population_vaccinated
