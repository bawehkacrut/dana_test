with review as (
select
	business_id,
	date(date) as review_date,
	stars
from ods.review r 
), weather as (
select 
	date,
	is_bad_weather
from data_warehouse.dim_weather
), base as (
select r.*
	 , w.is_bad_weather
from review r
left join weather as w on w.date = r.review_date
)
select
	is_bad_weather
	, avg(stars) 
from base
group by is_bad_wather