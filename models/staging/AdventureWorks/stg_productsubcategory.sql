{{ config(
    materialized='table'
) }}

with productsubcategory as (
    select
        ProductSubcategoryID as product_subcategory_id,
        Name as sub_pname,
        ProductCategoryID as product_category_id
    from {{ source('AdventureWorks_Production', 'ProductSubcategory') }}
)

select * from productsubcategory;
