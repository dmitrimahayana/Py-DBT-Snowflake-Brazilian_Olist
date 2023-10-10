
  
    

        create or replace transient table BRAZILIAN_OLIST.PUBLIC.stg_eltool__order_paymetns
         as
        (with source as (select *
                from BRAZILIAN_OLIST.public.order_payments),
     renamed as (select order_id,
                        payment_sequential,
                        payment_type,
                        payment_installments,
                        payment_value
                 from source)
select *
from renamed
        );
      
  