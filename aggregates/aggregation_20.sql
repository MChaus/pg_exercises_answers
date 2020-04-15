SELECT
    ranked.name AS name,
    CASE WHEN ranked.revenue_level = 1 THEN 'high'
         WHEN ranked.revenue_level = 2 THEN 'average'
         ELSE 'low'
    END AS revenue
FROM
(
        SELECT
            facility_revenue.name AS name,
            NTILE(3) OVER(
                ORDER BY
                    facility_revenue.revenue DESC
            ) AS revenue_level
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
ORDER BY
    ranked.revenue_level ASC,
    ranked.name;