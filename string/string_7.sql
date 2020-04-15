SELECT
    cd.members.memid AS memid,
    TRANSLATE(cd.members.telephone, '-() ', '') AS telephone
FROM
    cd.members
ORDER BY
    memid;