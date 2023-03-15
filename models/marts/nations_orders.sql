with
customer as (
    select * from {{ref ('stg_customer')}}
),
nation as (
    select * from {{ ref ('stg_nation')}}
),
orders as (
    select * from {{ ref('stg_orders')}}
),
region as (
    select * from {{ ref('stg_region')}}
),
final as ( 
    select
    region.REGION_NAME as REGION_NAME,
    count(orders.order_key) as No_of_orders,
    {{sum('orders.TOTAL_PRICE')}} as Total_balance
    from 
    orders 
        inner join customer
            using(CUSTOMER_KEY)
        inner join nation
            using(nation_key)
        inner join region
            using(REGION_KEY)
        
    group by 1
 )

select * from final ;
