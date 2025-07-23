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
),
product as (
    select *
    from {{ ref('stg_product') }}
),
productsubcategory as (
    select *
    from {{ ref('stg_productsubcategory') }}
),
productcategory as (
    select *
    from {{ ref('stg_productcategory') }}
)

select
    sh.sales_order_id,
    pd.product_id,
    pd.p_name,
    ps.sub_pname,
    pc.pc_name,
    sh.order_date,
    sh.ship_date,
    SUM(sd.order_qty) as total_order_qty, 
    sd.unit_price,
    sh.sub_total,
    sh.taxamt,
    sh.freight,
    sh.total_due,
    sh.order_month,
    sh.order_month_name
from sales_detail sd
join sales_header sh
    on sd.sales_order_id = sh.sales_order_id
join product pd on pd.product_id = sd.product_id
join productsubcategory ps on ps.product_subcategory_id = pd.product_subcategory_id
join productcategory pc on pc.product_category_id = ps.product_category_id
group by
    sh.sales_order_id,
    sh.order_date,
    sh.ship_date,
    sh.sub_total,
    sh.taxamt,
    sh.freight,
    sh.total_due,
    sh.order_month,
    sh.order_month_name,
    pd.product_id,
    pd.p_name,
    pc.pc_name,
    ps.sub_pname,
    sd.unit_price
