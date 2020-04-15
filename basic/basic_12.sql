SELECT
	cd.members.firstname AS firstname,
	cd.members.surname AS surname,
	cd.members.joindate AS joindaate
FROM
	cd.members
WHERE
	cd.members.joindate = (
		SELECT
			MAX(joindate)
		FROM
			cd.members
	);