-- creacion de BD
-- drop database f1_analysis;
 -- create database if not exists f1_analysis;
use f1_analysis;
-- show tables;
-- tabla escuderias
 -- drop table constructors;
create table constructors(
	constructorId int not null ,
    constructorRef varchar(100) not null,
    name varchar(50) not null,
    nationality varchar(50) not null,
    primary key(constructorId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

-- tabla pilotos

create table if not exists drivers(
	driverId int not null auto_increment,
    driverRef varchar(100) not null,
    number int ,
    code varchar(3),
    forename varchar(100) not null, 
    surname varchar(100) not null,
    dob date, -- fecha de nacimiento
    nationality varchar(50),
    primary key (driverId)    
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

-- tabla carreras

create table if not exists races(
	 raceId int not null,
     year int not null,
     round int not null,
     circuitId int not null,
     name varchar(100)  not null,
     date DATE not null,
     time TIME,
     primary key(raceId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
    resultId INT NOT NULL,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT, -- Número del coche
    grid INT NOT NULL, -- Posición de salida en la parrilla
    position VARCHAR(10), -- Posición final en texto (puede ser 'R' de Retirado o 'D' de Descalificado)
    positionText VARCHAR(10),
    positionOrder INT NOT NULL, -- Posición final estricta en número (ideal para cálculos continuos)
    points DECIMAL(5,2) NOT NULL, -- Puntos obtenidos (usamos decimal por los medios puntos históricos o Sprints)
    laps INT NOT NULL, -- Vueltas completadas por el piloto
    time VARCHAR(50), -- Tiempo total de carrera (ej. "1:32:15.234")
    milliseconds INT, -- Tiempo total expresado en milisegundos
    fastestLap INT, -- El número de vuelta donde hizo su vuelta más 
    rank INT, -- El ranking de su vuelta rápida comparado con los demás pilotos
    fastestLapTime VARCHAR(50), -- Tiempo de la vuelta rápida en texto (ej. "1:21.432")
    fastestLapSpeed VARCHAR(50), -- Velocidad promedio de la vuelta rápida
    statusId INT NOT NULL, -- Identificador del estado final (1 = Terminado, 3 = Choque, etc.)
    PRIMARY KEY (resultId),
    -- Definimos las llaves foráneas para mantener la integridad de nuestra base de datos
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;