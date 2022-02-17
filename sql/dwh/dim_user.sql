
INSERT INTO dwh.dim_user (
    user_id,
    name,
    review_count, 
    yelping_since,
    useful,
    funny,
    cool,
    fans
)
SELECT 
    user_id,
    name,
    review_count, 
    yelping_since,
    useful,
    funny,
    cool,
    fans,
    average_stars
FROM ods.user
;
