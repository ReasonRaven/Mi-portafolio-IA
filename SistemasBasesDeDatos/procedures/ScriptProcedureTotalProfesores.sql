delimiter //
create procedure totalProfesores()
begin 
	declare n_profesores int default 0;
	select count(*) into n_profesores from profesor;
	select n_profesores;
end //
delimiter ;
