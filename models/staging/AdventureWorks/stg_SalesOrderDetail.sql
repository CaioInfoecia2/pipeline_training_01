{{ config(
    materialized='table'
) }}

with SalesOrderDetail as (
    select
        SalesOrderID as sales_order_id,
        UnitPrice as unit_price,
        COALESCE(OrderQty, 0) as order_qty
    from {{ source('AdventureWorks2019', 'SalesOrderDetail') }}
)

select * from SalesOrderDetail;
