select city, char_length(city)
from station
where char_length(city)=(select min(char_length(city)) from station)
order by city limit 1;
select city, char_length(city)
from station
where char_length(city)=(select max(char_length(city)) from station)
order by city limit 1;