SELECT *
FROM socios
WHERE documento = '1001';

UPDATE socios
SET telefono = '3119999999'
WHERE documento = '1001';

SELECT *
FROM clases_grupales
WHERE id_clase = 2;

UPDATE clases_grupales
SET estado = 'suspendida'
WHERE id_clase = 2;

SELECT *
FROM membresias
WHERE documento_socio = '1005';

DELETE FROM membresias
WHERE id_membresia = 7;