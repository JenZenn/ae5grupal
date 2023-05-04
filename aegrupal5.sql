-- Creación de la base de datos de nombre myproyect
CREATE DATABASE myproyect;
USE myproyect;

-- Creación de tablas usuarios y clientes
  CREATE TABLE usuarios (
  id_usuario int NOT NULL,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  contraseña varchar(50) NOT NULL,
  zona_horaria varchar(50) DEFAULT 'UTC-2',
  genero enum('Masculino','Femenino') NOT NULL,
  telefono varchar(20) NOT NULL,
  id_contacto int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
);
   CREATE TABLE ingresos (
	id_ingreso int NOT NULL AUTO_INCREMENT,
	id_usuario int DEFAULT NULL,
	fecha_hora datetime DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

   CREATE TABLE contactos (
   id_contacto int NOT NULL AUTO_INCREMENT,
   id_usuario int DEFAULT NULL,
   telefono varchar(20) DEFAULT NULL,
   correo_electronico varchar(100) DEFAULT NULL,
  PRIMARY KEY (id_contacto),
  FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);


-- Inserción de datos en la tabla usuarios
INSERT INTO usuarios (id_usuario, nombre, apellido, contraseña, genero, telefono)
VALUES (1, 'Juan', 'Perez', 'contraseña1', 'Masculino', '1234567890'),
       (2, 'Maria', 'Gonzalez', 'contraseña2', 'Femenino', '0987654321'),
       (3, 'Pedro', 'Rodriguez', 'contraseña3', 'Masculino', '55555555'),
       (4, 'Lucia', 'Lopez', 'contraseña4', 'Femenino', '44444444'),
       (5, 'Carlos', 'Gomez', 'contraseña5', 'Masculino', '33333333'),
       (6, 'Ana', 'Martinez', 'contraseña6', 'Femenino', '22222222'),
       (7, 'Jorge', 'Sanchez', 'contraseña7', 'Masculino', '11111111'),
       (8, 'Laura', 'Fernandez', 'contraseña8', 'Femenino', '99999999');
SELECT * FROM usuarios;
       
-- Inserción de datos en la tabla ingresos       
INSERT INTO ingresos (id_usuario, fecha_hora)
VALUES
  (1, DEFAULT),
  (2, DEFAULT),
  (3, DEFAULT),
  (4, DEFAULT),
  (5, DEFAULT),
  (6, DEFAULT),
  (7, DEFAULT),
  (8, DEFAULT);
SELECT * FROM ingresos;

-- Modificación de la zona horaria por defecto de la tabla usuarios
ALTER TABLE usuarios MODIFY zona_horaria VARCHAR(50) DEFAULT 'UTC-2';

-- Creación de la tabla contactos
   CREATE TABLE contactos (
   id_contacto int NOT NULL AUTO_INCREMENT,
   id_usuario int DEFAULT NULL,
   telefono varchar(20) DEFAULT NULL,
   correo_electronico varchar(100) DEFAULT NULL,
  PRIMARY KEY (id_contacto),
  FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);


-- Modificación de la tabla usuarios en donde se agrega una nueva columna 'telefono' para poder vincularla con la tabla contactos
ALTER TABLE usuarios ADD COLUMN id_contacto INT AFTER telefono;
SELECT * FROM usuarios;

-- Se actualiza la tabla usuarios asignandole valores al id_contacto con el id_usuario.
-- De esta manera, se establece un vínculo entre el usuario y su contacto correspondiente en la tabla de contactos.
UPDATE usuarios SET id_contacto = 1 WHERE id_usuario = 1;
UPDATE usuarios SET id_contacto = 2 WHERE id_usuario = 2;
UPDATE usuarios SET id_contacto = 3 WHERE id_usuario = 3;
UPDATE usuarios SET id_contacto = 5 WHERE id_usuario = 4;
UPDATE usuarios SET id_contacto = 5 WHERE id_usuario = 5;
UPDATE usuarios SET id_contacto = 6 WHERE id_usuario = 6;
UPDATE usuarios SET id_contacto = 7 WHERE id_usuario = 7;
UPDATE usuarios SET id_contacto = 8 WHERE id_usuario = 8;
