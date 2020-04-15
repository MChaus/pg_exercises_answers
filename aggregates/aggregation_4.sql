SELECT
	cd.bookings.facid AS facid,
	SUM(cd.bookings.slots) AS "Total Slots"
FROM
	cd.bookings
GROUP BY
	facid
ORDER BY
	facid ASC;