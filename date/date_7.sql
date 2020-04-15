SELECT
    date_trunc('month', test.tests) + '1 mons' :: INTERVAL - date_trunc('day', test.tests) AS remaining
FROM
    (
        SELECT
            '2012-02-11 01:00:00' :: TIMESTAMP AS tests
    ) AS test;