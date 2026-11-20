SELECT nombre, dia, hora
FROM clases_grupales
WHERE id_entrenador = 1;

SELECT id_membresia, documento_socio, fecha_fin
FROM membresias
WHERE fecha_fin < CURRENT_DATE;

SELECT nombre, precio
FROM planes
WHERE precio > 100000;

SELECT c.nombre, i.fecha_inscripcion
FROM inscripcion i
INNER JOIN clases_grupales c
ON i.id_clase = c.id_clase
WHERE i.documento_socio = '1001';