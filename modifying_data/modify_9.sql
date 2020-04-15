DELETE FROM cd.members
WHERE 
	cd.members.memid NOT IN (
	  	SELECT 
	  		cd.members.memid
	  	FROM cd.members
	  	INNER JOIN cd.bookings ON cd.members.memid = cd.bookings.memid
	  );
	  