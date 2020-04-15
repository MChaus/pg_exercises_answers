SELECT 
    ROW_NUMBER() OVER() AS row_number,
    cd.members.firstname AS firstname,
    cd.members.surname AS surname
FROM
    cd.members
ORDER BY cd.members.joindate;