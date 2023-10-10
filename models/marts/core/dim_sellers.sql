-- noinspection SqlDialectInspectionForFile

with sellers as (
    select *
    from {{ ref('stg_eltool__sellers') }}
    )
select *
from sellers