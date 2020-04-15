SELECT 
	cd.members.firstname || ' ' || cd.members.surname AS member, 
	cd.facilities.name AS facility,
	CASE
		WHEN cd.members.memid = 0 THEN cd.bookings.slots * cd.facilities.guestcost
		ELSE cd.bookings.slots * cd.facilities.membercost
	END AS cost
FROM cd.members
INNER JOIN cd.bookings ON cd.members.memid = cd.bookings.memid
INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid
WHERE 
	cd.bookings.starttime > '2012-09-14'
	AND cd.bookings.starttime < '2012-09-15'
	AND 
	(
		(
		 	members.memid = 0 AND cd.bookings.slots * cd.facilities.guestcost > 30
		)
	  	OR
	  	(
		 	members.memid != 0 AND cd.bookings.slots * cd.facilities.membercost > 30
		)
	)
ORDER BY cost DESC;