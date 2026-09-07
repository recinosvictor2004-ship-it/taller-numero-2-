DELIMITER //
CREATE PROCEDURE InsertarCliente(
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_correo VARCHAR(100)
)
BEGIN
    INSERT INTO clientes(nombre, direccion, correoElectronico, activo)
    VALUES (p_nombre, p_direccion, p_correo, 1);
END //


DELIMITER ;

--actualizar estado de un cliente
DELIMITER //
CREATE PROCEDURE ActualizarEstadoCliente(
    IN p_id INT,
    IN p_estado TINYINT
)
BEGIN
    UPDATE clientes SET activo = p_estado WHERE ID = p_id;
END //
DELIMITER ;


--contar mascotas de un cliente
DELIMITER //
CREATE PROCEDURE ContarMascotasCliente(
    IN p_idCliente INT,
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*) INTO p_total
    FROM mascotas
    WHERE ID_Cliente = p_idCliente;
END //
DELIMITER ;


--listar servicios de una mascota
DELIMITER //
CREATE PROCEDURE ListarServiciosMascota(IN p_idMascota INT)
BEGIN
    SELECT s.nombre, s.precio, ms.fecha
    FROM mascota_servicio ms
    JOIN servicios s ON ms.ID_Servicio = s.ID
    WHERE ms.ID_Mascota = p_idMascota;
END //
DELIMITER ;


-- registrar servicio a mascota
DELIMITER //
CREATE PROCEDURE RegistrarServicioMascota(
    IN p_idMascota INT,
    IN p_idServicio INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO mascota_servicio(ID_Mascota, ID_Servicio, fecha)
    VALUES (p_idMascota, p_idServicio, p_fecha);
END //
DELIMITER ;


--eliminar mascota
DELIMITER //
CREATE PROCEDURE EliminarMascota(IN p_idMascota INT)
BEGIN
    DELETE FROM mascota_servicio WHERE ID_Mascota = p_idMascota;
    DELETE FROM mascotas WHERE ID = p_idMascota;
END //
DELIMITER ;


--Actualizar precio de servicio 
DELIMITER //
CREATE PROCEDURE ActualizarPrecioServicio(
    IN p_idServicio INT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    UPDATE servicios SET precio = p_precio WHERE ID = p_idServicio;
END //
DELIMITER ;


--contratar servicio por mascota
DELIMITER //
CREATE PROCEDURE ContarServiciosMascota(
    IN p_idMascota INT,
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*) INTO p_total
    FROM mascota_servicio
    WHERE ID_Mascota = p_idMascota;
END //
DELIMITER ;


-- incrmentar salariovde servicio
DELIMITER //
CREATE PROCEDURE IncrementarPrecioServicios(IN p_porcentaje FLOAT)
BEGIN
    UPDATE servicios
    SET precio = precio + (precio * (p_porcentaje / 100));
END //
DELIMITER ;


-- repetis registro de servicio
DELIMITER //
CREATE PROCEDURE RepetirRegistroServicio(
    IN p_idMascota INT,
    IN p_idServicio INT,
    IN p_veces INT
)
BEGIN
    DECLARE contador INT DEFAULT 1;
    REPEAT
        INSERT INTO mascota_servicio(ID_Mascota, ID_Servicio, fecha)
        VALUES (p_idMascota, p_idServicio, CURDATE());
        SET contador = contador + 1;
    UNTIL contador > p_veces END REPEAT;
END //
DELIMITER ;


-- verificar existencia de correo 
DELIMITER //
CREATE PROCEDURE VerificarCorreo(IN p_correo VARCHAR(100))
BEGIN
    IF EXISTS(SELECT 1 FROM clientes WHERE correoElectronico = p_correo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo ya existe';
    END IF;
END //
DELIMITER ;


--aumentar estatura de mascotas 
DELIMITER //
CREATE PROCEDURE AumentarEstaturaMascotas(IN p_incremento FLOAT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE total INT;

    SELECT COUNT(*) INTO total FROM mascotas;

    WHILE i <= total DO
        UPDATE mascotas SET estatura = estatura + p_incremento WHERE ID = i;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;



-- clasificar mascota por estatura 
DELIMITER //
CREATE PROCEDURE ClasificarMascotas()
BEGIN
    SELECT nombre,
           estatura,
           IF(estatura >= 0.5, 'Alta', 'Baja') AS clasificacion
    FROM mascotas;
END //
DELIMITER ;




--contar clientes acrtivos 
DELIMITER //
CREATE PROCEDURE ContarClientesActivos(OUT p_total INT)
BEGIN
    SELECT COUNT(*) INTO p_total FROM clientes WHERE activo = 1;
END //
DELIMITER ;



-- actualizar mascotas
DELIMITER //
CREATE PROCEDURE ActualizarMascota(
    IN p_id INT,
    IN p_nombre VARCHAR(20),
    IN p_estatura FLOAT
)
BEGIN
    UPDATE mascotas
    SET nombre = p_nombre,
        estatura = p_estatura
    WHERE ID = p_id;
END //
DELIMITER ;

 

-- eliminar servicios por nombre 
DELIMITER //
CREATE PROCEDURE EliminarServicioPorNombre(IN p_nombre VARCHAR(50))
BEGIN
    IF NOT EXISTS(SELECT 1 FROM servicios WHERE nombre = p_nombre) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Servicio no existe';
    ELSE
        DELETE FROM servicios WHERE nombre = p_nombre;
    END IF;
END //
DELIMITER ;


-- listar mascotas por cliente 
DELIMITER //
CREATE PROCEDURE ListarMascotasPorCliente(IN p_idCliente INT)
BEGIN
    SELECT * FROM mascotas WHERE ID_Cliente = p_idCliente;
END //
DELIMITER ;



-- transferir mascota a otro cliente 
DELIMITER //
CREATE PROCEDURE TransferirMascota(
    IN p_idMascota INT,
    IN p_idNuevoCliente INT
)
BEGIN
    UPDATE mascotas SET ID_Cliente = p_idNuevoCliente WHERE ID = p_idMascota;
END //
DELIMITER ;



-- registrar multplis servicios 
DELIMITER //
CREATE PROCEDURE RegistrarMultiplesServicios(
    IN p_idMascota INT,
    IN p_listaServicios TEXT
)
BEGIN
    DECLARE idServicio INT;
    DECLARE fin INT DEFAULT 0;

    WHILE LENGTH(p_listaServicios) > 0 DO
        SET idServicio = SUBSTRING_INDEX(p_listaServicios, ',', 1);
        INSERT INTO mascota_servicio(ID_Mascota, ID_Servicio, fecha)
        VALUES (p_idMascota, idServicio, CURDATE());
        SET p_listaServicios = SUBSTRING(p_listaServicios, LENGTH(idServicio) + 2);
    END WHILE;
END //
DELIMITER ;
