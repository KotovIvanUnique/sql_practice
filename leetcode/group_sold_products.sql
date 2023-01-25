select to_char(sell_date, 'yyyy-mm-dd') as sell_date
     , num_sold
     , products
  from (select sell_date
             , count(product) as num_sold
             , listagg(product, ',') within group (order by product) as products
          from (select distinct
                       sell_date
                     , product
                  from activities)
        group by sell_date)