use role accountadmin;

create role if not exists transform;
grant role transform to role accountadmin;

---create warehouse
grant operate on warehouse compute_wh to role transform;

--create the 'dbt' user and assign to role
grant role transform to user dbt_user;
create database if not exists AIRBNB;
create schema if not exists AIRBNB.RAW;


--set up permissions to role 'transform'
grant all on warehouse compute_wh to role transform;
grant all on database AIRBNB to role transform;
grant all on all schemas in database AIRBNB to role transform;
grant all on future schemas in database AIRBNB to role transform;
grant all on all tables in schema AIRBNB.RAW to role transform;
grant all on future tables in schema AIRBNB.RAW to role transform;

show roles;

select *  from raw.src_hosts where host_name is null;


update airbnb.raw.raw_listings
set minimum_nights = 30, updated_at = current_timestamp()
where id=3176;

select * from airbnb.raw.scd_raw_listings where id=3176;