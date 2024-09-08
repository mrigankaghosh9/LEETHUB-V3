# Write your MySQL query statement below
 select x,y,z,
      if((x+y>z) and (y+z>x) and (z+x>y), 'Yes', 'No') as triangle
 from triangle 


# another solution
SELECT x, y, z,
       CASE
           WHEN (x + y > z) AND (x + z > y) AND (y + z > x) THEN 'Yes'
           ELSE 'No'
       END AS triangle
FROM Triangle;

