SELECT id_plan, COUNT(*) AS cantidad_membresias
FROM membresias
GROUP BY id_plan
ORDER BY cantidad_membresias DESC;

SELECT id_clase, COUNT(*) AS cantidad_inscritos
FROM inscripcion
GROUP BY id_clase
ORDER BY cantidad_inscritos DESC;

SELECT id_clase, COUNT(*) AS cantidad_inscritos
FROM inscripcion
GROUP BY id_clase
HAVING COUNT(*) >= 4
ORDER BY cantidad_inscritos DESC;

SELECT documento_socio,
COUNT(*) AS cantidad_membresias
FROM membresias
GROUP BY documento_socio
HAVING COUNT(*) >= 2
ORDER BY cantidad_membresias DESC;

SELECT documento_socio,MAX(fecha_fin) AS ultima_fecha_fin
FROM membresias
GROUP BY documento_socio
HAVING MAX(fecha_fin) < CURRENT_DATE
ORDER BY ultima_fecha_fin DESC;

SELECT id_plan,SUM(valor_pagado) AS total_recaudado
FROM membresias
GROUP BY id_plan
ORDER BY total_recaudado DESC;