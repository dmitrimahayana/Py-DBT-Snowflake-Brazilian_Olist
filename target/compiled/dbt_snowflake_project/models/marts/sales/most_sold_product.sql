with order_items as (select *
                     from BRAZILIAN_OLIST.PUBLIC.fact_order_items)
SELECT *,
        DENSE_RANK() OVER (
            ORDER BY sold_number DESC
        ) sold_rank_perworld,
        DENSE_RANK() OVER (
            PARTITION BY seller_id
            ORDER BY sold_number DESC
        ) sold_rank_perseller
FROM (SELECT product_id, seller_id, product_category_name, seller_city, COUNT(product_id) AS sold_number
      FROM order_items
      GROUP BY product_id, seller_id, product_category_name, seller_city
      ORDER BY sold_number DESC) sold_prod
ORDER BY sold_number DESC, sold_rank_perworld ASC