CREATE TABLE socios ( 

    documento VARCHAR(20) PRIMARY KEY, 

    nombre VARCHAR(100) NOT NULL, 

    telefono VARCHAR(20), 

    correo VARCHAR(100) UNIQUE 

); 

  

CREATE TABLE planes ( 

    id_plan SERIAL PRIMARY KEY, 

    nombre VARCHAR(50) NOT NULL, 

    duracion INTEGER NOT NULL CHECK (duracion > 0), 

    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0) 

); 

  

CREATE TABLE entrenadores ( 

    id_entrenador SERIAL PRIMARY KEY, 

    nombre VARCHAR(100) NOT NULL, 

    especialidad VARCHAR(100), 

    correo VARCHAR(100) UNIQUE 

); 

  

CREATE TABLE fichas_medicas ( 

    documento_socio VARCHAR(20) PRIMARY KEY, 

    peso DECIMAL(5,2), 

    estatura DECIMAL(4,2), 

    lesiones TEXT, 

  

    FOREIGN KEY (documento_socio) 

    REFERENCES socios(documento) 

); 

  

CREATE TABLE clases_grupales ( 

    id_clase SERIAL PRIMARY KEY, 

    nombre VARCHAR(100) NOT NULL, 

    dia VARCHAR(20) NOT NULL, 

    hora TIME NOT NULL, 

    cupo INTEGER NOT NULL CHECK (cupo > 0), 

    id_entrenador INTEGER NOT NULL, 

  

    FOREIGN KEY (id_entrenador) 

    REFERENCES entrenadores(id_entrenador) 

); 

  

CREATE TABLE membresias ( 

    id_membresia SERIAL PRIMARY KEY, 

    fecha_inicio DATE NOT NULL, 

    fecha_fin DATE NOT NULL, 

    documento_socio VARCHAR(20) NOT NULL, 

    id_plan INTEGER NOT NULL, 

  

    FOREIGN KEY (documento_socio) 

    REFERENCES socios(documento), 

  

    FOREIGN KEY (id_plan) 

    REFERENCES planes(id_plan) 

); 

  

CREATE TABLE inscripcion ( 

    documento_socio VARCHAR(20), 

    id_clase INTEGER, 

    fecha_inscripcion DATE NOT NULL, 

  

    PRIMARY KEY (documento_socio, id_clase), 

  

    FOREIGN KEY (documento_socio) 

    REFERENCES socios(documento), 

  

    FOREIGN KEY (id_clase) 

    REFERENCES clases_grupales(id_clase) 

);