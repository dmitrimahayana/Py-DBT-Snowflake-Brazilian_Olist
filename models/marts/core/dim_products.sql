-- noinspection SqlDialectInspectionForFile

with products as (
    select *
    from {{ ref('stg_eltool__products') }}
    )
select *
from products