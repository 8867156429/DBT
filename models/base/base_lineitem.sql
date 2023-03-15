with

source as (

    select * from  {{ source ('TPCH_SF', 'LINEITEM')}}
),

customers as (

    select
     *
    from source

)

select * from customers
