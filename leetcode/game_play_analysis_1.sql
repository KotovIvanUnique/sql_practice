select player_id
     , to_char(min(event_date), 'yyyy-mm-dd') as first_login
  from activity
group by player_id