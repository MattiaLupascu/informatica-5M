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
