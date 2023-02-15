/*
Basics
*/

SELECT facid, name, membercost, monthlymaintenance
	FROM cd.facilities
	WHERE membercost > 0
	AND membercost < monthlymaintenance/50;

SELECT *
	FROM cd.facilities
	WHERE name LIKE '%Tennis%';

SELECT *
	FROM cd.facilities
	WHERE facid IN (1,5);

SELECT name,
	CASE
		WHEN monthlymaintenance > 100 THEN 'expensive'
		WHEN monthlymaintenance <= 100 THEN 'cheap'
	END AS cost
FROM cd.facilities;

SELECT memid, surname, firstname, joindate
	FROM cd.members
	WHERE joindate >= CAST('2012-09-01' AS DATE);

SELECT DISTINCT surname
	FROM cd.members
	ORDER BY surname
	limit 10;

SELECT name AS surname
	FROM cd.facilities
UNION
SELECT surname AS surname
	FROM cd.members;

SELECT MAX(joindate) AS latest
	FROM cd.members;

SELECT firstname, surname, joindate
	FROM cd.members
	WHERE joindate = ( SELECT MAX(joindate) from cd.members );
