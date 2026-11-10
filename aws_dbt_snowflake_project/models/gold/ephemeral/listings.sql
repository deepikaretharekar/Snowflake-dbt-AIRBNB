{{config(
    materialized = 'ephemeral'
)
}}

With listings as (
    select 
    listing_id,
    property_type,
    property_type_trimmed,
    room_type,
    city,
    country,
    price_tag,
    listing_created_at as created_at
  from {{ref('obt')}}
)
select * from listings