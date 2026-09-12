create table aula
       (edificio varchar (15),
        número_aula varchar (7),
        capacidad numeric (4,0),
        primary key (edificio, número_aula));

create table departamento
       (nombre_dept varchar (20),
        edificio varchar (15),
        presupuesto numeric (12,2) check (presupuesto > 0),
        primary key (nombre_dept));

create table asignatura
       (asignatura_id varchar (7),
        nombre varchar (50),
        nombre_dept varchar (20),
        créditos numeric (2,0) check (créditos > 0),
        primary key (asignatura_id),
        foreign key (nombre_dept) references departamento);

create table profesor
       (ID varchar (5),
        nombre varchar (20) not null,
        nombre_dept varchar (20),
        sueldo numeric (8,2) check (sueldo > 29000),
        primary key (ID),
        foreign key (nombre_dept) references departamento);

create table sección
       (asignatura_id varchar (8),
        secc_id varchar (8),
        semestre varchar (9) check (semestre in ('Otoño','Invierno','Primavera','Verano')),
        año numeric (4,0) check (año > 1759 and año <2100),
        edificio varchar (15),
        número_aula varchar (7),
        franja_horaria_id varchar (4),
        primary key (asignatura_id, secc_id, semestre, año),
        foreign key (asignatura_id) references asignatura,
        foreign key (edificio, número_aula) references aula);

create table enseña
       (ID varchar (5),
        asignatura_id varchar (8),
        secc_id varchar (8),
        semestre varchar (9),
        año numeric (4,0),
        primary key (ID, asignatura_id, secc_id, semestre, año),
        foreign key (asignatura_id, secc_id, semestre, año) references sección,
        foreign key (ID) references profesor);

create table prerreq
       (asignatura_id varchar (7),
        prerreq_id varchar (7),
        primary key (asignatura_id, prerreq_id),
        foreign key (asignatura_id) references asignatura,
        foreign key (prerreq_id) references asignatura(asignatura_id));

create table estudiante
       (ID varchar (5),
        nombre varchar (20) not null,
        nombre_dept varchar (20),
        tot_créditos numeric (3,0) default 0,
        primary key (ID),
        foreign key (nombre_dept) references departamento);

create table matricula
       (ID varchar (5),
        asignatura_id varchar (8),
        secc_id varchar (8),
        semestre varchar (9),
        año numeric (4,0),
        nota varchar (2),
        primary key (ID, asignatura_id, secc_id, semestre, año),
        foreign key (asignatura_id, secc_id, semestre, año) references sección,
        foreign key (ID) references estudiante);

create table tutor
       (e_ID varchar (5),
        p_ID varchar (5),
        primary key (e_ID),
        foreign key (p_ID) references profesor (ID),
        foreign key (e_ID) references estudiante (ID));

create table franjahoraria
       (franja_horaria_id varchar (4),
        día varchar (1) check (día in ('L', 'M', 'X', 'J', 'V', 'S', 'D')),
        hora_inicio time,
        hora_fin time,
        primary key (franja_horaria_id, día, hora_inicio));

insert into aula values ('Packard','101',500);
insert into aula values ('Painter','514',10);
insert into aula values ('Taylor','3128',70);
insert into aula values ('Watson','100',30);
insert into aula values ('Watson','120',50);

insert into departamento values ('Biología','Watson',90000);
insert into departamento values ('Informática','Taylor',100000);
insert into departamento values ('Electrónica','Taylor',85000);
insert into departamento values ('Finanzas','Painter',120000);
insert into departamento values ('Historia','Painter',50000);
insert into departamento values ('Música','Packard',80000);
insert into departamento values ('Física','Watson',70000);

insert into asignatura values ('BIO-101','Introducción a la Biología','Biología',4);
insert into asignatura values ('BIO-301','Genética','Biología',4);
insert into asignatura values ('BIO-399','Biología computacional','Biología',3);
insert into asignatura values ('CS-101','Introducción a la Informática','Informática',4);
insert into asignatura values ('CS-190','Diseño de juegos','Informática',4);
insert into asignatura values ('CS-315','Robótica','Informática',3);
insert into asignatura values ('CS-319','Procesado de imágenes','Informática',3);
insert into asignatura values ('CS-347','Fundamentos de bases de datos','Informática',3);
insert into asignatura values ('EE-181','Intro. a los sistemas digitales','Electrónica',3);
insert into asignatura values ('FIN-201','Banca de inversión','Finanzas',3);
insert into asignatura values ('HIS-351','Historia mundial','Historia',3);
insert into asignatura values ('MU-199','Producción de música y vídeo','Música',3);
insert into asignatura values ('PHY-101','Fundamentos de Física','Física',4);

insert into profesor values (10101,'Srinivasan','Informática',65000);
insert into profesor values (12121,'Wu','Finanzas',90000);
insert into profesor values (15151,'Mozart','Música',40000);
insert into profesor values (22222,'Einstein','Física',95000);
insert into profesor values (32343,'El Said','Historia',60000);
insert into profesor values (33456,'Gold','Física',87000);
insert into profesor values (45565,'Katz','Informática',75000);
insert into profesor values (58583,'Califieri','Historia',62000);
insert into profesor values (76543,'Singh','Finanzas',80000);
insert into profesor values (76766,'Crick','Biología',72000);
insert into profesor values (83821,'Brandt','Informática',92000);
insert into profesor values (98345,'Kim','Electrónica',80000);

insert into sección values ('BIO-101','1','Verano',2009,'Painter','514','B');
insert into sección values ('BIO-301','1','Verano',2010,'Painter','514','A');
insert into sección values ('CS-101','1','Otoño',2009,'Packard','101','H');
insert into sección values ('CS-101','1','Primavera',2010,'Packard','101','F');
insert into sección values ('CS-190','1','Primavera',2009,'Taylor','3128','E');
insert into sección values ('CS-190','2','Primavera',2009,'Taylor','3128','A');
insert into sección values ('CS-315','1','Primavera',2010,'Watson','120','D');
insert into sección values ('CS-319','1','Primavera',2010,'Watson','100','B');
insert into sección values ('CS-319','2','Primavera',2010,'Taylor','3128','C');
insert into sección values ('CS-347','1','Otoño',2009,'Taylor','3128','A');
insert into sección values ('EE-181','1','Primavera',2009,'Taylor','3128','C');
insert into sección values ('FIN-201','1','Primavera',2010,'Packard','101','B');
insert into sección values ('HIS-351','1','Primavera',2010,'Painter','514','C');
insert into sección values ('MU-199','1','Primavera',2010,'Packard','101','D');
insert into sección values ('PHY-101','1','Otoño',2009,'Watson','100','A');

insert into enseña values ('10101','CS-101','1','Otoño',2009);
insert into enseña values ('10101','CS-315','1','Primavera',2010);
insert into enseña values ('10101','CS-347','1','Otoño',2009);
insert into enseña values ('12121','FIN-201','1','Primavera',2010);
insert into enseña values ('15151','MU-199','1','Primavera',2010);
insert into enseña values ('22222','PHY-101','1','Otoño',2009);
insert into enseña values ('32343','HIS-351','1','Primavera',2010);
insert into enseña values ('45565','CS-101','1','Primavera',2010);
insert into enseña values ('45565','CS-319','1','Primavera',2010);
insert into enseña values ('76766','BIO-101','1','Verano',2009);
insert into enseña values ('76766','BIO-301','1','Verano',2010);
insert into enseña values ('83821','CS-190','1','Primavera',2009);
insert into enseña values ('83821','CS-190','2','Primavera',2009);
insert into enseña values ('83821','CS-319','2','Primavera',2010);
insert into enseña values ('98345','EE-181','1','Primavera',2009);

insert into prerreq values ('BIO-301','BIO-101');
insert into prerreq values ('BIO-399','BIO-101');
insert into prerreq values ('CS-190','CS-101');
insert into prerreq values ('CS-315','CS-101');
insert into prerreq values ('CS-319','CS-101');
insert into prerreq values ('CS-347','CS-101');
insert into prerreq values ('EE-181','PHY-101');

insert into estudiante values ('00128','Zhang','Informática',102);
insert into estudiante values ('12345','Shankar','Informática',32);
insert into estudiante values ('19991','Brandt','Historia',80);
insert into estudiante values ('23121','Chávez','Finanzas',110);
insert into estudiante values ('44553','Peltier','Física',56);
insert into estudiante values ('45678','Levy','Física',46);
insert into estudiante values ('54321','Williams','Informática',54);
insert into estudiante values ('55739','Sánchez','Música',38);
insert into estudiante values ('70557','Snow','Física',0);
insert into estudiante values ('76543','Brown','Informática',58);
insert into estudiante values ('76653','Aoi','Electrónica',60);
insert into estudiante values ('98765','Bourikas','Electrónica',98);
insert into estudiante values ('98988','Tanaka','Biología',120);

insert into matricula values ('00128','CS-101','1','Otoño',2009,'A');
insert into matricula values ('00128','CS-347','1','Otoño',2009,'A-');
insert into matricula values ('12345','CS-101','1','Otoño',2009,'C');
insert into matricula values ('12345','CS-190','2','Primavera',2009,'A');
insert into matricula values ('12345','CS-315','1','Primavera',2010,'A');
insert into matricula values ('12345','CS-347','1','Otoño',2009,'A');
insert into matricula values ('19991','HIS-351','1','Primavera',2010,'B');
insert into matricula values ('23121','FIN-201','1','Primavera',2010,'C+');
insert into matricula values ('44553','PHY-101','1','Otoño',2009,'B-');
insert into matricula values ('45678','CS-101','1','Otoño',2009,'F');
insert into matricula values ('45678','CS-101','1','Primavera',2010,'B+');
insert into matricula values ('45678','CS-319','1','Primavera',2010,'B');
insert into matricula values ('54321','CS-101','1','Otoño',2009,'A-');
insert into matricula values ('54321','CS-190','2','Primavera',2009,'B+');
insert into matricula values ('55739','MU-199','1','Primavera',2010,'A-');
insert into matricula values ('76543','CS-101','1','Otoño',2009,'A');
insert into matricula values ('76543','CS-319','2','Primavera',2010,'A');
insert into matricula values ('76653','EE-181','1','Primavera',2009,'C');
insert into matricula values ('98765','CS-101','1','Otoño',2009,'C-');
insert into matricula values ('98765','CS-315','1','Primavera',2010,'B');
insert into matricula values ('98988','BIO-101','1','Verano',2009,'A');
insert into matricula values ('98988','BIO-301','1','Verano',2010,null);

insert into tutor values ('00128','45565');
insert into tutor values ('12345','10101');
insert into tutor values ('23121','76543');
insert into tutor values ('44553','22222');
insert into tutor values ('45678','22222');
insert into tutor values ('76543','45565');
insert into tutor values ('76653','98345');
insert into tutor values ('98765','98345');
insert into tutor values ('98988','76766');

insert into franjahoraria values ('A','L','8:00','8:50');
insert into franjahoraria values ('A','X','8:00','8:50');
insert into franjahoraria values ('A','V','8:00','8:50');
insert into franjahoraria values ('B','L','9:00','9:50');
insert into franjahoraria values ('B','X','9:00','9:50');
insert into franjahoraria values ('B','V','9:00','9:50');
insert into franjahoraria values ('C','L','11:00','11:50');
insert into franjahoraria values ('C','X','11:00','11:50');
insert into franjahoraria values ('C','V','11:00','11:50');
insert into franjahoraria values ('D','L','13:00','13:50');
insert into franjahoraria values ('D','X','13:00','13:50');
insert into franjahoraria values ('D','V','13:00','13:50');
insert into franjahoraria values ('E','M','10:30','11:45');
insert into franjahoraria values ('E','J','10:30','11:45');
insert into franjahoraria values ('F','M','14:30','15:45');
insert into franjahoraria values ('F','J','14:30','15:45');
insert into franjahoraria values ('G','L','16:00','16:50');
insert into franjahoraria values ('G','X','16:00','16:50');
insert into franjahoraria values ('G','V','16:00','16:50');
insert into franjahoraria values ('H','X','10:00','12:30');
