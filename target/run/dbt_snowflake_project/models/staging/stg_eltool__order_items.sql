
  
    

        create or replace transient table BRAZILIAN_OLIST.PUBLIC.stg_eltool__order_items
         as
        (with source as (select *
                from BRAZILIAN_OLIST.public.order_items),
     renamed as (select order_id,
                        order_item_id,
                        product_id,
                        seller_id,
                        shipping_limit_date,
                        price,
                        freight_value
                 from source)
select *
from renamed
        );
      
  