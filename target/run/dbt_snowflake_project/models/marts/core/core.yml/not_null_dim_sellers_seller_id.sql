select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select seller_id
from BRAZILIAN_OLIST.PUBLIC.dim_sellers
where seller_id is null



      
    ) dbt_internal_test