select t.name
     , t.travelled_distance
  from (select u.id
             , u.name
             , coalesce(sum(r.distance), 0) as travelled_distance
          from users u
           left join rides r
            on u.id = r.user_id
        group by u.id
               , u.name) t
order by t.travelled_distance desc, t.name asc