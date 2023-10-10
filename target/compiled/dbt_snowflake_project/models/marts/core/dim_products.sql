-- noinspection SqlDialectInspectionForFile

with products as (
    select *
    from BRAZILIAN_OLIST.PUBLIC.stg_eltool__products
    )
select *
from products