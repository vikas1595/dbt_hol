{{

config(
    materialized='table',
    schema='MART'
) 

}}

with fact_revews as (
        select * from {{ ref('fact_reviews') }}
    ),
    full_moon_dates as (
        select * from {{ ref('seed_full_moon_dates') }}
    )
SELECT
    *, CASE WHEN fmd.FULL_MOON_DATE is not null THEN 'full moon' ELSE 'not full moon' END as is_full_moon
FROM fact_revews fr
    LEFT JOIN full_moon_dates fmd
    ON to_date(DATEADD('day', -1, fr.REVIEW_DATE)) = fmd.FULL_MOON_DATE
