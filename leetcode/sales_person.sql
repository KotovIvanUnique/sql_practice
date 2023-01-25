with red_sales_person as (select distinct s.sales_id
                            from orders o
                             join salesperson s
                              on o.sales_id = s.sales_id
                             join company c 
                              on o.com_id = c.com_id
                             and c.name = 'RED')
select s.name 
  from salesperson s
 where s.sales_id not in (select sales_id from red_sales_person)