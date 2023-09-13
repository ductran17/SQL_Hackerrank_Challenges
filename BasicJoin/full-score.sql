select hacker_id, name
from
(select hackers.hacker_id as hacker_id, hackers.name as name, 
count(hackers.hacker_id) as count_submit
from submissions 
join challenges 
on submissions.challenge_id=challenges.challenge_id
join difficulty
on difficulty.difficulty_level=challenges.difficulty_level
join hackers
on hackers.hacker_id=submissions.hacker_id
where difficulty.score=submissions.score
group by hackers.hacker_id, hackers.name) as sub_query
where count_submit>1
order by count_submit DESC, hacker_id ASC;