with source as (select *
                from {{ source('public', 'order_payments') }}),
     renamed as (select order_id,
                        payment_sequential,
                        payment_type,
                        payment_installments,
                        payment_value
                 from source)
select *
from renamed