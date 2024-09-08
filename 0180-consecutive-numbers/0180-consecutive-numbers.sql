# Write your MySQL query statement below
select distinct l1.num as ConsecutiveNums
from logs l1, logs l2, logs l3
where l1.id = l2.id -1 and l2.id = l3.id -1
   and l1.num = l2.num and l2.num = l3.num

# another solution
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id + 1
JOIN Logs l3 ON l1.id = l3.id + 2
WHERE l1.num = l2.num AND l2.num = l3.num;
