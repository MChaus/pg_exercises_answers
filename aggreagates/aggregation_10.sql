SELECT
    cost_per_booking.name AS name,
    SUM(cost_per_booking.revenue) AS revenue
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
    ) AS cost_per_booking
GROUP BY
    cost_per_booking.name
HAVING
    SUM(cost_per_booking.revenue) < 1000
ORDER BY
    revenue ASC;