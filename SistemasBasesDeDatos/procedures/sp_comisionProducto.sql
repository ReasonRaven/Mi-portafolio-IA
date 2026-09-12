delimiter //
create procedure comisionProducto(in cve_producto varchar (5), out porcentaje decimal(5,2))
begin
     declare var_marca varchar(20);
     
     select marca into var_marca
     from PRODUCTO
     where cve_prod = cve_producto;
     
     case var_marca
          when 'INTEL' then
               set porcentaje = 10;
          when 'COMPAQ' then
               set porcentaje = 12;
          when 'SAMSUNG' then
               set porcentaje = 8;
          when 'CISCO' then
               set porcentaje = 8;
          when '3COM' then
               set porcentaje = 15;
          else
              set porcentaje = 5;
     end case;
end //
delimiter ;
