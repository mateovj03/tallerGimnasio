SELECT
    COUNT(*) AS total_socios,
    COUNT(correo) AS socios_con_correo
FROM socios;

SELECT
    SUM(valor_pagado) AS total_recaudado
FROM membresias
WHERE fecha_inicio >= '2026-11-01'
  AND fecha_inicio < '2026-12-01';

SELECT
    MIN(valor_pagado) AS pago_minimo,
    MAX(valor_pagado) AS pago_maximo,
    ROUND(AVG(valor_pagado), 0) AS promedio_pago
FROM membresias;

SELECT
    COUNT(*) AS total_membresias,
    COUNT(DISTINCT documento_socio) AS socios_distintos
FROM membresias;