SELECT
    cd.members.surname AS surname,
    cd.members.firstname AS firstname,
    cd.members.memid AS memid,
    MIN(cd.bookings.starttime)
FROM
    cd.members
    INNER JOIN cd.bookings ON cd.bookings.memid = cd.members.memid
WHERE
    cd.bookings.starttime > '2012-09-01'
GROUP BY
    cd.members.surname,
    cd.members.firstname,
    cd.members.memid
ORDER BY
    memid ASC;