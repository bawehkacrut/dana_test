INSERT INTO ods.business (
    business_id,
    name,
    address,
    city,
    state,
    postal_code,
    latitude,
    longitude,
    stars,
    review_count,
    is_open,
    attributes,
    categories,
hours
)
SELECT 
    business_id,
    name,
    address,
    city,
    state,
    postal_code,
    latitude,
    longitude,
    stars,
    cast(review_count as int),
    is_open,
    attributes,
    categories,
    hours
FROM staging.business
;


