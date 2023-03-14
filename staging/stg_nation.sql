with 

source as (

  select * from {{ ref('base_nation') }}

),

transformed as (

  select 
    N_NATIONKEY as nation_key,
    N_NAME as name,
    N_REGIONKEY as region_key,
    N_COMMENT as comment

  from source

)

select * from transformed