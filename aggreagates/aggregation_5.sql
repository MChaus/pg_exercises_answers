SELECT
	cd.bookings.facid AS facid,
	SUM(cd.bookings.slots) AS "Total Slots"
FROM
	cd.bookings
WHERE
	cd.bookings.starttime > '2012-09-01'
	AND cd.bookings.starttime < '2012-10-01'
GROUP BY
	facid
ORDER BY
	"Total Slots" ASC;