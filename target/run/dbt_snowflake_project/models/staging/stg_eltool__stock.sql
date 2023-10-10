
  
    

        create or replace transient table BRAZILIAN_OLIST.PUBLIC.stg_eltool__stock
         as
        (with source as (select DISTINCT *
                from BRAZILIAN_OLIST.public.ksql-stock-stream),
     renamed as (select *
                 from source)
select *
from renamed
        );
      
  