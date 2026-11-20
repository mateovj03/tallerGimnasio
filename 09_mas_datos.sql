UPDATE clases_grupales
SET cupo = 4
WHERE id_clase = 1;

UPDATE clases_grupales
SET cupo = 4
WHERE id_clase = 3;

UPDATE clases_grupales
SET cupo = 3
WHERE id_clase = 4;

INSERT INTO inscripcion
(documento_socio, id_clase, fecha_inscripcion)
VALUES
('1006', 1, CURRENT_DATE),
('1001', 3, CURRENT_DATE),
('1006', 4, CURRENT_DATE), 
('1004', 3, CURRENT_DATE); 
