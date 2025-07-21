{{ config(
    materialized='table'
) }}

with SalesOrderDetail as (
    select
        SalesOrderID as sales_order_id,
        UnitPrice as unit_price,
        COALESCE(OrderQty, 0) as order_qty,
        ProductID as product_id
    from {{ source('AdventureWorks_Sales', 'SalesOrderDetail') }}
)

select * from SalesOrderDetail;
