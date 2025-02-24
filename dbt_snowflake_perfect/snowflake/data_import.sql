use warehouse compute_wh;
use database AIRBNB;
use schema AIRBNB.RAW;

create or replace table raw_listings
    (
        id integer,
        listing_url string,
        name string,
        room_type string,
        minimum_nights integer,
        hist_id integer,
        price string,
        created_at datetime,
        updated_at datetime
    );

