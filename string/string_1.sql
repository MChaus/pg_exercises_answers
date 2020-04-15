SELECT
    cd.members.surname || ', ' || cd.members.firstname AS name
FROM
    cd.members;