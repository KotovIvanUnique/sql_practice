select t_id as id
     , case
        when max(case when t_p_id is null then 1 else 0 end) = 1 then 'Root'
        when count(p_id) > 0 then 'Inner'
        else 'Leaf'
       end as type
  from (select t.id as t_id
             , t.p_id as t_p_id
             , p.id as p_id
          from tree t
           left join tree p
             on t.id = p.p_id)
group by t_id