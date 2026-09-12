create table producto(
cve_prod varchar(3) not null,
producto varchar(50) not null,
primary key (cve_prod)
);

create table cajero(
cve_cajero numeric(2) not null,
cajero varchar(25) not null,
primary key (cve_cajero)
);

create table ticket (
ticket int not null,
fecha date not null,
hora time not null,
cve_cajero numeric(2),
caja numeric(2) Not Null,
primary key (ticket),
foreign key (cve_cajero) references cajero(cve_cajero)
);

create table ticket_producto(
ticket int not null,
cve_prod varchar(3) not null,
cantidad int not null,
primary key (ticket,cve_prod),
foreign key (ticket) references ticket(ticket),
foreign key (cve_prod) references producto(cve_prod)
); 


INSERT INTO producto VALUES ('001', 'Bocinas 80W');
INSERT INTO producto VALUES ('002', 'DVD Multiregión');
INSERT INTO producto VALUES ('003', 'TV 21"');
INSERT INTO producto VALUES ('004', 'TV 25"');

INSERT INTO cajero VALUES (1, 'Juan');
INSERT INTO cajero VALUES (2, 'Armando');
INSERT INTO cajero VALUES (3, 'Aurora');

INSERT INTO ticket VALUES (101, '2003-01-01', '10:50:00', 1, 1);
INSERT INTO ticket VALUES (127, '2003-02-10', '11:00:20', 2, 2);
INSERT INTO ticket VALUES (204, '2003-01-01', '20:09:14', 3, 1);
INSERT INTO ticket VALUES (411, '2003-02-10', '11:00:06', 1, 3);
INSERT INTO ticket VALUES (485, '2003-02-11', '16:55:00', 3, 1);

INSERT INTO ticket_producto VALUES (101, '001', 2);
INSERT INTO ticket_producto VALUES (101, '002', 1);
INSERT INTO ticket_producto VALUES (101, '003', 1);
INSERT INTO ticket_producto VALUES (127, '001', 4);
INSERT INTO ticket_producto VALUES (204, '001', 2);
INSERT INTO ticket_producto VALUES (411, '003', 3);
INSERT INTO ticket_producto VALUES (485, '004', 1);
INSERT INTO ticket_producto VALUES (485, '002', 1);
