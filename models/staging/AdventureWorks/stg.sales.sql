  With SalesOrderDetail as (
        select
            SalesOrderID as sales_order_id
            , SalesOrderDetailID as sales_order_detail_id
            , CarrierTrackingNumber as carrier_tracking_number
            , OrderQty as order_qty
            , SpecialOfferID as special_offer_id
            , UnitPrice as unit_price
            , UnitPriceDiscount as unit_price_discount
            , LineTotal as line_total
            , rowguid
            , ModifiedDate as modified_date
            , case
                when CarrierTrackingNumber is null then 'Without Number'
            end as tracking_number
        from {{source('AdventureWorks2019', 'SalesOrderDetail')}}
  )
select * from SalesOrderDetail
