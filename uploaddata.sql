-- apagamos el candado de las llavees foraneas temporalment
SET GLOBAL FOREIGN_KEY_CHECKS = 0;
-- limpiar la tabla por si dejo basura el intento anterior
TRUNCATE TABLE results;
 -- use f1_analysis;
--  
LOAD DATA LOCAL INFILE 'C:/Users/Gustavo/Documents/GitHub/CSV/race_results.csv' 
INTO TABLE results
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES
-- mapeo del archivo de CSV
-- Leemos la fecha en una variable temporal (@v_date)
(
    season, round, @dummy, @dummy, @v_position, positionText, @v_points, 
    driverId, @dummy, @dummy, @dummy, @dummy, constructorId, @dummy, 
    @v_grid, @v_laps, status, time, fastestLapTime, @v_fastestLapRank, fastestLapSpeed
)
-- convertimos los espacios en blanco a valores nulos válidos
SET 
    position = NULLIF(@v_position, ''),
    points = NULLIF(@v_points, ''),
    grid = NULLIF(@v_grid, ''),
    laps = NULLIF(@v_laps, ''),
    fastestLapRank = NULLIF(@v_fastestLapRank, '');

-- 3. Volvemos a encender el candado por seguridad
SET FOREIGN_KEY_CHECKS = 1;
SELECT * FROM results;

-- show tables;