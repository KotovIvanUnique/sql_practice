select to_char(activity_date, 'yyyy-mm-dd') as day
     , active_users
  from (select activity_date
             , count(distinct user_id) as active_users
          from activity
         where activity_date between to_date('2019-07-27') - 29 and to_date('2019-07-27')
        group by activity_date)