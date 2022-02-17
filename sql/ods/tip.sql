INSERT INTO ods.tip (
user_id,
business_id, 
text, 
date,
compliment_count 
)
SELECT 
	user_id,
	business_id,
	cast(date as timestamp),
	cast(compliment_count as int)
FROM staging.tip 
;
