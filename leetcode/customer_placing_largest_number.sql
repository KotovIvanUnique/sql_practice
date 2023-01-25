select distinct
       first_value(customer_number) over (order by cnt_orders desc) as customer_number
  from (select customer_number
             , count(order_number) as cnt_orders
        from orders
        group by customer_number)