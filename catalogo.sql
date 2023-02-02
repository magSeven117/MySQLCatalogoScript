CREATE DATABASE catalogo

CREATE TABLE producto(
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	precio FLOAT NOT NULL,
	stock INT,
	CONSTRAINT pk_id_producto PRIMARY KEY(id)	
);

CREATE TABLE rol(
	id INT AUTO_INCREMENT,
	CONSTRAINT pk_id_rol PRIMARY KEY(id)	
);

CREATE TABLE usuario(
	id INT AUTO_INCREMENT,
	id_rol INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	contraseña VARCHAR(50) NOT NULL,
	activo TINYINT not null, 
	CONSTRAINT pk_id_rol PRIMARY KEY(id),
	FOREIGN KEY(id_rol) REFERENCES rol(id)	
);

CREATE TABLE factura(
	id INT AUTO_INCREMENT,
	id_usuario INT NOT NULL,
	total_fac float NOT NULL,
	fecha date NOT NULL,
	CONSTRAINT pk_id_factura PRIMARY KEY(id),

	FOREIGN KEY(id_usuario) REFERENCES usuario(id)	
);

CREATE TABLE detalle(
	id INT AUTO_INCREMENT,
	id_producto INT NOT NULL,
	id_factura INT NOT NULL,
	cantidad_detalle INT NOT NULL,
	precio_total float NOT NULL,
	CONSTRAINT pk_id_detalle PRIMARY KEY(id),
	FOREIGN KEY(id_producto) REFERENCES producto(id),
	FOREIGN KEY(id_factura) REFERENCES factura(id)
);