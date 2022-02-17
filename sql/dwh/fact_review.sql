INSERT INTO dwh.review (
    review_id,
    user_id, 
    business_id,
    stars,
    date,
    text,
    useful,
    funny,
    cool
)
SELECT 
	review_id,
	user_id,
	business_id,
	stars,
    date,
    text,
	useful,
	funny,
	cool
FROM ods.review
;