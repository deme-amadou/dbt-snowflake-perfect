with src_hosts as (
    select
        *
    from 
        {{ ref('src_hosts')}}
)
select 
    host_id,
    CASE 
        WHEN host_name is null THEN 'Anonymous'
        ELSE host_name
    END AS host_name,
    is_superhost,
    created_at,
    updated_at
from
    src_hosts