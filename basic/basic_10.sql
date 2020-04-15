SELECT
    cd.members.surname AS surname
FROM
    cd.members
UNION
SELECT
    cd.facilities.name AS name
FROM
    cd.facilities;