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
