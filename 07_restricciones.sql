ALTER TABLE membresias
ALTER COLUMN valor_pagado SET NOT NULL;

ALTER TABLE membresias
ADD CONSTRAINT membresias_valor_pagado_check
CHECK (valor_pagado > 0);

ALTER TABLE membresias
ADD CONSTRAINT membresias_fechas_check
CHECK (fecha_fin > fecha_inicio);

ALTER TABLE clases_grupales
ADD CONSTRAINT clases_grupales_entrenador_dia_hora_key
UNIQUE (id_entrenador, dia, hora);