SELECT ct.contest_id, ct.hacker_id, ct.name, 
       SUM(s.ts), SUM(s.tas),SUM(v.tv),SUM(v.tuv)
FROM contests ct
JOIN colleges cl
ON ct.contest_id = cl.contest_id
JOIN challenges chl
ON cl.college_id = chl.college_id
LEFT JOIN ( SELECT challenge_id, SUM(total_views) as tv, SUM(total_unique_views) as tuv 
            FROM view_stats
            GROUP BY challenge_id) AS v 
ON chl.challenge_id = v.challenge_id
LEFT JOIN ( SELECT challenge_id, SUM(total_submissions) as ts, 
                   SUM(total_accepted_submissions) as tas 
            FROM submission_stats
            GROUP BY challenge_id ) AS s 
ON chl.challenge_id = s.challenge_id 
GROUP BY ct.contest_id, ct.hacker_id, ct.name
ORDER BY ct.contest_id ASC;