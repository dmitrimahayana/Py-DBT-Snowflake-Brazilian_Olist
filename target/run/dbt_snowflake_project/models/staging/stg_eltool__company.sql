
  
    

        create or replace transient table BRAZILIAN_OLIST.PUBLIC.stg_eltool__company
         as
        (with source as (select *
                from BRAZILIAN_OLIST.public.ksql-company-stream),
     renamed as (select id,
                        ticker,
                        name,
                        logo
                 from source)
select *
from renamed
        );
      
  