select w.id, wp.age, w.coins_needed, w.power
from wands w
join wands_property wp
on w.code=wp.code
where wp.is_evil=0 and w.coins_needed =
(select min(coins_needed)
from wands w2
join wands_property wp2
on w2.code=wp2.code
where w.power=w2.power and wp.age=wp2.age)
order by w.power desc, wp.age desc;