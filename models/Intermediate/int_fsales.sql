{{ config(
    materialized='table'
) }}

with sales_detail as (
    select *
    from {{ ref('stg_SalesOrderDetail') }}
),
sales_header as (
    select *
    from {{ ref('stg_SalesOrderHeader') }}
)

select
    sh.sales_order_id,
    sh.order_date,
    sh.ship_date,
    SUM(sd.order_qty) as total_order_qty, 
    sh.sub_total,
    sh.taxamt,
    sh.freight,
    sh.total_due,
    sh.order_month,
    sh.order_month_name
from sales_detail sd
join sales_header sh
    on sd.sales_order_id = sh.sales_order_id
group by
    sh.sales_order_id,
    sh.order_date,
    sh.ship_date,
    sh.sub_total,
    sh.taxamt,
    sh.freight,
    sh.total_due,
    sh.order_month,
    sh.order_month_name