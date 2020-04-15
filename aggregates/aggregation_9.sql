SELECT
    fclts_bks.name AS name,
    SUM(fclts_bks.revenue) AS revenue
FROM
    (
        SELECT
            cd.facilities.name AS name,
            CASE
                WHEN cd.bookings.memid = 0 THEN cd.facilities.guestcost * cd.bookings.slots
                ELSE cd.facilities.membercost * cd.bookings.slots
            END AS revenue
        FROM
            cd.bookings
            INNER JOIN cd.facilities ON cd.bookings.facid = cd.facilities.facid
    ) AS fclts_bks
GROUP BY
    name
ORDER BY
    revenue ASC;