SELECT
    cd.bookings.facid AS facid,
    cd.facilities.name AS name,
    SUM(cd.bookings.slots) * 0.50 AS "Total Hours"
FROM
    cd.bookings
    INNER JOIN cd.facilities ON cd.bookings.facid = cd.facilities.facid
GROUP BY
	cd.bookings.facid, cd.facilities.name
ORDER BY 
	cd.bookings.facid ASC;