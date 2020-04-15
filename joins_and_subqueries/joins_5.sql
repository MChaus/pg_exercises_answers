SELECT DISTINCT 
	cd.members.firstname || ' ' || cd.members.surname AS member,
	cd.facilities.name AS facility
FROM
	cd.facilities
INNER JOIN cd.bookings ON cd.bookings.facid = cd.facilities.facid
INNER JOIN cd.members ON cd.members.memid = cd.bookings.memid
WHERE cd.facilities.name LIKE 'Tennis Court%'
ORDER BY member;