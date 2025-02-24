WITH raw_rewiews AS (
    select 
        * 
    from 
        airbnb.raw.raw_reviews
)
select 
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
from 
    raw_rewiews