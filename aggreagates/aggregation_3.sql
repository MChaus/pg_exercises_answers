SELECT
	cd.members.recommendedby AS recommendedby,
	COUNT(cd.members.recommendedby)
FROM
	cd.members
WHERE
	cd.members.recommendedby IS NOT NULL
GROUP BY
	cd.members.recommendedby
ORDER BY
	recommendedby ASC;