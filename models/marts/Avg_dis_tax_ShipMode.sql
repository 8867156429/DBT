{# {%- set ship_modes = ['TRUCK','AIR','MAIL','RAIL','SHIP','FOB', 'REG AIR']-%}
#}

{%- set ship_modes = ['TRUCK','AIR','MAIL','RAIL','SHIP','FOB']-%}
 
with ship as (
    select DISCOUNT_PERCENTAGE, TAX_RATE, SHIP_MODE FROM {{ ref('stg_lineitem')}}
),
final as (
    select 
        ship_mode,
        {% for i in ship_modes %}
            avg(case when ship_mode = '{{i}}' then TAX_RATE else 0 end) as {{i}}_tax_rate,
            avg(case when ship_mode = '{{i}}' then {{discount('discount_percentage')}} else 0 end) as {{i}}_dis_rate

            {% if not loop.last %}
            ,
            {% endif %}

        {% endfor %}
     
   from ship
   group by 1
)

select * from final
