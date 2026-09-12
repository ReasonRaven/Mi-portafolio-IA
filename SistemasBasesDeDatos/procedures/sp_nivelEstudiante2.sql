delimiter //
create procedure nivelEstudiante2(
in id_estudiante varchar (5),
in id_asignatura varchar (8),
in id_secc varchar (8),
in var_semestre varchar (6),
in var_año numeric (4,0),
out nivel varchar (20)
)
begin
     declare calif varchar(2);
     
     select nota into calif
     from matricula
     where ID = id_estudiante and asignatura_id = id_asignatura and secc_id = id_secc and semestre = var_semestre and año = var_año;
     
     case
          when calif = 'A+' then
               set nivel = 'MENCIÓN HONORÍFICA';
          when calif = 'A' or calif = 'A-' then
               set nivel = 'SOBRESALIENTE';
          when calif = 'B+' or calif = 'B' or calif = 'B-' then
               set nivel = 'NOTABLE';
          when calif = 'C+' or calif = 'C' or calif = 'C-' then
               set nivel = 'APROBADO';
          else
              set nivel = 'REPROBADO';
     end case;
end //
delimiter ;
