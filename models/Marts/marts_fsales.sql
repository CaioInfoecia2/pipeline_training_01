{{ config(
    database='BiTest',
    materialized='incremental',
    unique_key='sales_order_id'
) }}

select *
from {{ ref('int_fsales') }}
{% if is_incremental() %}
where order_date > (select max(order_date) from {{ this }})
{% endif %}
