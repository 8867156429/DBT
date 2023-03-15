with

source as (

    select * from  SNOWFLAKE_SAMPLE_DATA.TPCH_SF1000.CUSTOMER

),

customers as (

    select
     *
    from source

)

select * from customers
