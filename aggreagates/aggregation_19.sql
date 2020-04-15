SELECT
    ranked.name AS name,
    ranked.rank AS rank
FROM
(
        SELECT
            facility_revenue.name AS name,
            RANK() OVER(
                ORDER BY
                    facility_revenue.revenue DESC
            ) AS rank
        FROM
            (
                SELECT
                    cd.facilities.name AS name,
                    SUM(
                        CASE
                            WHEN cd.bookings.memid = 0 THEN cd.facilities.guestcost * cd.bookings.slots
                            ELSE cd.facilities.membercost * cd.bookings.slots
                        END
                    ) AS revenue
                FROM
                    cd.bookings
                    INNER JOIN cd.facilities ON cd.bookings.facid = cd.facilities.facid
                GROUP BY
                    cd.facilities.facid
            ) AS facility_revenue
    ) AS ranked
WHERE
    ranked.rank <= 3
ORDER BY
    ranked.rank ASC