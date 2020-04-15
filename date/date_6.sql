SELECT
    months.month AS MONTH,
    EXTRACT(
        DAYS
        FROM
            '2012-01-01' :: timestamp + months.delta :: INTERVAL - (
                '2012-01-01' :: timestamp + months.prev_delta :: INTERVAL
            )
    ) :: text || ' days' AS length
FROM
    (
        SELECT
            numbers.number AS MONTH,
            cast(numbers.number AS text) || ' mons' :: text AS delta,
            cast(numbers.number - 1 AS text) || ' mons' :: text AS prev_delta
        FROM
            (
                SELECT
                    generate_series(1, 12) AS number
            ) AS numbers
    ) AS months