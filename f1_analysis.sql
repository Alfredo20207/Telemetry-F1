-- creacion de BD
-- drop database f1_analysis;
  create database if not exists f1_analysis;
use f1_analysis;
-- show tables;
-- tabla escuderias
 --  drop table constructors;
create table constructors(
	constructorId varchar(100) not null ,
    -- constructorRef varchar(100) not null,
    name varchar(50) not null,
    nationality varchar(50) not null,
    primary key(constructorId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

-- tabla pilotos

CREATE TABLE drivers (
    driverId VARCHAR(100) NOT NULL, 
    number INT,                    
    code VARCHAR(3),                
    forename VARCHAR(100) NOT NULL, 
    surname VARCHAR(100) NOT NULL,  
    dob DATE,                       
    nationality VARCHAR(50),        
    PRIMARY KEY (driverId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- tabla carreras

CREATE TABLE races (
    season INT NOT NULL,
    round INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    date DATE,
    time VARCHAR(20), -- Lo dejamos como texto porque trae una 'Z' al final (ej. 15:00:00Z)
    circuit_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (season, round) -- Esta combinación es nuestra nueva llave única
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
SET FOREIGN_KEY_CHECKS = 1;

create table pit_stops(
	raceId int not null,
    driverId int not null,
    stop int not null, -- numero de parada
    lap int not null, -- vuelta en la que entro a boxes
    time varchar(50), -- hora del dia del stop
    duration varchar(50), -- duarcion del stop en texto
    miliseconds int, -- duracion en milisegundos, para evaluar promedios
    PRIMARY KEY (raceId, driverId, stop),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Tabla de Resultados de Carrera (Results)
CREATE TABLE results (
    resultId INT AUTO_INCREMENT, -- Genera un número único automático para cada fila
    season INT NOT NULL,
    round INT NOT NULL,
    driverId VARCHAR(100) NOT NULL,
    constructorId VARCHAR(100) NOT NULL,
    grid INT,
    position VARCHAR(10),
    positionText VARCHAR(10),
    points DECIMAL(5,2),
    laps INT,
    status VARCHAR(100),
    time VARCHAR(50),
    fastestLapTime VARCHAR(50),
    fastestLapRank INT,
    fastestLapSpeed VARCHAR(50),
    PRIMARY KEY (resultId),
    -- Relaciones con tus otras tablas:
    FOREIGN KEY (season, round) REFERENCES races(season, round),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;