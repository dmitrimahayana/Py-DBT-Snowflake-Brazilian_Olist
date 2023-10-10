
  
    

        create or replace transient table BRAZILIAN_OLIST.PUBLIC.dim_sellers
         as
        (-- noinspection SqlDialectInspectionForFile

with sellers as (
    select *
    from BRAZILIAN_OLIST.PUBLIC.stg_eltool__sellers
    )
select *
from sellers
        );
      
  