{{config
    (materialized = 'incremental', 
        unique_key = 'listing_id'
    )
}}

select 
    listing_id,
    host_id,
    property_type,
    {{trimmer('property_type')}} as property_type_trimmed,
    room_type,
    city,
    country,
    accommodates,
    bathrooms,
    bedrooms,
    price_per_night,
    UPPER({{tag('price_per_night')}}) as price_tag,
     created_at
 from {{ref('bronze_listings')}}