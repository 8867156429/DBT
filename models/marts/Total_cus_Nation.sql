with customer as (
    select * from {{ref ('stg_customer')}}
),
nation as (
    select * from {{ ref ('stg_nation')}}
),
final as ( 
    select
    nation.name as Nations,
    count(customer.customer_key) as No_of_csu,
    {{sum('customer.acctount_balance')}} as Total_balance
    from
    customer
        inner join nation
            on customer.nation_key = nation.nation_key
    group by 1
    order by 2 desc
)


select * from final ;
