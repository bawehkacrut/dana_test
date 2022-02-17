INSERT INTO data_warehouse.dim_weather (
    date,
    is_bad_weather
)
with temperature as (
select
	date,
	min as t_min,
	max as t_max,
	normal_min ,
	normal_max ,
	case 
		when min < normal_min and max < normal_max then false 
		else true 
	end as is_bad_weather_t
from ods.temperature t 
where (min > 0 or max > 0)
), precipitation as (
select 
	date,
	precipitation,
	precipitation_normal,
	case 
		when precipitation < precipitation_normal then false
		else true
	end as is_bad_weather_p
from ods.precipitation p 
)
select
	t.date,
	case 
		when (t.is_bad_weather_t or p.is_bad_weather_p) is true then true 
		else false
	end as is_bad_weather
from temperature as t
left join precipitation as p on p.date = t.date
;
