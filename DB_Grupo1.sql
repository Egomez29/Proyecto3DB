/** Database VideoGame Store */



CREATE DATABASE IF NOT EXISTS DB_Grupo1;
USE DB_Grupo1;


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

CREATE TABLE Videojuegos(
	id_videojuego INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(75) NOT NULL,
	id_genero INT NOT NULL, 
    precio DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (id_genero) REFERENCES Genero(id_genero)
);

CREATE TABLE Inventario (
	id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_videojuego INT NOT NULL,
    id_plataforma INT NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE Usuarios(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(75) NOT NULL,
    telefono VARCHAR(16) NOT NULL
);

CREATE TABLE Pedidos(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    total DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);


CREATE TABLE DetallePedido(
	id_detalle INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_pedido INT NOT NULL,
    id_videojuego INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_videojuego) REFERENCES Videojuegos(id_videojuego)

);
	

