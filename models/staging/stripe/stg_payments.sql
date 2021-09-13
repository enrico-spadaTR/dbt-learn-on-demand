WITH PAYMENT AS (
    SELECT  
        ID AS PAYMENT_ID,
        ORDERID AS ORDER_ID,
        PAYMENTMETHOD AS PAYMENT_METHOD,
        STATUS,
        -- amount is stored in cents, convert it to dollars
        {{cents_to_dollars('AMOUNT')}} AS AMOUNT,
        CREATED,
        _BATCHED_AT
    FROM    {{source("stripe", "payment")}}
)
SELECT  *
FROM    PAYMENT