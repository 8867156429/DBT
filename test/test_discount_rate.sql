select
    order_key,
    quantity,
    {{ discount('discount_percentage')}} as discount_percentage
from {{ ref('stg_lineitem') }}
where discount_percentage < 15
