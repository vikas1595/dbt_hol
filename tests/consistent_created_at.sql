SELECT f.listing_id
FROM {{ ref('fact_reviews')}} as f
JOIN {{ ref('dim_listings_cleansed')}} as d
on f.listing_id = d.listing_id
WHERE f.review_date < d.created_at