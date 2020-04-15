SELECT
    LPAD(cd.members.zipcode :: text, 5, '0') AS zip
FROM
    cd.members
ORDER BY
    cd.members.zipcode;