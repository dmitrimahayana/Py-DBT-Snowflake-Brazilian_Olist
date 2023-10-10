select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- fact_orders must have the same number of rows as its staging counterpart
-- Therefore return records where this isn't true to make the test fail
select *
from (
    select fact_orders.order_id
    from BRAZILIAN_OLIST.PUBLIC.fact_orders fact_orders
        left join BRAZILIAN_OLIST.PUBLIC.stg_eltool__orders stg_orders
    on fact_orders.order_id = stg_orders.order_id
    where stg_orders.order_id is null
    UNION ALL
    select stg_orders.order_id
    from BRAZILIAN_OLIST.PUBLIC.stg_eltool__orders stg_orders
      left join BRAZILIAN_OLIST.PUBLIC.fact_orders fact_orders
    on stg_orders.order_id = fact_orders.order_id
    where fact_orders.order_id is null
) tmp
      
    ) dbt_internal_test