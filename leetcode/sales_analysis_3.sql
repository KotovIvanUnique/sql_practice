select product_id
     , product_name
  from (select p.product_id
             , p.product_name
             , max(case when s.sale_date between to_Date('2019-01-01') and to_date('2019-03-31') then 1 else 0 end) as sold_first_quarter
             , max(case when s.sale_date < to_Date('2019-01-01') or s.sale_date > to_date('2019-03-31') then 1 else 0 end) as sold_other_time
         from product p
          join sales s
           on p.product_id = s.product_id
        group by p.product_id
               , p.product_name) s
 where sold_first_quarter = 1
   and sold_other_time = 0