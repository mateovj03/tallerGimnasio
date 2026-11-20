ALTER TABLE fichas_medicas
DROP CONSTRAINT fichas_medicas_documento_socio_fkey;

ALTER TABLE fichas_medicas
ADD CONSTRAINT fichas_medicas_documento_socio_fkey
FOREIGN KEY (documento_socio)
REFERENCES socios(documento)
ON DELETE CASCADE;

ALTER TABLE clases_grupales
DROP CONSTRAINT clases_grupales_id_entrenador_fkey;

ALTER TABLE clases_grupales
ADD CONSTRAINT clases_grupales_id_entrenador_fkey
FOREIGN KEY (id_entrenador)
REFERENCES entrenadores(id_entrenador)
ON DELETE SET NULL;

SELECT constraint_name, delete_rule
FROM information_schema.referential_constraints
ORDER BY constraint_name;
