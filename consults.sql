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

