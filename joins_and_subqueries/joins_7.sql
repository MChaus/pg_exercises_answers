SELECT DISTINCT 
	mems.firstname || ' ' || mems.surname AS member,
	(
		SELECT 
			recs.firstname || ' ' || mems.surname AS member,
		FROM cd.member recs
		WHERE recs.memid = mems.recommendedby
	)
FROM cd.members mems
ORDER BY member;