-- #1 Show the population of Germany
SELECT name,population FROM world.world WHERE name='Germany';
-- #2. Show the per capita gdp: gdp/population for each country where the
-- # area is over 5,000,000 km2
SELECT name,gdp/population FROM world.world WHERE area>5000000;
-- #3. Show the name and continent where the area is less then 2000 and the 
-- # gdp is more than 5000000000
SELECT name,continent FROM world.world WHERE area<2000 AND gdp>5000000000;
-- #4. Show the name and the population for 'Denmark', 'Finland', 'Norway', 
-- # 'Sweden'
SELECT name,population FROM world.world WHERE name='Denmark' OR name='Finland' OR name='Norway' OR name='Sweden';
-- #5. Show each country that begins with G.
SELECT name FROM world.world WHERE name LIKE 'G%';
-- #6. Show the area in 1000 square km. Show area/1000 instead of area
SELECT name,area/1000 FROM world.world;
-- # 7. Read the notes about this table. Observe the result of running
-- # a simple SQL command.
SELECT name, continent, population FROM world.world;
-- # 8. Show the name for the countries that have a population of at
-- # least 200 million. (200 million is 200000000, there are eight
-- # zeros)
SELECT name FROM world.world WHERE population > 200000000;
-- # 9. Give the name and the per capita GDP for those countries with a
-- # population of at least 200 million.
SELECT name, gdp/population FROM world.world WHERE population > 200000000;
-- # 10. Show the name and population in millions for the countries of
-- # 'South America' Divide the population by 1000000 to get population
-- # in millions.
SELECT name, population/1000000 FROM world.world WHERE continent = 'South America';
-- # 11. Show the name and population for 'France', 'Germany', 'Italy'
SELECT name, population FROM world.world WHERE name='France' OR name='Germany' OR name='Italy';
-- # 12. Identify the countries which have names including the word
-- # 'United'
SELECT name FROM world.world WHERE name LIKE 'United%';
-- # 13. Change the query shown so that it displays Nobel prizes for
-- # 1950.
SELECT yr, subject, winner FROM nobel.nobel WHERE yr = 1950;
-- # 14. Show who won the 1962 prize for Literature.
SELECT winner FROM nobel.nobel WHERE yr = 1962 AND subject = 'Literature';
-- # 15. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject FROM nobel.nobel WHERE winner = 'Albert Einstein';
-- # 16. Give the name of the 'Peace' winners since the year 2000,
-- # including 2000.
SELECT winner FROM nobel.nobel WHERE subject = 'Peace'  AND yr >= 2000;
-- # 17. Show all details (yr, subject, winner) of the Literature prize
-- # winners for 1980 to 1989 inclusive.
SELECT * FROM nobel.nobel WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;
-- # 18. Show all details of the presidential winners: ('Theodore
-- # Roosevelt', 'Woodrow Wilson', 'Jed Bartlet', 'Jimmy Carter')
SELECT yr, subject, winner FROM nobel.nobel WHERE winner='Theodore Roosevelt' OR winner='Woodrow Wilson' OR winner='Jed Bartlet' OR winner='Jimmy Carter';
-- # 19. Show the winners with first name John
SELECT winner FROM nobel.nobel WHERE winner LIKE 'h%';
-- # 20. In which years was the Physics prize awarded but no Chemistry prize.
SELECT subject,yr FROM nobel.nobel WHERE subject = 'Physics';
-- # 21. List each country name where the population is larger than
-- # 'Russia'.
SELECT name,population
FROM world.world
WHERE population> (SELECT population FROM world.world WHERE name="Russia")
-- # 22. List the name and continent of countries in the continents
-- # containing 'Belize', 'Belgium'.
SELECT name,continent
FROM world.world
WHERE continent IN (SELECT continent FROM world.world WHERE name='Belize' or name="Belgium")
-- # 23. Show the countries in Europe with a per capita GDP(gdp/population) greater than
-- # 'United Kingdom'.
SELECT name
FROM world.world
WHERE continent="Europe" AND gdp/population> (SELECT gdp/population FROM world.world WHERE name="United Kingdom")
-- # 24. Which country has a population that is more than Canada but
-- # less than Poland? Show the name and the population.
SELECT name,population
FROM world.world
WHERE population> (SELECT population FROM world.world WHERE name="Canada") AND population<(SELECT population FROM world.world WHERE name="Poland")
-- # 25. Which countries have a GDP greater than any country in Europe?
-- # [Give the name only.]
SELECT name
FROM world.world
WHERE gdp>(SELECT MAX(gdp) FROM world.world WHERE continent="Europe" )
-- # 26. Find the largest country (by area) in each continent, show the 
-- # continent, the name and the area.
SELECT x.continent, x.name, x.area
FROM world.world AS x
WHERE x.area = (SELECT MAX(y.area) FROM world.world AS y WHERE x.continent = y.continent)
-- # 27. Find each country that belongs to a continent where all
-- # populations are less than 25000000. Show name, continent and
-- # population.
SELECT x.continent, x.name, x.population
FROM world.world AS x
WHERE 25000000 > ALL (SELECT MAX(y.population) FROM world.world AS y WHERE x.continent = y.continent)

-- # 28. Some countries have populations more than three times that of
-- # any of their neighbours (in the same continent). Give the
-- # countries and continents.
SELECT x.continent, x.name
FROM world.world AS x
WHERE x.population/3 > ALL (SELECT y.population FROM world.world AS y WHERE x.continent = y.continent AND x.name!= y.name);
-- # 29. Show the total population of the world.
SELECT SUM(population)
FROM world.world
-- # 30. List all the continents - just once each.
SELECT DISTINCT continent
FROM world.world
-- # 31. Give the total GDP of Africa
SELECT SUM(gdp)
FROM world.world
WHERE continent="Africa"
-- # 32. How many countries have an area of at least 1000000
SELECT COUNT(name)
FROM world.world
WHERE area>1000000
-- # 33. What is the total population of ('France','Germany','Spain')
SELECT SUM(population)
FROM world.world
WHERE name IN ('France','Germany','Spain');
-- # 34. For each continent show the continent and number of countries.
SELECT continent,COUNT(name)
FROM world.world
GROUP BY continent;
-- # 35. For each continent show the continent and number of countries
-- # with populations of at least 10 million.
SELECT continent,COUNT(name)
FROM world.world
WHERE population>=10000000
GROUP BY continent;
-- # 36. List the continents with total populations of at least 100
-- # million.
SELECT continent
FROM world.world
GROUP BY continent
HAVING SUM(population)> 100000000;
-- # 1. Show matchid and player name for all goals scored by
-- # Germany. teamid = 'GER'.
SELECT matchid, player
FROM euro2012.goal
WHERE teamid="GER";
-- # 2. Show id, stadium, team1, team2 for game 1012.
SELECT id, stadium, team1, team2
FROM euro2012.game
WHERE id = 1012;
-- # 3. Show the player, teamid and mdate and for every German
-- # goal. teamid='GER'.
SELECT player, teamid, mdate
FROM euro2012.goal JOIN euro2012.game
ON goal.matchid = game.id
WHERE teamid='GER';
-- # 4. Show the team1, team2 and player for every goal scored by a
-- # player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM euro2012.goal JOIN euro2012.game
ON goal.matchid = game.id
WHERE player LIKE 'Mario%';
-- # 5. Show player, teamid, coach, gtime for all goals scored in the
-- # first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
FROM euro2012.goal JOIN euro2012.eteam
WHERE gtime<=10;
-- # 6. List the the dates of the matches and the name of the team in
-- # which 'Fernando Santos' was the team1 coach.
SELECT mdate,teamname
FROM euro2012.game JOIN euro2012.eteam
WHERE team1=eteam.id AND coach='Fernando Santos';
-- # 7. List the player for every goal scored in a game where the
-- # staium was 'National Stadium, Warsaw'
SELECT player
FROM euro2012.goal JOIN euro2012.game
WHERE matchid=game.id AND stadium='National Stadium, Warsaw';
-- # 8. Show names of all players who scored a goal against Germany.
SELECT DISTINCT player
FROM euro2012.goal JOIN euro2012.game
WHERE matchid=game.id AND goal.teamid != 'GER' AND (game.team1 = 'GER' OR game.team2 = 'GER');
-- # 9. Show teamname and the total number of goals scored.
SELECT teamname,COUNT(*) AS total_goals
FROM euro2012.eteam JOIN euro2012.goal
WHERE teamid=eteam.id 
GROUP BY teamname;
-- # 10. Show the stadium and the number of goals scored in each
-- # stadium.
SELECT stadium,COUNT(*) AS total_goals
FROM euro2012.game JOIN euro2012.goal
WHERE game.id=matchid 
GROUP BY stadium;
-- # 11. For every match involving 'POL', show the matchid, date and
-- # the number of goals scored.
SELECT matchid,mdate,COUNT(*) AS total_goals
FROM euro2012.game JOIN euro2012.goal
WHERE game.id=matchid AND (team1='POL' OR team2='POL')
GROUP BY matchid;
-- # 12. For every match where 'GER' scored, show matchid, match date
-- # and the number of goals scored by 'GER'
SELECT matchid,mdate,COUNT(*) AS total_goals
FROM euro2012.game JOIN euro2012.goal
WHERE game.id=matchid AND teamid='GER'
GROUP BY matchid;
-- # 13. List every match with the goals scored by each team as shown.
SELECT game.mdate, 
       game.team1, 
       SUM(CASE WHEN goal.teamid = game.team1
           THEN 1
           ELSE 0
           END) AS score1,
       game.team2,
       SUM(CASE WHEN goal.teamid = game.team2
           THEN 1
           ELSE 0
           END) AS score2
FROM euro2012.game
JOIN euro2012.goal
ON (game.id = goal.matchid)
GROUP BY game.id
ORDER BY game.mdate, goal.matchid