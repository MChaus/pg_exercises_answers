SELECT
    cd.bookings.starttime AS starttime,
    cd.bookings.starttime + cd.bookings.slots * 30 * '1 minute'::interval  AS endtime
FROM
    cd.bookings
ORDER BY
	endtime DESC,
	cd.bookings.starttime DESC
LIMIT
	10;