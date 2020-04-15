SELECT 
    bks.starttime AS starttime
FROM 
    cd.bookings bks
INNER JOIN cd.members mems ON bks.memid = mems.memid
WHERE 
    mems.firstname LIKE 'David'
	AND mems.surname LIKE 'Farrell'