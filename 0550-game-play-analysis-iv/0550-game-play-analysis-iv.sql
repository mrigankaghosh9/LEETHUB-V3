# Write your MySQL query statement below

select round(count(distinct player_id)/ (select count(distinct player_id)
from activity), 2) as fraction
from activity
where (player_id, date_sub(event_date, interval 1 day)) in (
    select player_id, min(event_date) as first_login
    from activity
    group by player_id
)

# another sol
WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
ConsecutiveLogin AS (
    SELECT f.player_id
    FROM FirstLogin f
    JOIN Activity a
    ON f.player_id = a.player_id
    AND DATE_ADD(f.first_login_date, INTERVAL 1 DAY) = a.event_date
)
SELECT 
    ROUND(COUNT(DISTINCT c.player_id) / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM 
    FirstLogin f
LEFT JOIN 
    ConsecutiveLogin c
ON 
    f.player_id = c.player_id;
