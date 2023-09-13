SELECT DISTINCT MIN(start_date) OVER (PARTITION BY date_group) AS start_project, MAX(end_date) OVER (PARTITION BY date_group) AS end_project
FROM
    (SELECT task_id, start_date, end_date, DATE_SUB(end_date, INTERVAL number DAY) AS date_group
    FROM
        (SELECT *, row_number() OVER (order by end_date) AS number 
         FROM projects
        )AS sub_query1
     )AS sub_query2
     ORDER BY DATEDIFF(end_project,start_project);