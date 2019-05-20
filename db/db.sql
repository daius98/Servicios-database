
CREATE DATABASE IF NOT EXISTS Servicios;

USE Servicios;

CREATE TABLE IF NOT EXISTS usuarios (
	usuarios_id INT(11) UNIQUE NOT NULL auto_increment,
    username VARCHAR(45) UNIQUE NOT NULL,
    email TEXT default UNIQUE null,
    PRIMARY KEY (usuarios_id)
);

CREATE TABLE IF NOT EXISTS categorias (
	categorias_id INT(11) NOT NULL auto_increment,
    name TEXT,
    descrip TEXT,
    PRIMARY KEY (categorias_id)
);

CREATE TABLE IF NOT EXISTS servicios (
	servicios_id INT(11) NOT NULL auto_increment,
    name varchar(100) NOT NULL,
    usuarios_id INT (11),
    categorias_id INT (11),
    descrip TEXT,
    PRIMARY KEY (servicios_id),
    FOREIGN KEY (usuarios_id) REFERENCES usuarios (usuarios_id),
    FOREIGN KEY (categorias_id) REFERENCES categorias (categorias_id)
);



CREATE TABLE IF NOT EXISTS transacciones (
	transacciones_id INT(11) NOT NULL auto_increment,
    servicios_id INT(11),
    estado TEXT,
    PRIMARY KEY (transacciones_id),
    FOREIGN KEY (servicios_id) REFERENCES servicios (servicios_id)
);

CREATE TABLE IF NOT EXISTS pagos (
	pagos_id INT(11) NOT NULL auto_increment,
    tipo TEXT,
    cantidad INT(100),
    PRIMARY KEY (pagos_id)
);

CREATE TABLE IF NOT EXISTS usuariosYpagos (
	pagos_id INT(11),
    usuarios_orig_id INT(11),
    usuarios_dest_id INT(11),
    FOREIGN KEY (usuarios_orig_id) REFERENCES usuarios (usuarios_id),
    FOREIGN KEY (usuarios_dest_id) REFERENCES usuarios (usuarios_id),
    FOREIGN KEY (pagos_id) REFERENCES pagos (pagos_id)
);

CREATE TABLE IF NOT EXISTS usuariosYtransacciones (
	transacciones_id INT(11),
    usuarios_orig_id INT(11),
    usuarios_dest_id INT(11),
    FOREIGN KEY (usuarios_orig_id) REFERENCES usuarios (usuarios_id),
    FOREIGN KEY (usuarios_dest_id) REFERENCES usuarios (usuarios_id),
    FOREIGN KEY (transacciones_id) REFERENCES transacciones (transacciones_id)
);
