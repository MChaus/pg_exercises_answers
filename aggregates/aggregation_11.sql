WITH slot_sum AS (
    SELECT
        cd.bookings.facid,
        SUM(cd.bookings.slots) AS totalslots
    FROM
        cd.bookings
    GROUP BY
        cd.bookings.facid
)
SELECT
    slot_sum.facid,
    slot_sum.totalslots
FROM
    slot_sum
WHERE
    slot_sum.totalslots = (
        SELECT
            MAX(slot_sum.totalslots)
        FROM
            slot_sum
    );