SELECT
    cd.bookings.facid AS facid,
    SUM(cd.bookings.slots) AS "Total Slots"
FROM
    cd.bookings
GROUP BY
    cd.bookings.facid
HAVING
    SUM(cd.bookings.slots) > 1000
ORDER BY
    facid ASC;