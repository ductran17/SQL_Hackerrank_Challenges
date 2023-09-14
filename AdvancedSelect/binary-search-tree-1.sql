SELECT n,
    CASE
        WHEN n NOT IN (SELECT DISTINCT p FROM bst WHERE p IS NOT NULL) THEN 'Leaf'
        WHEN p IS NULL THEN 'Root'
        ELSE 'Inner'
    END AS role
FROM bst
ORDER BY n ASC;
