# 🐾 Veterinaria – Base de Datos Relacional con Procedimientos Almacenados

Este proyecto implementa una base de datos relacional para la gestión de una veterinaria, utilizando **MySQL** y aplicando conceptos avanzados como:

- Diseño de modelo entidad–relación  
- DDL (creación de tablas)  
- DML (población de datos)  
- 19 procedimientos almacenados  
- Estructuras de control (IF, WHILE, LOOP, REPEAT)  
- Manejo de errores con `SIGNAL`  
- Relaciones 1:N y N:N  

---

## 📘 1. Objetivo del Proyecto

El propósito de este proyecto es demostrar dominio en:

- Modelado de bases de datos  
- Implementación de lógica interna mediante procedimientos almacenados  
- Uso de parámetros IN/OUT  
- Validaciones y manejo de errores  
- Operaciones CRUD avanzadas  
- Control de flujo dentro de MySQL  

La base de datos permite administrar:

- Clientes  
- Mascotas  
- Servicios  
- Historial de servicios aplicados  

---

## 🧩 2. Modelo Entidad–Relación

### **Tablas principales**
- **clientes** → Información de los dueños  
- **mascotas** → Información de las mascotas  
- **servicios** → Servicios ofrecidos  
- **mascota_servicio** → Relación N:N entre mascotas y servicios  

### **Relaciones**
- Un cliente puede tener muchas mascotas  
- Una mascota puede recibir muchos servicios  
- Un servicio puede aplicarse a muchas mascotas  

---

## 🧱 3. DDL – Creación de Tablas

```sql
CREATE DATABASE veterinaria;
USE veterinaria;

CREATE TABLE clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    correoElectronico VARCHAR(100) UNIQUE,
    activo TINYINT(1)
);

CREATE TABLE mascotas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    nombre VARCHAR(20),
    nPatas INT,
    estatura FLOAT,
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID)
);

CREATE TABLE servicios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10,2)
);

CREATE TABLE mascota_servicio (
    ID_Mascota INT,
    ID_Servicio INT,
    fecha DATE,
    FOREIGN KEY (ID_Mascota) REFERENCES mascotas(ID),
    FOREIGN KEY (ID_Servicio) REFERENCES servicios(ID)
);
```
---
## 📥 4. DML – Inserción de Datos (10 registros por tabla)
Incluye 10 registros para cada tabla, cumpliendo los requisitos del proyecto.

# Clientes
```sql
INSERT INTO clientes (nombre, direccion, correoElectronico, activo) VALUES
('Carlos Pérez','Zona 1','carlos@gmail.com',1),
('Ana López','Zona 5','ana@gmail.com',1),
('Luis Gómez','Zona 7','luis@gmail.com',0),
('María Ruiz','Zona 10','maria@gmail.com',1),
('Pedro Díaz','Zona 3','pedro@gmail.com',1),
('Sofía Méndez','Zona 8','sofia@gmail.com',1),
('Jorge Castillo','Zona 4','jorge@gmail.com',0),
('Elena Torres','Zona 6','elena@gmail.com',1),
('Ricardo Ramos','Zona 2','ricardo@gmail.com',1),
('Paola Martínez','Zona 9','paola@gmail.com',1);
```
# Mascotas 
```sql
INSERT INTO mascotas (ID_Cliente, nombre, nPatas, estatura) VALUES
(1,'Firulais',4,0.45),
(1,'Max',4,0.60),
(2,'Pelusa',4,0.30),
(3,'Rex',4,0.70),
(4,'Luna',4,0.40),
(5,'Toby',4,0.55),
(6,'Michi',4,0.25),
(7,'Boby',4,0.50),
(8,'Kira',4,0.35),
(9,'Nina',4,0.42);
```
# Servicios 
```sql
INSERT INTO servicios (nombre, precio) VALUES
('Baño',50.00),
('Corte de pelo',75.00),
('Vacuna',120.00),
('Desparasitación',90.00),
('Limpieza dental',150.00),
('Consulta general',80.00),
('Radiografía',200.00),
('Cirugía menor',350.00),
('Control de peso',60.00),
('Chequeo anual',180.00);
```

# Mascotas_Servicio
```sql
INSERT INTO mascota_servicio (ID_Mascota, ID_Servicio, fecha) VALUES
(1,1,'2024-01-10'),
(1,3,'2024-01-15'),
(2,2,'2024-02-01'),
(3,4,'2024-02-20'),
(4,5,'2024-03-05'),
(5,1,'2024-03-10'),
(6,6,'2024-03-12'),
(7,7,'2024-03-15'),
(8,8,'2024-03-18'),
(9,9,'2024-03-20');
```
---
### ⚙️ 5. Procedimientos Almacenados (19 Total)
El proyecto incluye 19 procedimientos, organizados por categoría.

# 🟦 CRUD Básico
Insertar Cliente

Actualizar Cliente

Eliminar Mascota

Actualizar Precio de Servicio

Eliminar Servicio por Nombre

# 🟩 Consultas
Listar Servicios de una Mascota

Listar Mascotas por Cliente

Clasificar Mascotas por Estatura

# 🟧 Contadores (parámetros OUT)
Contar Mascotas por Cliente

Contar Servicios por Mascota

Contar Clientes Activos

# 🟥 Lógica Avanzada
Registrar Servicio a Mascota

Registrar Múltiples Servicios

Repetir Registro de Servicio

Incrementar Precio de Servicios

Transferir Mascota

Aumentar Estatura de Mascotas

Verificar Existencia de Correo
---

### 🔁 7. Estructuras de Control Usadas
# IF–THEN–ELSE
Validación de servicios y clasificación de mascotas.

# WHILE
Aumentar estatura de todas las mascotas.

# REPEAT
Registrar un servicio múltiples veces.

# LOOP
Procesar una lista de servicios.
---
### 🛑 8. Manejo de Errores
Se utiliza:
```sql
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Mensaje de error';
```
Para validar:

Correos duplicados

Servicios inexistentes
---
### 📂 9. Estructura del Repositorio
```text
/veterinaria-db
│
├── ddl.sql
├── dml.sql
├── procedimientos.sql
├── README.md
└── /capturas

```
---