-- Ajusta progresivamente los precios de los productos de la marca que recibe como parámetro,
-- reduciéndolos de forma iterativa hasta un valor objetivo calculado según el tipo de producto,
-- aplicando descuentos variables dependiendo de la distancia del precio en cada iteración al precio objetivo.
delimiter //
create procedure descuentoSegmentado(in param_marca varchar (20))
begin
    declare prod int default 1;
    declare max_prod int;
    declare precio decimal(10,2);
    declare tipo varchar(20);
    declare var_marca varchar(20);
    declare objetivo decimal(10,2);
    declare existe int;

    select max(cve_prod) into max_prod from PRODUCTO;

    while prod <= max_prod do 
        -- Verifica si la clave de producto prod existe en la tabla producto
        select count(*) into existe
        from PRODUCTO
        where cve_prod = prod;

        if existe > 0 then
            select precio_venta, producto, marca
            into precio, tipo, var_marca
            from PRODUCTO
            where cve_prod = prod;

            if var_marca = param_marca then
               case
                   when tipo like 'DISCO%' then
                        -- El objetivo es aplicar aproximadamente un 20% de descuento a todos los discos de la marca
                        set objetivo = precio * 0.80;
                   when tipo like 'MONITOR%' then
                        -- El objetivo es aplicar aproximadamente un 30% de descuento a todos los monitores de la marca
                        set objetivo = precio * 0.70;
                   else
                       -- El objetivo es aplicar aproximadamente un 25% de descuento a todos los otros productos de la marca
                       set objetivo = precio * 0.75;
               end case;

               -- Ajuste progresivo, reduce el precio calculado mientras siga estando por arriba del precio objetivo
               while precio > objetivo do
                     case
                         -- Si el precio está 50% arriba del precio objetivo, lo reduce en un 10%
                         when precio > objetivo * 1.5 then
                              set precio = precio * 0.90;
                         -- Si el precio está 20% arriba del precio objetivo, lo reduce en un 5%
                         when precio > objetivo * 1.2 then
                              set precio = precio * 0.95;
                         -- En cualquier otro caso reduce el precio en un 2%
                         else
                             set precio = precio * 0.98;
                     end case;

                     -- Cambia el precio de venta del producto en la tabla PRODUCTO al nuevo precio calculado
                     update PRODUCTO
                     set precio_venta = precio
                     where cve_prod = prod;
               end while;
            end if;
        end if;

        set prod = prod + 1;

    end while;
end //
delimiter ;
