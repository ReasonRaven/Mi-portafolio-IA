DELIMITER //

CREATE PROCEDURE productoMasVendido(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin    DATE
)
BEGIN
    SELECT
        p.CVE_PROD,
        p.PRODUCTO,
        p.MARCA,
        (
            SELECT SUM(d.CANTIDAD)
            FROM   DET_VENTA d
            WHERE  d.CVE_PROD  = p.CVE_PROD
              AND  d.NUM_VENTA IN (
                       SELECT v.NUM_VENTA
                       FROM   VENTA v
                       WHERE  v.FECHA_VENTA BETWEEN p_fecha_inicio AND p_fecha_fin
                   )
        ) AS cant_vendida
    FROM PRODUCTO p
    WHERE (
        SELECT SUM(d.CANTIDAD)
        FROM   DET_VENTA d
        WHERE  d.CVE_PROD  = p.CVE_PROD
          AND  d.NUM_VENTA IN (
                   SELECT v.NUM_VENTA
                   FROM   VENTA v
                   WHERE  v.FECHA_VENTA BETWEEN p_fecha_inicio AND p_fecha_fin
               )
    ) = (
        SELECT MAX(total)
        FROM (
            SELECT SUM(d2.CANTIDAD) AS total
            FROM   DET_VENTA d2
            WHERE  d2.NUM_VENTA IN (
                       SELECT v2.NUM_VENTA
                       FROM   VENTA v2
                       WHERE  v2.FECHA_VENTA BETWEEN p_fecha_inicio AND p_fecha_fin
                   )
            GROUP BY d2.CVE_PROD
        ) AS totales
    );
END //

DELIMITER ;
