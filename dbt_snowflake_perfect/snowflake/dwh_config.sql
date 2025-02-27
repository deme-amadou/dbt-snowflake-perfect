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

--Create preset user

USE ROLE ACCOUNTADMIN;
CREATE ROLE IF NOT EXISTS REPORTER;
CREATE USER IF NOT EXISTS PRESET
 PASSWORD='presetPassword123'
 LOGIN_NAME='preset'
 MUST_CHANGE_PASSWORD=FALSE
 DEFAULT_WAREHOUSE='COMPUTE_WH'
 DEFAULT_ROLE=REPORTER
 DEFAULT_NAMESPACE='AIRBNB.RAW'
 COMMENT='Preset user for creating reports';

GRANT ROLE REPORTER TO USER PRESET;
GRANT ROLE REPORTER TO ROLE ACCOUNTADMIN;
GRANT ALL ON WAREHOUSE COMPUTE_WH TO ROLE REPORTER;
GRANT USAGE ON DATABASE AIRBNB TO ROLE REPORTER;
GRANT USAGE ON SCHEMA AIRBNB.RAW TO ROLE REPORTER;

-- We don't want to grant select rights here; we'll do this through hooks:
-- GRANT SELECT ON ALL TABLES IN SCHEMA AIRBNB.RAW TO ROLE REPORTER;
-- GRANT SELECT ON ALL VIEWS IN SCHEMA AIRBNB.RAW TO ROLE REPORTER;
-- GRANT SELECT ON FUTURE TABLES IN SCHEMA AIRBNB.RAW TO ROLE REPORTER;
-- GRANT SELECT ON FUTURE VIEWS IN SCHEMA AIRBNB.RAW TO ROLE REPORTER;
