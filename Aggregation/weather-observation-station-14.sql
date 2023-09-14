SELECT ROUND(MAX(s.lat_n),4)
FROM (SELECT lat_n FROM station WHERE lat_n<137.2345) AS s;

