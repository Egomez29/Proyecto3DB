/** Database VideoGame Store */
CREATE DATABASE IF NOT EXISTS DB_Grupo1;
USE DB_Grupo1;
-- DROP DATABASE DB_Grupo1;

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
    stock INT NOT NULL,
    FOREIGN KEY (id_videojuego) REFERENCES Videojuegos(id_videojuego),
    FOREIGN KEY (id_plataforma) REFERENCES Plataformas(id_plataforma)
);

CREATE TABLE Usuarios(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(75) NOT NULL,
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
	id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_videojuego INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(8,2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_videojuego) REFERENCES Videojuegos(id_videojuego)
);

-- INSERT INTO

INSERT INTO Genero(nombre_genero, descripcion, ventas_totales)
	VALUES 
    ('Accion','Juegos de Accion', 125),
	('Terror','Juegos de Terror', 201),
    ('Estrategia','Juegos de Estrategia', 52);
    
INSERT INTO Plataformas(nombre_plataforma, fabricante, fecha_lanzamiento)
	VALUES 
    ('Playstation 4','Sony Entertainment','2013-11-15'),
    ('Nintendo Switch','Nintendo','2017-03-03'),
    ('Xbox One','Microsoft','2013-11-22');
    
INSERT INTO Videojuegos(titulo, id_genero, precio)
	VALUES 
    ('Call of Duty: Ghost', 1, 59.99),
    ('Outlast', 2, 39.99),
    ('Master Chess', 3, 14.99);
    
INSERT INTO Inventario(id_videojuego, id_plataforma, stock)
	VALUES 
    (1,1,25),
    (2,3,49),
    (3,2,7);
    
INSERT INTO Usuarios(nombre, email, telefono)
	VALUES
    ('Matias Cabrera','MatCabro12@gmail.com','+59 43 1527 1098'),
    ('Jose Escobedo','JCobedo47@hotmail.com','+502 4935 2507'),
    ('Peter Parker','PeteParker69@yahoo.com','+1 260 598 4918');
    
INSERT INTO Pedidos(id_usuario, fecha_pedido, total)
	VALUES 
    (2,'2019-01-14',69.63),
    (3,'2024-12-20',21.25),
    (1,'2021-11-14',46.82);
    
INSERT INTO DetallePedido(id_pedido, id_videojuego, cantidad, subtotal)
	VALUES
    (1,1,1,59.99),
    (2,3,1,14.99),
    (3,2,1,39.99);

