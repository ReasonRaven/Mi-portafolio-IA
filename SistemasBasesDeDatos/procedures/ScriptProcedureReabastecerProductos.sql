DELIMITER //

CREATE PROCEDURE reabastecerProductos(IN p_min INT)
BEGIN
    DECLARE v_cve_prod   NUMERIC(4);
    DECLARE v_existencia NUMERIC(3);
    DECLARE v_cve_prov   VARCHAR(5);
    DECLARE v_cantidad   INT;

    SET v_cve_prod = 0;

    WHILE (
        SELECT COUNT(*)
        FROM   PRODUCTO
        WHERE  CVE_PROD   > v_cve_prod
        AND    EXISTENCIA < p_min
        AND    CVE_PROD   IN (SELECT CVE_PROD FROM PROV_PROD)
    ) > 0 DO

        SELECT CVE_PROD, EXISTENCIA
        INTO   v_cve_prod, v_existencia
        FROM   PRODUCTO
        WHERE  CVE_PROD = (
                   SELECT MIN(CVE_PROD)
                   FROM   PRODUCTO
                   WHERE  CVE_PROD   > v_cve_prod
                   AND    EXISTENCIA < p_min
                   AND    CVE_PROD   IN (SELECT CVE_PROD FROM PROV_PROD)
               );

        SELECT MIN(CVE_PROV)
        INTO   v_cve_prov
        FROM   PROV_PROD
        WHERE  CVE_PROD     = v_cve_prod
        AND    PRECIO_COSTO = (
                   SELECT MIN(PRECIO_COSTO)
                   FROM   PROV_PROD
                   WHERE  CVE_PROD = v_cve_prod
               );

        SET v_cantidad = (p_min + 2) - v_existencia;

        INSERT INTO ORDEN_COMPRA (CVE_PROV, CVE_PROD, CANTIDAD)
        VALUES (v_cve_prov, v_cve_prod, v_cantidad);

    END WHILE;

END//

DELIMITER ;

