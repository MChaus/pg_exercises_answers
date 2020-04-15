WITH RECURSIVE get_recommended(memid, firstname, surname) AS (
    SELECT
        cd.members.memid AS memid,
        cd.members.firstname AS firstname,
        cd.members.surname AS surname
    FROM
        cd.members
    WHERE
        cd.members.recommendedby = 1
    UNION
    SELECT
        cd.members.memid AS memid,
        cd.members.firstname AS firstname,
        cd.members.surname AS surname
    FROM
        cd.members,
        get_recommended
    WHERE
        cd.members.recommendedby = get_recommended.memid
)
SELECT
    *
FROM
    get_recommended
ORDER BY
    memid ASC;