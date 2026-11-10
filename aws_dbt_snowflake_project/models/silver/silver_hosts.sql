{{config
    (
        materialized = 'incremental', 
        unique_key = 'host_id'
    )
}}

select 
    host_id,
    upper(host_name) as host_name,
    host_since,
    is_superhost,
    response_rate,
    case when is_superhost = 'true' then 'SuperHost' else 'NewHost' end as host_type,
    case 
        when response_rate > 90 then 'high' 
        when response_rate > 70 then 'medium' 
    else 'low' 
    end as host_response_rate_tag,
    created_at
 from {{ref('bronze_hosts')}}