SELECT
    ranked.firstname AS firstname,
    ranked.surname AS surname,
    ranked.rounded_hours AS hours,
    ranked.rank AS rank
FROM
    (
        SELECT
            cd.members.firstname AS firstname,
            cd.members.surname AS surname,
            ROUND(SUM(cd.bookings.slots) / 2, -1) AS rounded_hours,
            RANK() OVER (
                ORDER BY
                    ROUND(SUM(cd.bookings.slots) / 2, -1) DESC
            )
        FROM
            cd.members
            INNER JOIN cd.bookings ON cd.bookings.memid = cd.members.memid
        GROUP BY
            cd.members.memid
    ) AS ranked
ORDER BY
    ranked.rank ASC,
    ranked.surname ASC,
    ranked.firstname ASC;