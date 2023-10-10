with orders as (select *
                from BRAZILIAN_OLIST.PUBLIC.fact_orders),
     order_payments as (select *
                        from BRAZILIAN_OLIST.PUBLIC.fact_order_payments)
SELECT customer_id,
       COUNT(order_id)                               AS count_transaction,
       ROUND(CAST(SUM(payment_value) as NUMERIC), 0) AS transactions_amt
FROM (SELECT so.order_id,
             so.customer_id,
             sop.payment_sequential,
             sop.payment_type,
             sop.payment_installments,
             sop.payment_value
      FROM (SELECT *
            FROM orders
            WHERE order_status != 'unavailable' AND order_status != 'canceled') so
      INNER JOIN order_payments sop ON sop.order_id = so.order_id
      ORDER BY sop.order_id) trx
GROUP BY customer_id, order_id
ORDER BY count_transaction DESC, transactions_amt DESC