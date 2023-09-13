select concat(name,'(',substr(occupation,1,1),')') as name_full
from occupations
order by name_full;

select concat('There are a total of ', count(occupation),' ', lower(occupation),'s.')
from occupations
group by occupation
order by count(occupation) ASC, lower(occupation) ASC;