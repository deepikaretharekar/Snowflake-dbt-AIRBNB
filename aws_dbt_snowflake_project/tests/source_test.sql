{{config(
    severity = 'warn',
)}}

select * from {{source('staging','bookings')}} where booking_status = 'cancelled'