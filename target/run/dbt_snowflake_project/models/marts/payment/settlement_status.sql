
  create or replace   view BRAZILIAN_OLIST.PUBLIC.settlement_status
  
   as (
    with order_payments as (select *
                     from BRAZILIAN_OLIST.PUBLIC.fact_order_payments),
     order_items as (select *
                  from BRAZILIAN_OLIST.PUBLIC.fact_order_items),
     orders as (select *
                 from BRAZILIAN_OLIST.PUBLIC.fact_orders)
SELECT
    so.customer_id,
    finall.*
FROM (
     SELECT *,
            CASE
                WHEN pr.payment_value = pr.cost
                    THEN 'settled'
                WHEN pr.payment_value < pr.cost
                    THEN 'underpaid'
                WHEN pr.payment_value > pr.cost
                    THEN 'overpaid'
                END payment_status
     FROM (
          SELECT
              sop.order_id,
              sop.payment_type,
              sop.payment_sequential,
              ROUND(CAST(sop.payment_value as NUMERIC), 0) AS payment_value,
              soi.last_order_item_id,
              soi.price,
              soi.freight_value,
              ROUND(CAST(cost as NUMERIC), 0) AS cost
          FROM (
               SELECT
                   order_id,
                   MAX(payment_type) AS payment_type,
                   MAX(payment_sequential) AS payment_sequential,
                   SUM(payment_value) AS payment_value
               FROM order_payments
               GROUP BY order_id
          ) sop
          INNER JOIN (
              SELECT
                  order_id, MAX(order_item_id) AS last_order_item_id,
                  SUM(price) AS price,
                  SUM(freight_value) AS freight_value,
                  SUM(price) + SUM(freight_value) AS cost
              FROM order_items
              GROUP BY order_id
          ) soi
          ON sop.order_id = soi.order_id
     ) pr
) finall
INNER JOIN orders so ON so.order_id = finall.order_id
WHERE
    payment_status != 'settled' AND
	payment_status = 'underpaid'
ORDER BY order_id, payment_sequential
  );

