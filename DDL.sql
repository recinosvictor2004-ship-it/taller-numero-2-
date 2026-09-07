CREATE DATABASE veterinaria;
USE veterinaria;

-- Tabla clientes
CREATE TABLE clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    correoElectronico VARCHAR(100) UNIQUE,
    activo TINYINT(1)
);

-- Tabla mascotas
CREATE TABLE mascotas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    nombre VARCHAR(20),
    nPatas INT,
    estatura FLOAT,
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID)
);

-- Tabla servicios
CREATE TABLE servicios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10,2)
);

-- Tabla intermedia mascota_servicio
CREATE TABLE mascota_servicio (
    ID_Mascota INT,
    ID_Servicio INT,
    fecha DATE,
    FOREIGN KEY (ID_Mascota) REFERENCES mascotas(ID),
    FOREIGN KEY (ID_Servicio) REFERENCES servicios(ID)
);
