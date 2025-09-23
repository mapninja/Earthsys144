-- This SQL query creates a 5km buffer around a specified school
SELECT
    s.NAME, -- Select the name of the school
    ST_Buffer(s.geometry, 5000) AS geometry -- Create a new geometry representing a 5km buffer around the school's location
FROM 
    schools_stateplane AS s -- From the schools_stateplane table
WHERE 
    s.NAME = "Edgewood Magnet School (K-8) "; -- Filter to include only the school with the specified name
