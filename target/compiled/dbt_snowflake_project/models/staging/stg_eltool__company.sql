with source as (select *
                from BRAZILIAN_OLIST.public.ksql-company-stream),
     renamed as (select id,
                        ticker,
                        name,
                        logo
                 from source)
select *
from renamed