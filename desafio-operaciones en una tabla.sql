--1. Crear una base de datos con nombre “Posts”
CREATE DATABASE posts_db;
-- moviendose a la base de datos creada
\c posts
-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción
CREATE TABLE post(
   id SERIAL NOT NULL PRIMARY KEY,
   nombre_usuario VARCHAR(50) NOT NULL,
   fecha_creacion DATE NOT NULL,
   contenido VARCHAR(200) NOT NULL,
   descripcion VARCHAR(200) NOT NULL
);
--3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela', '01-01-2020', 'mensaje', 'detalle');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela', '01-01-2020', 'mensaje2', 'detalle2');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Carlos', '01-01-2020', 'mensaje', 'detalle');
--4. Modificar la tabla post, agregando la columna título.
ALTER TABLE post
ADD titulo VARCHAR(25);

--5. Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo = 'titulo' WHERE id= '1';
UPDATE post SET titulo = 'titulo2' WHERE id= '2';
UPDATE post SET titulo = 'titulo3' WHERE id= '3';

--6. Insertar 2 post para el usuario "Pedro".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', '01-01-2020', 'mensaje', 'detalle', 'titulo');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', '01-01-2020', 'mensaje2', 'detalle2', 'titulo2');


--7. Eliminar el post de Carlos.
DELETE FROM post WHERE id = '3';

--8. Ingresar un nuevo post para el usuario "Carlos".

INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Carlos', '01-01-2020', 'mensaje', 'detalle', 'titulo');

--Parte 2

--1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
--creación y contenido, que se relacione con la tabla posts.

CREATE TABLE comentarios(
   id SERIAL NOT NULL PRIMARY KEY,
   post_id BIGINT NOT NULL,
   fecha DATE NOT NULL,
   hora_creacion TIME NOT NULL,
   contenido VARCHAR(200) NOT NULL,
   FOREIGN KEY (post_id) REFERENCES post(id)
);

--2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".

INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('1', '01-01-2020', '12:30:00', 'comentario1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('1', '01-01-2020', '12:30:00', 'comentario2');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '01-01-2020', '12:30:00', 'comentario1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '01-01-2020', '12:30:00', 'comentario2');

--3. Crear un nuevo post para "Margarita".

INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Margarita', '01-01-2020', 'mensaje', 'detalle', 'titulo');


--4. Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '01-01-2020', '12:30:00', 'comentario1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '01-01-2020', '12:30:00', 'comentario2');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '01-01-2020', '12:30:00', 'comentario3');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '01-01-2020', '12:30:00', 'comentario4');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '01-01-2020', '12:30:00', 'comentario5');

