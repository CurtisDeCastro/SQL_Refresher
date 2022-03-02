
-- Returns table with country name, continent and population columns for each entry with a value in any corresponding column within the 'world' table
SELECT name, continent, population
FROM world

-- returns a table with one column, 'name', containing all entries in the name column whose corresponding value in the population column is greater than 200 million
SELECT name FROM world
WHERE population >= 200000000

-- returns a table with columns 'name' and 'GDP per Capita' for each country with a populaton over 200 million, with the gdp per capita being derived from dividing the total GDP by the total population
SELECT name, gdp/population AS 'GDP per capita'
FROM world
WHERE population >= 200000000

-- returns a table with columns 'Name' and 'Population (mm)' for each country whose continent is listed as 'South America', with the population being represented in millions
SELECT Name, population/1000000 AS 'Population (mm)'
FROM world
WHERE continent = 'South America'

-- returns a table with columns 'name' and 'population' whose rows should only contain data for France, Germany and Italy
SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy')

-- returns a table with column 'name' that contains all country names that include the word 'United'
SELECT name
FROM world
WHERE name LIKE '%united%'

-- returns a table with columns 'name', 'population' and 'area' of countries whose population is greater than 250 million or the size is larger than 3 million square kilometers
SELECT name, population, area
FROM world
WHERE population > 250000000
OR area > 3000000