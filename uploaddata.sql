-- apagamos el candado de las llavees foraneas temporalment
SET FOREIGN_KEY_CHECKS = 0;
-- limpiar la tabla por si dejo basura el intento anterior
TRUNCATE TABLE constructors;

LOAD DATA LOCAL INFILE 'C:/Users/Gustavo/Documents/GitHub/CSV/constructors.csv' 
INTO TABLE constructors 
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
-- mapeo del archivo de CSV
(constructorId, name, nationality, @dummy);

-- 3. Volvemos a encender el candado por seguridad
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM constructors;