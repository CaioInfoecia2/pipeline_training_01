{{ config(
    materialized='table'
) }}

with SalesOrderHeader as (
    select
        SalesOrderID as sales_order_id
        , OrderDate as order_date
        , ShipDate as ship_date
        , CAST(TotalDue as Float) as total_due
        , CAST(SubTotal as Float) as sub_total
        , CAST(TaxAmt as Float) as taxamt
        , CAST(Freight as Float) as freight
        , MONTH(OrderDate) as order_month
        , YEAR(OrderDate) as order_year
        , DATENAME(month, OrderDate) as order_month_name
    from {{ source('AdventureWorks_Sales', 'SalesOrderHeader') }}
)

select * from SalesOrderHeader;
