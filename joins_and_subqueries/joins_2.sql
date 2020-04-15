SELECT 
    bks.starttime AS start, 
    fclt.name AS name
FROM cd.bookings AS bks
INNER JOIN cd.facilities AS fclt ON fclt.facid = bks.facid
WHERE 
    fclt.name LIKE '%Tennis Court%' 
    AND bks.starttime > '2012-09-21'
    AND bks.starttime < '2012-09-22';