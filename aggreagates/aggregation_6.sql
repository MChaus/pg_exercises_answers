SELECT
    cd.bookings.facid AS facid,
    EXTRACT(
        MONTH
        FROM
            cd.bookings.starttime
    ) AS MONTH,
    SUM(cd.bookings.slots) AS "Total Slots"
FROM
    cd.bookings
WHERE
    EXTRACT(
        YEAR
        FROM
            cd.bookings.starttime
    ) = 2012
GROUP BY
    facid,
    MONTH
ORDER BY
    facid,
    MONTH;