SET GLOBAL local_infile = 1;

-- apagamos el candado de las llavees foraneas temporalment

SET FOREIGN_KEY_CHECKS = 0;
-- limpiar la tabla por si dejo basura el intento anterior

TRUNCATE TABLE circuits;

LOAD DATA LOCAL INFILE 'C:/Users/Gustavo/Documents/GitHub/CSV/circuits.csv' 
INTO TABLE circuits
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(circuit_id, name, city, country, lat, lng, url);
-- 3. Volvemos a encender el candado por seguridad

SET FOREIGN_KEY_CHECKS = 1;

select * from circuits;