
  
    

        create or replace transient table BRAZILIAN_OLIST.PUBLIC.dim_products
         as
        (-- noinspection SqlDialectInspectionForFile

with products as (
    select *
    from BRAZILIAN_OLIST.PUBLIC.stg_eltool__products
    )
select *
from products
        );
      
  