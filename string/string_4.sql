SELECT
    cd.members.memid AS memid,
    cd.members.telephone AS telephone
FROM
    cd.members
WHERE
    cd.members.telephone ~ '[()]';