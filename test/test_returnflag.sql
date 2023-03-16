with lineitem as
( 
    select
    count(order_key) as No_of_Orders,
    return_flag
from {{ ref('stg_lineitem') }}
group by 2 
)

select * from lineitem
where (select No_of_Orders from lineitem where return_flag = 'N') 
        <
          (select No_of_Orders from lineitem where return_flag = 'R') and
          (select No_of_Orders from lineitem where return_flag = 'A')


