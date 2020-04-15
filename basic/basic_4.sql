SELECT
	cd.facilities.facid AS facid,
	cd.facilities.name AS name,
	cd.facilities.membercost AS membercost,
	cd.facilities.monthlymaintenance AS monthlymaintenance
FROM
	cd.facilities
WHERE
	cd.facilities.membercost > 0
	AND cd.facilities.membercost < cd.facilities.monthlymaintenance / 50;