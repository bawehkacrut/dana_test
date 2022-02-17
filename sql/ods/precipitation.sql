-- inserting into ods.precipitation
INSERT INTO ods.precipitation (
date,
precipitation, 
precipitation_normal
)
SELECT 
	cast(date as date),
	cast(case 
			when precipitation in ('', 'T') then '0'
			else precipitation end as float),
	cast(case 
			when precipitation_normal in ('', 'T') then '0'
			else precipitation_normal end as float)
FROM staging.precipitation 
;