{{ config(
    materialized='table'
) }}

with product as (
    select
        ProductID as product_id,
        Name as p_name,
        ProductSubcategoryID as product_subcategory_id
    from {{ source('AdventureWorks_Production', 'Product') }}
)

select * from product;
