/** Database VideoGame Store */

CREATE DATABASE IF NOT EXISTS DB_Grupo1;
USE DB_Grupo1;
/*DROP DATABASE db_grupo1;*/

CREATE TABLE Genero(
	id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nombre_genero VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    ventas_totales int
);

CREATE TABLE Plataformas(
	id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nombre_plataforma VARCHAR(70) NOT NULL,
    fabricante VARCHAR(60) NOT NULL,
    fecha_lanzamiento DATE NOT NULL
);

