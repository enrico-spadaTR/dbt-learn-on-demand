with stg_payments as (
    select * from {{ref("stg_payments")}}
),
stg_orders as (
    select * from {{ref("stg_orders")}}
)
select 
    stg_orders.order_id,
    stg_orders.customer_id,
    sum(stg_payments.amount) as amount
from stg_orders
left join stg_payments
    on  stg_orders.order_id = stg_payments.order_id
group by    stg_orders.order_id,
            stg_orders.customer_id