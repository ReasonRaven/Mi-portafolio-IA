delimiter //
create procedure cuentaProfesoresDep(in departamento varchar(20), out 
profesores int)
begin 
	select count(*) into profesores from profesor where nombre_dept = 
	departamento;
end //
delimiter;
