INSERT INTO clientes (nombre, direccion, correoElectronico, activo) VALUES
('Carlos Pérez', 'Zona 1', 'carlos@gmail.com', 1),
('Ana López', 'Zona 5', 'ana@gmail.com', 1),
('Luis Gómez', 'Zona 7', 'luis@gmail.com', 0),
('María Ruiz', 'Zona 10', 'maria@gmail.com', 1),
('Pedro Díaz', 'Zona 3', 'pedro@gmail.com', 1),
('Sofía Méndez', 'Zona 8', 'sofia@gmail.com', 1),
('Jorge Castillo', 'Zona 4', 'jorge@gmail.com', 0),
('Elena Torres', 'Zona 6', 'elena@gmail.com', 1),
('Ricardo Ramos', 'Zona 2', 'ricardo@gmail.com', 1),
('Paola Martínez', 'Zona 9', 'paola@gmail.com', 1);

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
