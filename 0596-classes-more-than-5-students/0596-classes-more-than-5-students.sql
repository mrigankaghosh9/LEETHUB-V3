# Write your MySQL query statement below
select max(class) as class
from courses
group by class
limit 1