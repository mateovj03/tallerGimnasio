ALTER TABLE membresias
ADD COLUMN valor_pagado NUMERIC(10,2);

ALTER TABLE socios
ADD COLUMN acepta_whatsapp BOOLEAN NOT NULL DEFAULT FALSE;

UPDATE membresias
SET valor_pagado = 80000
WHERE id_membresia = 1;

UPDATE membresias
SET valor_pagado = 750000
WHERE id_membresia = 2;

UPDATE membresias
SET valor_pagado = 220000
WHERE id_membresia = 3;

UPDATE membresias
SET valor_pagado = 80000
WHERE id_membresia = 4;

UPDATE membresias
SET valor_pagado = 750000
WHERE id_membresia = 5;

UPDATE membresias
SET valor_pagado = 70000
WHERE id_membresia = 6;

UPDATE membresias
SET valor_pagado = 80000
WHERE id_membresia = 7;

UPDATE membresias
SET valor_pagado = 220000
WHERE id_membresia = 8;

UPDATE socios
SET acepta_whatsapp = TRUE
WHERE documento IN ('1001', '1002', '1005');

SELECT column_name,data_type
FROM information_schema.columns
WHERE table_name = 'membresias';