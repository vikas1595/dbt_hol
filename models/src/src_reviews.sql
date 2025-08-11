with src as (
        SELECT
            DISTINCT
            LISTING_ID
            , nvl(DATE,current_date()) as review_date
            , REVIEWER_NAME
            , COMMENTS as review_text
            , SENTIMENT as review_sentiment
        FROM
            {{source('AIRBNB', 'RAW_REVIEWS')}} src
    )

select *,
    MD5(
        CONCAT(NVL(LISTING_ID, '') ::VARCHAR(50),
            NVL(review_date, '') :: VARCHAR(50),
            NVL(REVIEWER_NAME, '') ::VARCHAR(50),
            NVL(review_text, '') ::STRING,
            NVL(review_sentiment, '') ::VARCHAR(50))) as listing_review_id,
    -- {{ dbt_utils.generate_surrogate_key(['LISTING_ID', 'review_date', 'REVIEWER_NAME', 'review_text', 'review_sentiment']) }} as listing_review_sk
from src