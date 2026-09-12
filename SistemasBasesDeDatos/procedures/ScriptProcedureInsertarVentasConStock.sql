DELIMITER //

CREATE PROCEDURE insertarVentasConStock(
    IN p_n         INT,
    IN p_cve_clie  VARCHAR(5),
    IN p_cve_prod1 NUMERIC(4),
    IN p_cve_prod2 NUMERIC(4)
)
BEGIN
    DECLARE v_i         INT DEFAULT 1;
    DECLARE v_num_venta INT;
    DECLARE v_exist1    NUMERIC(3);
    DECLARE v_exist2    NUMERIC(3);
    DECLARE v_precio1   NUMERIC(10,2);
    DECLARE v_precio2   NUMERIC(10,2);

    ciclo: LOOP

        IF v_i > p_n THEN
            LEAVE ciclo;
        END IF;

        SELECT EXISTENCIA, PRECIO_VENTA
        INTO   v_exist1, v_precio1
        FROM   PRODUCTO
        WHERE  CVE_PROD = p_cve_prod1;

        SELECT EXISTENCIA, PRECIO_VENTA
        INTO   v_exist2, v_precio2
        FROM   PRODUCTO
        WHERE  CVE_PROD = p_cve_prod2;

        IF v_exist1 >= 1 AND v_exist2 >= 1 THEN

            IF (SELECT COUNT(*) FROM VENTA) = 0 THEN
                SET v_num_venta = 1;
            ELSE
                SELECT MAX(NUM_VENTA) + 1
                INTO   v_num_venta
                FROM   VENTA;
            END IF;

            INSERT INTO VENTA (NUM_VENTA, CVE_CLIE, FECHA_VENTA)
            VALUES (v_num_venta, p_cve_clie, CURDATE());

            INSERT INTO DET_VENTA (NUM_VENTA, CVE_PROD, CANTIDAD, PRECIO_UNITARIO)
            VALUES (v_num_venta, p_cve_prod1, 1, v_precio1);

            INSERT INTO DET_VENTA (NUM_VENTA, CVE_PROD, CANTIDAD, PRECIO_UNITARIO)
            VALUES (v_num_venta, p_cve_prod2, 1, v_precio2);

            UPDATE PRODUCTO SET EXISTENCIA = EXISTENCIA - 1 WHERE CVE_PROD = p_cve_prod1;
            UPDATE PRODUCTO SET EXISTENCIA = EXISTENCIA - 1 WHERE CVE_PROD = p_cve_prod2;

        END IF;

        SET v_i = v_i + 1;

    END LOOP ciclo;

END//

DELIMITER ;

