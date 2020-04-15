SELECT DISTINCT 
    mem_recomends.firstname as firstname, 
    mem_recomends.surname as surname
FROM cd.members as mem_recomends
INNER JOIN cd.members as mem_recomended ON mem_recomended.recommendedby = mem_recomends.memid
ORDER BY mem_recomends.surname, mem_recomends.firstname;