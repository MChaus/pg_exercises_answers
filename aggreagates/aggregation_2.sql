SELECT
	COUNT(*) AS count
FROM
	cd.facilities
WHERE
	cd.facilities.guestcost >= 10;