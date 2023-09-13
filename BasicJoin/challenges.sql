WITH temp AS 
(SELECT h.hacker_id, COUNT(challenge_id) AS challenge_count
FROM hackers h JOIN challenges c
 ON h.hacker_id=c.hacker_id
GROUP BY h.hacker_id)

SELECT t.hacker_id, h1.name, t.challenge_count
FROM temp t
JOIN hackers h1
ON t.hacker_id=h1.hacker_id
WHERE t.challenge_count IN (
SELECT challenge_count 
FROM temp
GROUP BY challenge_count
HAVING COUNT(challenge_count)=1
UNION
SELECT MAX(challenge_count) FROM temp)
ORDER BY t.challenge_count DESC, t.hacker_id;