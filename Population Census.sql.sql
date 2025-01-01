-- 1) Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;

--2) Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';

--3) Query all columns (attributes) for every row in the CITY table.
SELECT *
FROM CITY;

-- 4) Query all columns for a city in CITY with the ID 1661.
SELECT *
FROM CITY
WHERE ID = 1661;

-- 5) Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

--6) Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
FROM STATION;

--7) Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID,2)=0;

--8) Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY))
FROM STATION;

--9) Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH (CITY) DESC, CITY DESC LIMIT 1;
SELECT CITY, LENGTH (CITY)
FROM STATION
ORDER BY LENGTH (CITY) ASC, CITY ASC LIMIT 1;

--10) Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%';

--11) Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY,1) IN ('a','e','i','o','u');

--12) Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) IN ('A','E','I','O','U') AND RIGHT(CITY,1) IN ('a','e','i','o','u');

--13) Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U');

--14) Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY,1) NOT IN ('a','e','i','o','u');

--15) Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') OR RIGHT(CITY,1) NOT IN ('a','e','i','o','u');

--16) Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') AND RIGHT(CITY,1) NOT IN ('a','e','i','o','u');

--17) Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3), ID ASC;

--18) Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name
FROM Employee
ORDER BY name ASC;

--19) Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than  months. Sort your result by ascending employee_id.
SELECT name
FROM Employee
WHERE salary > 2000 and months <10
ORDER BY employee_id ASC;

/*20) Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.*/
SELECT
CASE
WHEN A + B > C AND A + C > B AND B + C > A THEN
CASE
WHEN A = B AND B = C THEN 'Equilateral'
WHEN A != B AND B != C AND A != C THEN 'Scalene'
ELSE 'Isosceles'
END
ELSE 'Not A Triangle'
END AS TYPE
FROM triangles;