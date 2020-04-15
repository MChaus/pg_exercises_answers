SELECT 
	mems.firstname || ' ' || mems.surname AS member,
	bks_fcls.name AS facility,
    bks_fcls.cost AS cost
FROM cd.members AS mems
INNER JOIN 
	(
	  	SELECT 
	  		bks.memid,
            fcls.name,
	  		CASE WHEN bks.memid = 0 THEN bks.slots * fcls.guestcost
	  			 ELSE bks.slots * fcls.membercost
	  		END AS cost
	  	FROM cd.bookings AS bks
	  	INNER JOIN cd.facilities AS fcls ON bks.facid = fcls.facid
	  	WHERE 
	  		bks.starttime > '2012-09-14'
			AND bks.starttime < '2012-09-15'
	) AS bks_fcls
ON mems.memid = bks_fcls.memid
WHERE cost > 30
ORDER BY cost DESC;