SELECT
    (
        SELECT
            COUNT(*) AS count
        FROM
            cd.members
    ) AS count,
    cd.members.firstname AS firstname,
    cd.members.surname AS surname
FROM
    cd.members