delimiter // 
create procedure incrementaSueldo(in id_profesor varchar(5), in procentaje 
decimal(5,2), inout nuevo_sueldo decimal(8,2)) 

begin
	-- Obtener sueldo actual
	select sueldo into nuevo_sueldo from profesor where ID = id_profesor;
	-- Actualizar sueldo
	set nuevo_sueldo = nuevo_sueldo*(1+(procentaje/100));
	-- Guardar en la tabla 
	update profesor set sueldo = nuevo_sueldo where ID = id_profesor;
end //
delimiter;
