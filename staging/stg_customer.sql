with 

source as (

  select * from {{ ref('base_customer') }}

),

transformed as (

  select 

    c_custkey as customer_key,
    c_name as name,
    c_nationkey as nation_key,
    c_phone as phone_number,
    c_acctbal as acctount_balance

  from source

)

select * from transformed