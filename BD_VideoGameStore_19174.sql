/** Database VideoGame Store */
CREATE DATABASE IF NOT EXISTS BD_VideoGameStore_19174;
USE BD_VideoGameStore_19174;

-- drop database BD_VideoGameStore_19174;

CREATE TABLE tbl_Genero(
	id_Gen INT PRIMARY KEY,
    nom_Gen VARCHAR(50) NOT NULL,
    desc_Gen VARCHAR(250) NOT NULL,
    ventas_Gen INT NOT NULL
);

CREATE TABLE tbl_Plataforma(
	id_Plat INT PRIMARY KEY,
    nom_Plat VARCHAR(70) NOT NULL,
    fabric_Plat VARCHAR(60) NOT NULL,
    release_Plat DATE NOT NULL
);

CREATE TABLE tbl_Usuario(
	id_Us INT PRIMARY KEY,
    nom_Us VARCHAR(75) NOT NULL,
    email_Us VARCHAR(75) NOT NULL,
    tel_Us VARCHAR(16) NOT NULL
);

CREATE TABLE tbl_Videojuego(
	id_VJ INT PRIMARY KEY,
    titulo_VJ VARCHAR(75) NOT NULL,
	id_Gen INT NOT NULL, 
    precio_VJ DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (id_Gen) REFERENCES tbl_Genero(id_Gen)
);

CREATE TABLE tbl_Inventario (
	id_Inve INT PRIMARY KEY,
    id_VJ INT NOT NULL,
    id_Plat INT NOT NULL,
    stock_Inve INT NOT NULL,
    FOREIGN KEY (id_VJ) REFERENCES tbl_Videojuego(id_VJ),
    FOREIGN KEY (id_Plat) REFERENCES tbl_Plataforma(id_Plat)
);

CREATE TABLE tbl_Pedido(
	id_Ped INT PRIMARY KEY,
    id_Us INT NOT NULL,
    fecha_Ped DATE NOT NULL,
    total_Ped DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (id_Us) REFERENCES tbl_Usuario(id_Us)
);

CREATE TABLE tbl_DetallePedido(
	id_dtl INT PRIMARY KEY,
    id_Ped INT NOT NULL,
    id_VJ INT NOT NULL,
    cant_dtl INT NOT NULL,
    subtotal_dtl DECIMAL(8,2),
    FOREIGN KEY (id_Ped) REFERENCES tbl_Pedido(id_Ped),
    FOREIGN KEY (id_VJ) REFERENCES tbl_Videojuego(id_VJ)
);

-- INSERT INTO

INSERT INTO tbl_Genero(id_Gen, nom_Gen, desc_Gen, ventas_Gen)
	VALUES 
    (1, 'Accion','Juegos de Accion', 125),
	(2, 'Terror','Juegos de Terror', 201);
    
INSERT INTO tbl_Plataforma(id_Plat, nom_Plat, fabric_Plat, release_Plat)
	VALUES 
    (1, 'Playstation 4','Sony Entertainment','2013-11-15'),
    (2, 'Nintendo Switch','Nintendo','2017-03-03');
    
INSERT INTO tbl_Videojuego(id_VJ, titulo_VJ, id_Gen, precio_VJ)
	VALUES 
    (1, 'Call of Duty: Ghost', 1, 59.99),
    (2, 'Outlast', 2, 39.99);
    
INSERT INTO tbl_Inventario(id_Inve, id_VJ, id_Plat, stock_Inve)
	VALUES 
    (1,1,1,25),
    (2,2,2,49);
    
INSERT INTO tbl_Usuario(id_Us, nom_Us, email_Us, tel_Us)
	VALUES
    (1,'Matias Cabrera','MatCabro12@gmail.com','+59 43 1527 1098'),
    (2,'Jose Escobedo','JCobedo47@hotmail.com','+502 4935 2507');
    
INSERT INTO tbl_Pedido(id_Ped, id_Us, fecha_Ped, total_Ped)
	VALUES 
    (1,1,'2019-01-14',69.63),
    (2,2,'2024-12-20',21.25);
    
INSERT INTO tbl_DetallePedido(id_dtl, id_Ped, id_VJ, cant_dtl, subtotal_dtl)
	VALUES
    (1,1,1,1,59.99),
    (2,2,2,1,14.99);
    
-- Consulta 1
SELECT 
    v.titulo_VJ AS 'Título del juego',
    g.nom_Gen AS 'Género',
    g.desc_Gen AS 'Descripción del género',
    g.ventas_Gen AS 'Ventas Totales',
    p.nom_Plat AS 'Plataforma',
    i.stock_Inve AS 'Stock disponible'
	FROM 
		tbl_Videojuego v
		JOIN 
			tbl_Genero g ON v.id_Gen = g.id_Gen
		JOIN 
			tbl_Inventario i ON v.id_VJ = i.id_VJ
		JOIN 
			tbl_Plataforma p ON i.id_Plat = p.id_Plat
			WHERE 
				i.stock_Inve > 0
			AND g.ventas_Gen > 100
				ORDER BY 
					v.titulo_VJ ASC;

 -- Consulta 2

SELECT 
    u.nom_Us AS 'Nombre del cliente',
    p.fecha_Ped AS 'Fecha del pedido',
    v.titulo_VJ AS 'Juego comprado',
    d.cant_dtl AS 'Cantidad',
    d.subtotal_dtl AS 'Subtotal',
    p.total_ped AS 'Total'
	FROM 
		tbl_Pedido p
		JOIN 
			tbl_Usuario u ON p.id_Us = u.id_Us
		JOIN 
			tbl_DetallePedido d ON p.id_Ped = d.id_Ped
		JOIN 
			tbl_Videojuego v ON d.id_VJ = v.id_VJ
			WHERE 
				p.total_Ped > 20
			AND YEAR(p.fecha_Ped) > 2018
				ORDER BY 
					p.fecha_Ped DESC;
     
