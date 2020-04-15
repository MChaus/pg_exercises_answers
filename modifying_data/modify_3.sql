INSERT INTO cd.facilities VALUES
	(
	  	(
		  	SELECT DISTINCT 
		  		max(facid) + 1
	  		FROM cd.facilities
		 ),
	  	'Spa',
	  	20,
	  	30,
	  	100000,
	  	800
	)