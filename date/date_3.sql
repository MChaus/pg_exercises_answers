SELECT
    generate_series(
        '2012-10-01' :: TIMESTAMP,
        '2012-10-31' :: TIMESTAMP,
        INTERVAL '1 day'
    ) AS ts;