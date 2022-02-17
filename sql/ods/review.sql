-- inserting into ods.review
INSERT INTO ods.review (
    review_id,
    user_id, 
    business_id,
    stars,
    useful,
    funny,
    cool,
    text,
    date
)
SELECT 
	review_id,
	user_id,
	business_id,
	cast(stars as int),
	cast(useful as int),
	cast(funny as int),
	cast(cool as int),
	text,
	cast(date as timestamp)
FROM staging.review
;