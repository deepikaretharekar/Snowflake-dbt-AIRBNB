{{ config(
    materialized = 'incremental',
    unique_key = ['booking_id', 'listing_id', 'host_id']
) }}

select 
    booking_id,
    listing_id,
    host_id,
    nights_booked,
    booking_amount,
    total_booking_amount,
    total_booking_amount_with_fees,
    cleaning_fee,
    service_fee,
    accommodates,
    bathrooms,
    bedrooms,
    price_per_night,
    response_rate
 from {{ref('obt')}}