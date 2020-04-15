SELECT
	cd.members.memid AS memid,
	cd.members.surname AS surname,
	cd.members.firstname AS firstname,
	cd.members.joindate AS joindate
FROM
	cd.members
WHERE
	joindate >= '2012-09-01';