WITH revenue_by_date AS (
    SELECT
        date(cd.bookings.starttime) AS date,
        SUM(
            CASE
                WHEN cd.bookings.memid = 0 THEN cd.facilities.guestcost * cd.bookings.slots
                ELSE cd.facilities.membercost * cd.bookings.slots
            END
        ) AS revenue
    FROM
        cd.bookings
        INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid
    GROUP BY
        date(cd.bookings.starttime)
)
SELECT
    revenue_by_date_1.date AS curr_date,
    SUM(revenue_by_date_2.revenue) / 15 AS revenue
FROM
    revenue_by_date AS revenue_by_date_1
    INNER JOIN revenue_by_date AS revenue_by_date_2 ON (
        revenue_by_date_2.date >= revenue_by_date_1.date - 14
    )
    AND (revenue_by_date_2.date <= revenue_by_date_1.date)
WHERE
    (
        revenue_by_date_1.date >= '2012-08-01'
    )
    AND (
        revenue_by_date_1.date < '2012-09-01'
    )
GROUP BY
    revenue_by_date_1.date
ORDER BY
    revenue_by_date_1.date ASC;