SELECT mem.firstname AS memfname, mem.surname AS memsname, rec.firstname AS rcfname, rec.surname AS rcsname
	FROM 
		cd.members AS mem
		LEFT OUTER JOIN cd.members AS rec
			ON mem.recommendedby = rec.memid
ORDER BY mem.surname, mem.firstname;