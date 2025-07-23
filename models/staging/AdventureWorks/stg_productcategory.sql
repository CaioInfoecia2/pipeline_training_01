{{ config(
    materialized='table'
) }}

with productcategory as (
    select
        ProductCategoryID as product_category_id,
        Name as pc_name
    from {{ source('AdventureWorks_Production', 'ProductCategory') }}
)

select * from productcategory;
