# Write your MySQL query statement below

select id, count(*) as num
from(
select requester_id as id
from requestaccepted
union all
select accepter_id as num
from requestaccepted
) as friend_count
group by id 
order by num desc
limit 1