WITH RECURSIVE recommenders(memid, firstname, surname, recommendedby) AS (
    SELECT
        cd.members.memid AS memid,
        cd.members.firstname AS firstname,
        cd.members.surname AS surname,
        cd.members.recommendedby AS recommendedby
    FROM
        cd.members
    WHERE
        cd.members.memid = 27
    UNION
    SELECT
        cd.members.memid AS memid,
        cd.members.firstname AS firstname,
        cd.members.surname AS surname,
        cd.members.recommendedby AS recommendedby
    FROM
        recommenders,
        cd.members
    WHERE
        cd.members.memid = recommenders.recommendedby
)
SELECT
    recommenders.memid AS recommender,
    recommenders.firstname AS firstname,
    recommenders.surname AS surname
FROM
    recommenders OFFSET 1;