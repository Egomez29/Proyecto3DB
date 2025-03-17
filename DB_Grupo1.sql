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