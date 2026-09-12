DELIMITER //
CREATE TRIGGER before_delete_pedido
BEFORE DELETE ON pedido
FOR EACH ROW
BEGIN
        UPDATE inventario
        SET existencia = existencia + OLD.cantidad
        WHERE clave_producto = OLD.clave_producto;
END //
DELIMITER ;
