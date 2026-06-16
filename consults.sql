-- ritmo de carrera antes y despues del pitstop

SELECT
	r.season as temporada,
	ra.name as gran_premio,
	d.surname as piloto,
	r.round as ronda,
	MIN(r.fastestLapTime) as mejor_vuelta
from results r
join races ra on r.season = ra.season and r.round = ra.round
join drivers d on r.driverId = d.driverId
group by r.season, ra.name, d.surname, r.round;

-- mostrar el total de pit stop, el promedio de duracion en cada temporada

select
r.season AS temporada,
c.name as escuderia,
count(p.stop) as total_paradas,
avg(p.duration_s) as Duracion_promedio_seconds

FROM pit_stops p
JOIN results r on p.season = r.season and p.round = r.round and p.driverId = r.driverId
JOIN constructors c on r.constructorId = c.constructorId
GROUP BY r.season, c.name
ORDER BY Duracion_promedio_seconds ASC;

show tables;
select * from races;