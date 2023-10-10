
  create or replace   view BRAZILIAN_OLIST.PUBLIC.freight_efficiency_category
  
   as (
    with order_items as (select *
                     from BRAZILIAN_OLIST.PUBLIC.fact_order_items)

SELECT *,
    CASE
        WHEN oi.freight_efficiency >=0 AND freight_efficiency <= 10
            THEN 'A'
        WHEN oi.freight_efficiency >=11 AND freight_efficiency <= 20
            THEN 'B'
        WHEN oi.freight_efficiency >=21
            THEN 'C'
        END freight_category
FROM (SELECT order_id,
             product_id,
             seller_id,
             freight_value,
             price,
             freight_value / price AS freight_efficiency
      FROM order_items) oi
  );

