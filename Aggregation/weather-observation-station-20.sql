SELECT ROUND(lat_n,4)
FROM
(
SELECT ROW_NUMBER() OVER(ORDER BY lat_n asc) AS num,lat_n
FROM station
) AS s
WHERE num=(SELECT ROUND(COUNT(*) / 2)
           FROM station
          );