DELIMITER //
CREATE TRIGGER after_productos_update
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO historial_precios (clave_producto, precio_anterior, precio_nuevo)
        VALUES (OLD.clave, OLD.precio, NEW.precio);
    END IF;
END //
DELIMITER ;
