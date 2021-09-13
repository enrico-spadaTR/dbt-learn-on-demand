with stg_payments as (
    select * from {{ref("stg_payments")}}
),
stg_orders as (
    select * from {{ref("stg_orders")}}
),
order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from stg_payments
    group by 1
),
final as (

    select
        stg_orders.order_id,
        stg_orders.customer_id,
        stg_orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from stg_orders
    left join order_payments using (order_id)
)

select * from final