-- ejercicio 1
select id_paciente, CONCAT(p2.nombres,' ',p2.apellido_materno,' ',p2.apellido_paterno) AS nombre_paciente  ,sum(detalle_presupuesto.precio) as deuda
from detalle_presupuesto
left join presupuesto p on detalle_presupuesto.id_presupuesto = p.id
left join paciente p2 on p.id_paciente = p2.id
where realizado=1
group by id_paciente;

-- ejercicio 2

select detalle_presupuesto.id_presupuesto,p.nombre,
       CASE WHEN realizado=0 THEN SUM(detalle_presupuesto.precio) ELSE 0 END AS 'total_pendiente',
       CASE WHEN realizado=1 THEN SUM(detalle_presupuesto.precio) ELSE 0 END AS 'total_realizado'
from detalle_presupuesto
inner join presupuesto p on detalle_presupuesto.id_presupuesto = p.id
GROUP BY p.id;

-- ejercicio 3
SELECT pro.id , CONCAT(pro.nombres,' ',pro.apellido_paterno,' ',pro.apellido_materno) AS nombre,
       CASE
           WHEN realizado = 0 THEN 0
           ELSE COUNT(id_presupuesto)
       END AS total_presupuestos_activos
FROM profesional pro
LEFT JOIN detalle_presupuesto dp on pro.id = dp.id_profesional_creador
GROUP BY pro.id;

-- ejercicio 4

SELECT sexo, ROUND(AVG(TIMESTAMPDIFF(YEAR,pa.fecha_nacimiento, CURDATE())),1) as edad_promedio
FROM paciente pa
group by pa.sexo;

-- ejercicio 5
SELECT profesional.id, CONCAT(profesional.nombres,' ', profesional.apellido_paterno,' ', profesional.apellido_paterno) AS nombre_profesional
FROM profesional
LEFT JOIN detalle_presupuesto dp ON profesional.id = dp.id_profesional_realizador
WHERE dp.id_profesional_realizador IS NULL;

-- ejercicio 6
SELECT id_profesional_realizador AS id_profesional,
       CONCAT(p.nombres,' ', p.apellido_paterno,' ', p.apellido_paterno) AS nombre_profesional ,
       id_categoria,
       cp.nombre AS nombre_categoria,
       SUM(detalle_presupuesto.precio) AS total_realizado
FROM detalle_presupuesto
LEFT JOIN profesional p on detalle_presupuesto.id_profesional_creador = p.id
LEFT JOIN prestacion p2 on detalle_presupuesto.id_prestacion = p2.id
LEFT JOIN categoria_prestacion cp on p2.id_categoria = cp.id
WHERE realizado = 1
GROUP BY p.id;

-- ejercicio 7

SELECT id_presupuesto,nombre AS nombre_presupuesto
FROM presupuesto
LEFT JOIN detalle_presupuesto dp on presupuesto.id = dp.id_presupuesto
WHERE dp.fecha_realizacion IS NOT NULL
GROUP BY id_presupuesto;

-- ejercicio 8
select SUM(dp.precio) AS 'deuda_total'
from paciente
INNER JOIN presupuesto p on paciente.id = p.id_paciente
INNER JOIN detalle_presupuesto dp on p.id = dp.id_presupuesto
WHERE fecha_realizacion IS NOT NULL
GROUP BY id_presupuesto
ORDER BY deuda_total DESC
LIMIT 1;

-- ejercicio 9
SELECT pp.id ,nombre
FROM presupuesto pp
LEFT OUTER JOIN detalle_presupuesto dp on pp.id = dp.id_presupuesto
WHERE id_presupuesto IS NULL;

-- ejercicio 10
SELECT AVG(TIMESTAMPDIFF(DAY,fecha_creacion, fecha_realizacion)) AS tiempo_promedio_en_dias
FROM detalle_presupuesto
where fecha_realizacion IS NOT NULL

-- ejercicio 11

SELECT COUNT(id_especialidad), nombre
FROM detalle_presupuesto dp
INNER JOIN profesional p on dp.id_profesional_creador = p.id
INNER JOIN especialidad e on p.id_especialidad = e.id
WHERE fecha_realizacion IS NOT NULL
GROUP BY id_profesional_realizador
LIMIT 1

-- ejercicio 12
SELECT  cp.id ,cp.nombre ,AVG(dp.precio) AS 'precio_promedio'
FROM detalle_presupuesto dp
INNER JOIN prestacion p on dp.id_prestacion = p.id
INNER JOIN categoria_prestacion cp on p.id_categoria = cp.id
WHERE dp.realizado = 1
GROUP BY dp.id_prestacion;

-- ejercicio 13

SELECT id_categoria, cp.nombre,SUM(detalle_presupuesto.precio) AS total_realizado
FROM detalle_presupuesto
INNER JOIN prestacion p on detalle_presupuesto.id_prestacion = p.id
INNER JOIN categoria_prestacion cp on p.id_categoria = cp.id
WHERE realizado=1
GROUP BY id_categoria
ORDER BY total_realizado;

-- ejercicio 14

SELECT id_paciente,CONCAT(paciente.nombres,' ',paciente.apellido_paterno,' ',paciente.apellido_materno) AS nombre_paciente,COUNT(p.id_paciente) AS total_presupuestos
FROM paciente
INNER JOIN presupuesto p on paciente.id = p.id_paciente
GROUP BY id_paciente
HAVING total_presupuestos > 1;

-- ejercicio 15
SELECT id_paciente, p2.nombres
FROM detalle_presupuesto
LEFT JOIN presupuesto p on detalle_presupuesto.id_presupuesto = p.id
LEFT JOIN paciente p2 on p.id_paciente = p2.id
WHERE realizado=0
GROUP BY id_presupuesto;

-- ejercicio 16

SELECT id_sucursal,sucursal.nombre, COUNT(p.id_sucursal) AS total_pacientes_atendidos
FROM sucursal
INNER JOIN presupuesto p on sucursal.id = p.id_sucursal
GROUP BY id_sucursal
ORDER BY total_pacientes_atendidos DESC
LIMIT 1






