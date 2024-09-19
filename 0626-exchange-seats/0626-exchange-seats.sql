# Write your MySQL query statement below

select 
  case when id%2 = 0 then id-1
  when id%2 != 0 and (select max(id) from seat) != id then id+1
  else id
  end as id,
  student
from seat 
order by 1