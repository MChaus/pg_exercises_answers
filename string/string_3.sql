SELECT
    *
FROM
    cd.facilities
WHERE
    UPPER(cd.facilities.name) LIKE 'TENNIS%';