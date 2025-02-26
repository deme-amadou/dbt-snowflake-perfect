select
    *
from
    {{ ref('fct_reviews')}} r
left join 
    {{ ref('dim_listings_cleansed') }} d
on
    r.listing_id = d.listing_id
where r.review_date < d.created_at