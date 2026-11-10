{{config(
    materialized = 'ephemeral'
)
}}

With hosts as (
    select 
    host_id,
    host_name,
    host_since,
    is_superhost,
    host_type,
    host_response_rate_tag as response_rate_tag,
    host_created_at as created_at
  from {{ref('obt')}}
)
select * from hosts