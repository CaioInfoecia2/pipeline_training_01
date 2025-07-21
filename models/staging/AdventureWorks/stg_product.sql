{{ config(
    materialized='table'
) }}

with product as (
    select
        ProductID as product_id,
        Name as name
    from {{ source('AdventureWorks_Production', 'Product') }}
)

select * from product;
