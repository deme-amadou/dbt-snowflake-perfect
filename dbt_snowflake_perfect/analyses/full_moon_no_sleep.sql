WITH mart_fullmoon_reviews AS (
    select 
        * 
    from 
        {{ ref('mart_fullmoon_reviews')}}
)
select 
    is_full_moon,
    review_sentiment,
    count(*) as review_count
from 
    mart_fullmoon_reviews
group by
    1,2
order by
    1,2