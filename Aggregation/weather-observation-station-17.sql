SELECT ROUND(long_w,4)
FROM station
WHERE lat_n>38.778
ORDER BY lat_n
LIMIT 1;