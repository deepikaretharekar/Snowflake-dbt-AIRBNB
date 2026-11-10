{{config(
    materialized = 'incremental',
    unique_key = 'booking_id'
)
}}

select 
    booking_id,
    listing_id,
    booking_date,
    nights_booked,
    booking_amount,
   {{ multiply('nights_booked','booking_amount')}} as Total_booking_amount,
   {{ multiply('nights_booked','booking_amount')}} + cleaning_fee + service_fee as Total_booking_amount_with_fees,
    cleaning_fee,
    service_fee,
    booking_status,
    created_at
 from {{ref('bronze_bookings')}}