SELECT
    cd.bookings.facid AS facid,
    EXTRACT(
        MONTH
        FROM
            cd.bookings.starttime
    ) AS month_of_booking,
    SUM(cd.bookings.slots) AS slots
FROM
    cd.bookings
WHERE
    EXTRACT(
        YEAR
        FROM
            cd.bookings.starttime
    ) = 2012
GROUP BY
    ROLLUP (cd.bookings.facid, month_of_booking)
ORDER BY
    cd.bookings.facid ASC,
    month_of_booking ASC;