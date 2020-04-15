UPDATE cd.facilities
	SET
		(membercost, guestcost) = (
		  	SELECT 
		  		cd.facilities.membercost * 1.1,
		  		cd.facilities.guestcost * 1.1
		  	FROM cd.facilities
		  	WHERE 
		  		cd.facilities.facid = 0
		  )
	WHERE
		cd.facilities.facid = 1;