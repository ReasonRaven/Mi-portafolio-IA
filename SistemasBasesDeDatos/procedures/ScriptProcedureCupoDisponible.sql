delimiter //

create procedure cupoDisponible(
    in p_id_asignatura varchar(8),
    in p_id_secc varchar(8),
    in p_semestre varchar(10),
    in p_año numeric(4,0),
    out p_lugares_disponibles int
)
begin
    declare inscritos int;
    declare limite int;

    select count(*) into inscritos
    from matricula
    where asignatura_id = p_id_asignatura
      and secc_id = p_id_secc
      and semestre = p_semestre
      and año = p_año;

    select a.capacidad into limite
    from aula a, sección s
    where s.edificio = a.edificio
      and s.número_aula = a.número_aula
      and s.asignatura_id = p_id_asignatura
      and s.secc_id = p_id_secc
      and s.semestre = p_semestre
      and s.año = p_año;

    set p_lugares_disponibles = limite - inscritos;

    if p_lugares_disponibles < 0 then
        set p_lugares_disponibles = 0;
    end if;
end //

delimiter ;
