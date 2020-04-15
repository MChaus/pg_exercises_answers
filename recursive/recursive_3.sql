WITH RECURSIVE recommenders(member, recommender) AS (
    SELECT
        cd.members.memid AS member,
        cd.members.recommendedby AS recommender
    FROM
        cd.members
    WHERE
        cd.members.recommendedby IS NOT NULL
    UNION
    SELECT
        recommenders.member AS member,
        cd.members.recommendedby AS recommender
    FROM
        cd.members,
        recommenders
    WHERE
        cd.members.memid = recommenders.recommender
        AND cd.members.recommendedby IS NOT NULL
)
SELECT
    recommenders.member AS member,
    recommenders.recommender AS recommender,
    cd.members.firstname AS firstname,
    cd.members.surname AS surname
FROM
    recommenders
    INNER JOIN cd.members ON cd.members.memid = recommenders.recommender
WHERE
    recommenders.member = 12
    OR recommenders.member = 22
ORDER BY
    member ASC,
    recommender DESC;