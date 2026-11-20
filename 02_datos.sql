INSERT INTO planes (nombre,duracion,precio)
VALUES
('Mensual',1,80000),
('Trimestral',3,220000),
('Anual',12,750000);

INSERT INTO socios (documento,nombre,telefono,correo)
VALUES
('1001','Juan Perez','3001111111','juan@gmail.com'),
('1002','Maria Gomez','3002222222','maria@gmail.com'),
('1003','Carlos Ruiz','3003333333','carlos@gmail.com'),
('1004','Laura Diaz','3004444444',NULL),
('1005','Andres Torres','3005555555','andres@gmail.com'),
('1006','Sofia Castro','3006666666','sofia@gmail.com');

INSERT INTO fichas_medicas
(documento_socio,peso,estatura,lesiones)
VALUES
('1001',75,1.78,'Ninguna'),
('1002',60,1.65,'Lesion de rodilla'),
('1003',83,1.82,'Dolor lumbar'),
('1004',58,1.60,'Ninguna');

INSERT INTO entrenadores
(nombre,especialidad,correo)
VALUES
('Pedro Ramirez','Spinning','pedro@gmail.com'),
('Natalia Rojas','Yoga','natalia@gmail.com'),
('Diego Mora','Crossfit','diego@gmail.com');

INSERT INTO clases_grupales
(nombre,dia,hora,cupo,id_entrenador)
VALUES
('Spinning','Lunes','08:00',3,1),
('Yoga','Martes','10:00',4,2),
('Funcional','Miercoles','18:00',2,1),
('Pilates','Jueves','09:00',2,2);

INSERT INTO membresias
(fecha_inicio,fecha_fin,documento_socio,id_plan)
VALUES
('2026-01-01','2026-02-01','1001',1),
('2026-02-02','2027-02-02','1001',3),
('2026-04-01','2026-07-01','1002',2),
('2025-01-01','2025-02-01','1003',1),
('2026-03-01','2027-03-01','1004',3),
('2026-05-01','2026-06-01','1005',1),
('2026-05-01','2026-06-01','1005',1),
('2026-08-01','2026-11-01','1006',2);

INSERT INTO inscripcion
(documento_socio,id_clase,fecha_inscripcion)
VALUES
('1001',1,'2026-01-05'),
('1002',1,'2026-01-06'),
('1003',1,'2026-01-07'),
('1001',2,'2026-01-08'),
('1002',2,'2026-01-09'),
('1003',2,'2026-01-10'),
('1004',2,'2026-01-11'),
('1005',3,'2026-01-12'),
('1001',4,'2026-01-13'),
('1004',4,'2026-01-14');