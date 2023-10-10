
  
    

        create or replace transient table BRAZILIAN_OLIST.PUBLIC.stg_eltool__orders
         as
        (with source as (select *
                from BRAZILIAN_OLIST.public.orders),
     renamed as (select order_id,
                        customer_id,
                        order_status,
                        order_purchase_timestamp,
                        order_approved_at,
                        order_delivered_carrier_date,
                        order_delivered_customer_date,
                        order_estimated_delivery_date
                 from source)
select *
from renamed
        );
      
  