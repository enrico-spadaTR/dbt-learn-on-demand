{%- set jv_payment_methods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card'] -%}


with stg_payments as (
    select * from {{ref('stg_payments')}}
),
pivoted as (
    select  
            order_id,
            {% for jv_payment_method in jv_payment_methods -%}
            sum(case when payment_method = '{{jv_payment_method}}' then amount else 0 end) as {{jv_payment_method}}_am
            {% if not loop.last -%} , {%- endif -%}
            {%- endfor %}
            
    from    stg_payments
    where status = 'success'
    group by order_id
)
select * from pivoted;