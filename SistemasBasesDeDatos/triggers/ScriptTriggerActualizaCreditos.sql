DELIMITER //

CREATE TRIGGER actualiza_creditos
AFTER UPDATE ON matricula
FOR EACH ROW
BEGIN
    DECLARE creditos_asig NUMERIC(2,0);

    SET creditos_asig = (
        SELECT créditos
        FROM asignatura
        WHERE asignatura_id = NEW.asignatura_id
    );

    
    IF (OLD.nota IS NULL OR OLD.nota NOT IN ('C+','B-','B','B+','A-','A','A+'))
       AND (NEW.nota IN ('C+','B-','B','B+','A-','A','A+')) THEN

        UPDATE estudiante
        SET tot_créditos = tot_créditos + creditos_asig
        WHERE ID = NEW.ID;

    
    ELSEIF (OLD.nota IN ('C+','B-','B','B+','A-','A','A+'))
           AND (NEW.nota IS NULL OR NEW.nota NOT IN ('C+','B-','B','B+','A-','A','A+')) THEN

        UPDATE estudiante
        SET tot_créditos = tot_créditos - creditos_asig
        WHERE ID = NEW.ID;

    END IF;
END//

DELIMITER ;
