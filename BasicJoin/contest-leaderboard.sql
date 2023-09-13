SELECT hacker_id, name, SUM(score_max) as score_sum
FROM 
(SELECT hacker_id, name, MAX(score) AS score_max
FROM 
(SELECT h.name, s.challenge_id, s.score, s.hacker_id, s.submission_id
FROM hackers h JOIN submissions s
ON h.hacker_id=s.hacker_id) AS full_table
GROUP BY hacker_id, name, challenge_id) AS sub_query
GROUP BY hacker_id, name
HAVING SUM(score_max)>0
ORDER BY SUM(score_max) DESC, hacker_id ASC;