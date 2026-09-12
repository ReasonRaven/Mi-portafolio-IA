DELIMITER //
CREATE TRIGGER before_clientes_update
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN 
    -- Si el descuento es menor a 0 o mayor a 100, lo pone en cero
    IF NEW.porcentaje_descuento < 0 OR NEW.porcentaje_descuento > 100 THEN
        SET NEW.porcentaje_descuento = OLD.porcentaje_descuento;
    END IF;
END //
DELIMITER ;
