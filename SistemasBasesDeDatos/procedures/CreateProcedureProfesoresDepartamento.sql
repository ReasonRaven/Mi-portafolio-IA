delimiter // 
create procedure profesoresDepartamento(in departamento varchar(20)) 
begin 
	select ID,nombre,sueldo from profesor
	where nombre_dept = departamento;
end //
delimiter ;
