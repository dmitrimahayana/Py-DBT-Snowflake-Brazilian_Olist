with order_items as (select *
                     from {{ ref('stg_eltool__order_items') }}),
     products as (select *
                  from {{ ref('dim_products') }}),
     sellers as (select *
                 from {{ ref('dim_sellers') }})
select a.order_id,
       a.order_item_id,
       b.product_id,
       b.product_category_name,
       b.product_name_lenght,
       b.product_description_lenght,
       b.product_photos_qty,
       b.product_weight_g,
       b.product_length_cm,
       b.product_height_cm,
       b.product_width_cm,
       c.seller_id,
       c.seller_zip_code_prefix,
       c.seller_city,
       c.seller_state,
       a.shipping_limit_date,
       a.price,
       a.freight_value
from order_items a
         join products b on a.product_id = b.product_id
         join sellers c on a.seller_id = c.seller_id