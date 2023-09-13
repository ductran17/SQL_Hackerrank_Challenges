SELECT f1.x, f1.y
FROM functions f1, functions f2 WHERE f1.x=f2.y and f1.y=f2.x and f1.x<=f1.y
GROUP BY f1.x,f1.y
HAVING f1.x!=f1.y OR count(*)>1
ORDER BY f1.x;