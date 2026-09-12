DELIMITER //
CREATE TRIGGER after_delete_productos
AFTER DELETE ON productos
FOR EACH ROW
BEGIN
        INSERT INTO descontinuados (clave, producto, fecha)
        VALUES (OLD.clave, OLD.producto, CURRENT_TIMESTAMP);
END //
DELIMITER ;
