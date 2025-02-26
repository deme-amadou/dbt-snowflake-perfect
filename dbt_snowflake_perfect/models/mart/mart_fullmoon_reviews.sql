{{
  config(
    materialized = 'table',
    )
}}

WITH fct_reviews AS (
    select 
        * 
    from 
        {{ ref('src_reviews')}}
),
full_moon_dates AS(
    select
        *
    from 
        {{ ref('seed_full_moon_dates')}}
)

select
    r.*,
    CASE
        WHEN fmd.full_moon_date is null THEN 'Not Full Moon'
        ELSE 'Full Moon'
    END AS is_full_moon
from
    fct_reviews r
    left join
    full_moon_dates fmd
    on (TO_DATE(r.review_date) = DATEADD(DAY,1,fmd.full_moon_date))