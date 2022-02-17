INSERT INTO ods.temperature (
date,
min, 
max, 
normal_min,
normal_max 
)
SELECT 
	cast(date as date),
	cast(case 
			when min = '' then '0'
			else min end as float),
	cast(case 
			when max = '' then '0'
			else max end as float),
	cast(case 
			when normal_min = '' then '0'
			else normal_min end as float),
	cast(case 
			when normal_max = '' then '0'
			else normal_max end as float)
FROM staging.temperature 
;