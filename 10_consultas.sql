SELECT *
FROM membresias
WHERE fecha_inicio >= '2026-09-01'
  AND fecha_inicio < '2026-11-01'
ORDER BY fecha_inicio ASC;

SELECT *
FROM clases_grupales
WHERE LOWER(nombre) = 'spinning';

SELECT documento, nombre, telefono
FROM socios
WHERE correo IS NULL;

SELECT *
FROM clases_grupales
WHERE estado = 'activa'
  AND (dia = 'Lunes' OR dia = 'Jueves');

SELECT *
FROM clases_grupales
WHERE estado = 'activa'
  AND dia = 'Lunes'
  OR dia = 'Jueves';

SELECT
    id_membresia AS membresia,
    documento_socio AS socio,
    valor_pagado AS pagado
FROM membresias
ORDER BY valor_pagado DESC, id_membresia ASC
LIMIT 3;

SELECT dia
FROM clases_grupales
GROUP BY dia
ORDER BY dia ASC;