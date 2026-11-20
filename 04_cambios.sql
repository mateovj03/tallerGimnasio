ALTER TABLE clases_grupales
ADD COLUMN estado VARCHAR(20)
NOT NULL DEFAULT 'activa';

ALTER TABLE clases_grupales
ADD CONSTRAINT chk_estado_clase
CHECK (estado IN ('activa','suspendida'));