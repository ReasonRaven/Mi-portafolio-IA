DELIMITER //

CREATE TRIGGER resta_creditos
AFTER DELETE ON matricula
FOR EACH ROW
BEGIN
    DECLARE creditos_asig NUMERIC(2,0);

    
    IF OLD.nota IN ('C+','B-','B','B+','A-','A','A+') THEN

        SET creditos_asig = (
            SELECT créditos
            FROM asignatura
            WHERE asignatura_id = OLD.asignatura_id
        );

        UPDATE estudiante
        SET tot_créditos = tot_créditos - creditos_asig
        WHERE ID = OLD.ID;

    END IF;
END//

DELIMITER ;
