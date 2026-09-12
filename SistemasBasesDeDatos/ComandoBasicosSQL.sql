DLista de comando básicos para MySQL

1. Entrar en MySQL
mysql -u root -p

2. Salir de MySQL
exit

3. Ver las bases de datos
show databases;

4. Crear base de datos
create database nombre;

5. Crear tabla
create table nombre (
cve_cajero int primary key,
name varchar(50)
);

6. Seleccionar una base de datos
use nombre base;

7. Ver tablas de la base datos
show tables;

8. Ver la estructura de una tabla
describe nombre_tabla;

9. Ver datos de una tabla
select * from nombre_tabla;

10. Borrar tabla: (Se puede eliminar una tabla si ésta no se encuentra en el lado “uno”
de cualquier relación, de lo contrario, el RDBMS va a generar un mensaje de error
indicando que ha ocurrido una violación de integridad de llave foránea.)
drop table nombre_tabla;

11. Borrar base de datos
drop database nombre_base;

12. Insertar datos 
insert into nombre_tabla values (‘valor’,’valor’,numero);

13. Buscar datos específicos
select nombre_campo from nombre_tabla;

14. Agregar el script a la base de datos
SOURCE ruta_del_archivo.sql;

15. Ver usuario actual
select user();

16. Ver versión de MySQL
select version();

17. Ver base de datos actual
select database();

18. Dentro del script para que no de el error de que haya tablas duplicadas
drop table if exists;  -esto va antes del create table-
create table ejemplo ();

19. Para ver todos los datos de una tabla
select * from nombre_tabla;

20. Para ver los datos de una tabla con condicion
select * from nombre_tabla where nombre_campo condicion 
-Ejemplo
select * from cajero where cve_cajero > 2;-

21. UPDATE SET Modificar datos en una tabla 
update nombre_de_tabla set nombre_de_columna = expresion 
-Ejemplo UPDATE:
update profesor SET sueldo = sueldo * 1.05 where sueldo < 70000;-

22. DELETE Eliminar renglones de tabla
delete from nombre_de_tabla 
-Ejemplo DELETE:
DELETE from profesor where nombre_dept = 'Finanzas'

23. Operadores logicos AND, OR, NOT
-Ejemplo OR:
select nombre from profesor where nombre_dep t= 'Finanzas' or nombre_dept = 'Historia';-
-Ejemplo AND:
select nombre from profesor where nombre_dept = 'Informatica' and sueldo > 65000;

24. Operadores especiales BETWEEN, IS NULL, LIKE,IN, EXISTS
25. BETWEEN: (Se usa para verificar si un valor de atributo está dentro de un margen)
-Ejemplo sin BETWEEN: 
select nombre from profesor where sueldo >= 90000 and sueldo <= 1000000;-
-Ejemplo BETWEEN:
select nombre from profesor where sueldo BETWEEN 90000 and 1000000;-

26. IS NULL: (Se usa para verificar si un valor de atributo es nulo)
-Ejemplo IS NULL:
select nombre from profesor where sueldo IS NULL;-

27. LIKE:
'Intro%' coincide con cualquier cadena de caracteres que EMPIECE con "Intro"
'%Infor%' coincide con cualquier cadena que contenga "Infor" como subcadena como 
por Ejemplo 'Intro. a la Informatica' 
'_ _ _' coincide con cualquier cadena que tenga excatamente tres caracteres
'_ _ _%' coincide con cualquier cadena que tenga, al menos tres caracteres
-Ejemplo LIKE '%%':
select nombre from profesor where nombre like '%an%';-
-Ejemplo LIKE '%':
select nombre_dept from departamento where edificio like 'P%';-

28. IN que es el OR: (Muchas consultas que requerirían el uso de la lógica OR se pueden
manejar con más facilidad con ayuda del operador especial IN) 
-Ejemplo OR:
select nombre from profesor where nombre_dept = 'Finanzas' or nombre_dept = 'Historia';-
-Ejemplo IN:
select nombre from profesor where nombre_dept in('Finanzas','Historia');-

29. EXISTS: (Se usa para verificar si una subconsulta entrega algunos renglones)
-Ejemplo EXISTS: (Encontrar todas las asignaturas que se enseñaron tanto en el semestre
de otoño de 2009 como en el semestre de primavera de 2010)
select asignatura_id from sección S where semestre = 'Otoño' and año = 2009 and 
exists(select * from sección T where semestre = 'Primavera' and año = 2010 and 
S.asignatura_id = T.asignatura_id);.

30. AS (RENOMBRANDO)
nombre_anterior as nombre_nuevo
-Ejemplo AS
select nombre as nombre_profesor, asignatura_id from profesor, enseña where profesor.ID
= enseña.ID;-
-Ejemplo: (Para todos los profesores de la universidad que hayan enseñado alguna
asignatura, encontrar sus nombres y las asignatura_id de todas las asignaturas que
hayan enseñado)
select T.nombre, S.asignatura_id from profesor as T, enseña as S where T.ID = S.ID;-

31. ORDER BY: (Ordenar una lista)
select lista_de_columna from lista_de_tabla where lista_condiciones ORDER BY 
lista_de_columna asc | desc;
-Ejemplo ORDER BY
select nombre from profesor where nombre_dept = 'Fisica' ORDER BY nombre;-
-Ejemplo ORDER BY DESC ASC
select * from profesor ORDER BY sueldo desc, nombre asc;-

32. AVG: (Promedio, Encontrar el sueldo medio de los profesores del departamento de
Informática)
-Ejemplo AVG: 
select AVG(sueldo) from profesor where nombre_dept = 'Informática';
-Ejemplo AVG con AS:
select AVG(sueldo) as sueldo_promedio from profesor where nombre_dept = 'Informatica';

33. Count() (Recuento, Encontrar el número total de profesores que enseñaron alguna
asignatura en el semestre de primavera de 2010)
-Ejemplo: COUNT() y DISTINCT
select COUNT(DISTINCT ID) from enseña where semestre = 'Primavera' and año = 2010;
(aunque un profesor enseñe más de una asignatura solo se contabiliza una vez en el
resultado.)
-Ejemplo COUNT(*) (para contar el número de tuplas de una relación):
select COUNT(*) from asignatura;

34. MAX: (El sueldo más alto (el sueldo máximo) de la tabla profesor)
-Ejemplo MAX:
select MAX(sueldo) from profesor;
(Encontrar el profesor que tiene el sueldo más alto)
-Ejemplo MAX:
select nombre from profesor where sueldo = (select MAX(sueldo) from profesor);
(Una consulta con una subconsulta, La consulta interior (subconsulta), que se
ejecuta primero, La consulta exterior, que se ejecuta al último.)

35. MIN: (El sueldo más bajo (el sueldo mínimo) de la tabla profesor)
-Ejemplo MIN:
select MIN(sueldo) from profesor;

36. SUM: (Calcula la suma total para cualquier atributo especificado)
-Ejemplo SUM:
select SUM(sueldo) from profesor;

37. GROUP BY: Siempre se utiliza con las funciones de agregacion que son las de SUM,MAX,AVR y todas esas
(Las tuplas con el mismo valor en todos los atributos en la cláusula
GROUP BY se sitúan en un grupo) (Osea que la columna seleccionada si n filas son las
mismas entonces las agrupa juntas una seguida de otra) 
(Encontrar el sueldo medio de cada departamento)
-Ejemplo GROUP BY:
select nombre_dept, avg(sueldo) from profesor GROUP BY nombre_dept;

(Encontrar el número de profesores de cada departamento que enseñó una asignatura
en el semestre de primavera de 2010)
-Ejemplo:
select nombre_dept, count(disticnt a.id) as profesores from profesor a, enseña b where
a.ID = b.ID and semestre = 'Primavera' and año 2010 group by nombre_dept;

38. Stored Procedures (Un procedimiento almacenado es un conjunto de
enunciados procedimentales de SQL que tiene
un nombre. Los procedimientos almacenados
se almacenan en la base de datos.)
 
Sintaxis basica:

create procedure
	nombre_procedimiento(lista_de_parámetros)
begin
	instrucciones;
end;

-Ejemplo de CREATE PROCEDURE:
Las siguientes instrucciones crean un
procedimiento almacenado llamado
muestraProfesores():

delimiter //
create procedure muestraProfesores()
begin
	select * from profesor;
end //
delimiter ;

39. CALL (Ejecutar un procedimiento almacenado)
call nombre_procedimiento(lista_de_parámetros);

40. Parametros En Procedimientos Almacenados

Un parámetro en un procedimiento almacenado
tiene uno de los tres modos: IN, OUT, o
INOUT

41. IN (Es el modo predeterminado. El programa de
llamada debe pasar un argumento al
procedimiento almacenado.) 

42. OUT (El valor de un parámetro OUT se puede
modificar dentro del procedimiento
almacenado, y su valor actualizado se pasa de
vuelta al programa de llamada.)

43. INOUT (Una parámetro INOUT es una combinación de
IN y OUT. Esto significa que el programa de
llamada puede pasar el argumento, y el
procedimiento almacenado puede modificar el
parámetro INOUT y pasar el nuevo valor de
nuevo al programa de llamada.)

44. Resumen de IN,OUT,INOUT

IN: solo entrada (valor que recibe el
procedimiento).

OUT: solo salida (el procedimiento asigna un
valor que se devuelve).

INOUT: entrada y salida (recibe un valor y
puede modificarlo).

45. Sintaxis basica:

[IN | OUT | INOUT] nombre_parametro
tipo_de_dato[(longitud)]

-Ejemplo: (El siguiente procedimiento almacenado
devuelve una tabla que contiene todos los
profesores de un determinado departamento.)

delimiter //
create procedure profesoresDepartamento(in
departamento varchar(20))
begin
	select ID, nombre, sueldo from profesor
	where nombre_dept = departamento;
end //
delimiter ;

-Ejemplo: (El siguiente procedimiento almacenado
devuelve el número de profesores del
departamento que recibe como parámetro.)

delimiter //
create procedure cuentaProfesoresDep(in
departamento varchar(20), out profesores int)
begin
	select count(*) into profesores from profesor
	where nombre_dept = departamento;
end //
delimiter ;

call cuentaProfesoresDep(‘Informática’, @total);
select @total;

-Ejemplo: (El siguiente procedimiento almacenado eleva al
cuadrado la variable que recibe como
parámetro.)

delimiter //
create procedure alCuadrado(inout numero int)
begin
	Set numero = numero*numero;
end //
delimiter ;

set @x = 5;
call alCuadrado(@x);
select @x;

-Ejemplo: (El siguiente procedimiento almacenado
incrementa el sueldo de un profesor en un
porcentaje determinado.)

delimiter //
create procedure incrementaSueldo(in id_profesor varchar(5),
in porcentaje decimal(5,2),
inout nuevo_sueldo decimal(8,2))

begin
	-- Obtener sueldo actual
	select sueldo into nuevo_sueldo from profesor where ID = id_profesor;
	-- Actualizar sueldo
	set nuevo_sueldo = nuevo_sueldo*(1+(porcentaje/100));
	-- Guardar en la tabla
	update profesor set sueldo = nuevo_sueldo where ID = id_profesor;
end //
delimiter ;

(Por ejemplo, si queremos incrementar en 12% el
sueldo del profesor con ID ‘10101’, llamamos
al procedimiento almacenado anterior de la
siguiente forma:)

call incrementaSueldo('10101',12,@nuevo);
select @nuevo;

46. Variables en Procedimientos Almacenados

(Una variable es un objeto de datos con nombre
cuyo valor puede cambiar durante la ejecución
de un procedimiento almacenado.
Estas variables son locales al procedimiento
almacenado y antes de usar una variable, debe
ser declarada.)

Sintaxis: (Para declarar una variable dentro de un
procedimiento almacenado se utiliza
DECLARE de la siguiente manera:)

DECLARE nombre_variable tipo_de_dato[(longitud)] [DEFAULT 
valor_default];

En primer lugar se especifica el nombre de la
variable después de la palabra clave
DECLARE.
En segundo lugar se define el tipo de dato y la
longitud de la variable.
En tercer lugar se asigna un valor
predeterminado a la variable utilizando la
opción DEFAULT. Si declara una variable sin
especificar un valor predeterminado, su valor
predeterminado es NULL.

-Ejemplo (El siguiente ejemplo declara una variable
llamada Importe con el tipo de dato
decimal(10,2) y el valor por defecto de 0.0.)

DECLARE Importe decimal(10,2) DEFAULT 0.0;

47. SET (Asignar valor a una variable)

Sintaxis:

SET nombre_variable = valor;

-Ejemplo:
DECLARE total INT DEFAULT 0;
SET total = 10;

Además de SET, se puede utilizar SELECT
INTO para asignar el resultado de una consulta
a una variable como se muestra en el siguiente
ejemplo:

DECLARE cant_productos INT DEFAULT 0;
SELECT COUNT(*)
INTO cant_productos
FROM productos;

El siguiente ejemplo ilustra cómo declarar y
utilizar una variable en un procedimiento
almacenado:

delimiter //
create procedure totalProfesores()
begin
	declare n_profesores int default 0;
	select count(*) into n_profesores from profesor;
	select n_profesores;
end //
delimiter ;


48. IF's

49. IF...THEN (Evalúa una condición y ejecuta un
bloque de código si la condición es
verdadera.)

50.IF...THEN...ELSE: (Evalúa una condición y
ejecute un bloque de código si la condición
es verdadera; de lo contrario, ejecute otro
bloque de código.)

51. IF...THEN...ELSEIF...ELSE: (Evalúa
múltiples condiciones y ejecuta un bloque
de código si una condición es verdadera. Si
todas las condiciones son falsas, ejecuta el
bloque de código en la rama ELSE.)

-Ejemplo SINTAXIS:

IF condición THEN
instrucciones;
END IF; 
--

En primer lugar, se define una condición para
ejecutar el código entre IF...THEN y END IF.
Si la condición es verdadera, se ejecutan las
instrucciones entre IF-THEN y END IF. De lo
contrario, el control se pasa a la siguiente
instrucción después de END IF.

En segundo lugar, se especifica el código que se
ejecutará si la condición se evalúa como
verdadera.


MySQL no tiene un tipo de datos booleano. En
cambio, utiliza TINYINT(1) para representar
el tipo de datos BOOLEAN.

Para hacerlo más conveniente a la hora de
definir un atributo booleano, MySQL ofrece
BOOLEAN o BOOL como sinónimo de
TINYINT(1).

El siguiente procedimiento almacenado cuenta
el número de estudiantes inscritos en una
sección de una asignatura para un semestre y
año determinados; si aún hay cupo en el aula
correspondiente, regresa verdadero (1), de lo
contrario regresa falso (0).

delimiter //
create procedure cupoDisponible(
in id_asignatura varchar (8),
in id_secc varchar (8),
in var_semestre varchar (6),
in var_año numeric (4,0),
out cupo bool
)
begin
	declare inscritos int;
	declare límite int;
	-- Inicializamos cupo como falso
	set cupo = false;
	select count(*) into inscritos
	from matricula
	where asignatura_id = id_asignatura and secc_id = id_secc and
		semestre = var_semestre and año = var_año;
	select capacidad into límite
	from aula a, sección b
	where b.edificio = a.edificio and b.número_aula = a.número_aula and
		asignatura_id = id_asignatura and secc_id = id_secc and
		semestre = var_semestre and año = var_año;
	-- Si el número de inscritos es menor al límite permitido en el aula,
	-- asignamos verdadero a cupo
	if inscritos<límite then
		set cupo = true;
	end if;
end //
delimiter ;

Ejemplo de la sintaxis de la instrucción
IF...THEN...ELSE:
IF condición THEN
	instrucciones;
ELSE
	instrucciones-else;
END IF;

En esta sintaxis, si la condición se evalúa como
verdadera, se ejecutan las instrucciones entre
IF...THEN y ELSE. De lo contrario, se
ejecutan las instrucciones entre ELSE y END
IF.



En resumen:
Usar IF...THEN para ejecutar condicionalmente
un bloque de instrucciones con base en la
evaluación de una condición especificada.

Usar IF...THEN...ELSE para ejecutar un bloque
de instrucciones si una condición especificada
es verdadera y un bloque alternativo de
instrucciones si la condición es falsa.

Usar IF...THEN...ELSEIF...ELSE para evaluar
múltiples condiciones secuencialmente y
ejecutar bloques correspondientes de
instrucciones con base en la primera condición
verdadera, con un bloque opcional de
instrucciones para ejecutar si ninguna de las
condiciones es verdadera.
