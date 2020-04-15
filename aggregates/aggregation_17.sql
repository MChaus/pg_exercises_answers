SELECT
    ranked.facid AS facid,
    ranked.total AS total,
    ranked.rank 
FROM
    (
        SELECT
            cd.bookings.facid AS facid,
            SUM(cd.bookings.slots) AS total,
            RANK() OVER(
                ORDER BY
                    SUM(cd.bookings.slots) DESC
            ) AS rank
        FROM
            cd.bookings
        GROUP BY
            cd.bookings.facid
    ) AS ranked
WHERE
    ranked.rank = 1;