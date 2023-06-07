SELECT * 
FROM [COVID19 Deaths]
Order By 3,4


--SELECT * 
--FROM [COVID19 Vaccination]
--Order By 3,4

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM [COVID19 Deaths]
Order By 1,2

--Total Cases Vs Total Deaths..check again
--The likelihood of dying incase you are infected in Malawi

SELECT location, date,  total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM [COVID19 Deaths]
WHERE location = 'Malawi'
Order By 1,2


--Total Cases vs Population 
--Shows what the percentage of population who got Covid

SELECT location, date, population, total_cases, (total_cases/population)*100 AS DeathPercentage
FROM [COVID19 Deaths]
WHERE location = 'Malawi'
Order By 1,2


--African countries with highest infection rate compared to respsective population

SELECT location, continent, population, MAX(total_cases) AS HighestInfectionCount, Max((total_cases/population)*100) AS InfectedPopulationPercentage
FROM [COVID19 Deaths]
WHERE continent = 'Africa'
Group By location, continent, population
Order By InfectedPopulationPercentage DESC

---Total Death Count per continent

SELECT location, SUM(CAST(new_deaths as int)) AS TotalDeathCount
FROM [COVID19 Deaths]
WHERE continent IS NULL
AND location not in ('World', 'European Union', 'International')
Group By location
Order By TotalDeathCount DESC



--Countries with highest infection rate compared to respective population around the world

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, Max((total_cases/population)*100) AS InfectedPopulationPercentage
FROM [COVID19 Deaths]
Group By location, population
Order By InfectedPopulationPercentage DESC


--Countries with highest infection rate compared to respective population and period 
SELECT date, location, population, MAX(total_cases) AS HighestInfectionCount, Max((total_cases/population)*100) AS InfectedPopulationPercentage
FROM [COVID19 Deaths]
Group By date, location, population
Order By InfectedPopulationPercentage DESC


--Countries with highest death count per population globally
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM [COVID19 Deaths]
WHERE continent Is Not Null
Group By location
Order By TotalDeathCount DESC


--Continents with highest death count per population

SELECT continent, MAX(total_deaths) AS TotalDeathCount
FROM [COVID19 Deaths]
WHERE continent Is Not Null
Group By continent
Order By TotalDeathCount DESC


--African countries with highest death count per population
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM [COVID19 Deaths]
WHERE continent = 'Africa'
Group By location
Order By TotalDeathCount DESC



--NewCases AND NewDeaths Globally

SELECT date, SUM(new_cases) AS Total_Cases, SUM(new_deaths) AS Total_Deaths 
FROM [COVID19 Deaths]
GROUP BY date
ORDER BY 1,2


--Total population Vs Total vaccinated globally

SELECT Dea.continent, Dea.location, Dea.continent, Dea.date, Dea.population, Vacc.new_vaccinations
FROM [COVID19 Deaths] AS Dea
JOIN [COVID19 Vaccination] AS Vacc
  ON Dea.location = Vacc.location
  AND Dea.date = Vacc.date
WHERE Dea.continent IS NOT NULL
  ORDER BY 2,3


 --The correlation between the number of deaths and the number of people vaccinated in Malawi.

  SELECT Deaths.date, Deaths.location, Vacc.people_vaccinated, Deaths.total_deaths 
  FROM [COVID19 Deaths] AS Deaths
  JOIN [COVID19 Vaccination] AS Vacc
  ON Deaths.location = Vacc.location
  AND Deaths.date = Vacc.date
  WHERE Deaths.location = 'Malawi' 
  


--  DROP TABLE IF EXISTS #VaccPop
--CREATE TABLE #VaccPop
--(Continent varchar(50),
--Location Varchar (50),
--date datetime,
--Population int,
--new_vaccination int,
--NewVaccinationSum int)





