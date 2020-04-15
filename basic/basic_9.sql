SELECT
	DISTINCT cd.members.surname AS surname
FROM
	cd.members
ORDER BY
	surname ASC
LIMIT
	10;