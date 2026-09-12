DELIMITER //

CREATE PROCEDURE asignaturasDistintasPorProfesor(
    IN p_semestre VARCHAR(9),
    IN p_año      NUMERIC(4,0)
)
BEGIN
    SELECT
        p.ID,
        p.nombre,
        p.nombre_dept,
        (
            SELECT COUNT(DISTINCT e.asignatura_id)
            FROM   enseña e
            WHERE  e.ID       = p.ID
              AND  e.semestre = p_semestre
              AND  e.año      = p_año
        ) AS asignaturas_impartidas
    FROM profesor p
    WHERE p.ID IN (
        SELECT e.ID
        FROM   enseña e
        WHERE  e.semestre = p_semestre
          AND  e.año      = p_año
    );
END //

DELIMITER ;
