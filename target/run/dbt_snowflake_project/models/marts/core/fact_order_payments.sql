
  
    

        create or replace transient table BRAZILIAN_OLIST.PUBLIC.fact_order_payments
         as
        (with orders as (select *
                     from BRAZILIAN_OLIST.PUBLIC.stg_eltool__order_payments)
select order_id,
       payment_sequential,
       payment_type,
       payment_installments,
       payment_value
from orders
        );
      
  