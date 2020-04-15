SELECT
    facility_revenue.name AS name,
    facility_revenue.initial_outlay / (
        facility_revenue.total_revenue / 3 - facility_revenue.monthly_maintenance
    ) AS MONTH
FROM
    (
        SELECT
            cd.facilities.name AS name,
            cd.facilities.monthlymaintenance AS monthly_maintenance,
            cd.facilities.initialoutlay AS initial_outlay,
            SUM(
                CASE
                    WHEN cd.bookings.memid = 0 THEN cd.facilities.guestcost * cd.bookings.slots
                    ELSE cd.facilities.membercost * cd.bookings.slots
                END
            ) AS total_revenue
        FROM
            cd.bookings
            INNER JOIN cd.facilities ON cd.bookings.facid = cd.facilities.facid
        GROUP BY
            cd.facilities.facid
    ) AS facility_revenue
ORDER BY
    facility_revenue.name ASC;