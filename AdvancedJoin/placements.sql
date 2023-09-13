SELECT name
FROM
    (SELECT s.id, s.name, p1.salary AS self_salary, f.friend_id, p2.salary AS friend_salary
    FROM students s
    JOIN packages p1 ON s.id=p1.id
    JOIN friends f ON s.id=f.id
    JOIN packages p2 ON f.friend_id=p2.id)
    AS sub_query1
WHERE self_salary<friend_salary
ORDER BY friend_salary;