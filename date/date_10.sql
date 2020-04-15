SELECT
    cd.facilities.name AS name,
    date_trunc('month', cd.bookings.starttime) AS month,
    round(
        (
            SUM(slots) * 4.0 / extract(
                DAY
                FROM
                    date_trunc('month', cd.bookings.starttime) + '1 mons' :: INTERVAL - '1 day' :: INTERVAL
            )
        ) :: numeric,
        1
    ) AS utilisation
FROM
    cd.bookings
    INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid
GROUP BY
    name,
    month
ORDER BY
    name;