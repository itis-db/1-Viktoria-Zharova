-- рекурсия 
WITH RECURSIVE r AS (
    SELECT 
        1 AS i, 
        1 AS factorial
    
    UNION 

    SELECT 
        i+1 AS i, 
        factorial * (i+1) as factorial 
    FROM r
    WHERE i < 10
)
SELECT * FROM r;
