CREATE TABLE CLIENTE (
                CVE_CLIE VARCHAR(5) NOT NULL,
                NOMBRE VARCHAR(20) NOT NULL,
                APATERNO VARCHAR(20) NOT NULL,
                RFC VARCHAR(13),
                DIRECCION VARCHAR(30),
                CIUDAD VARCHAR(20),
                TEL VARCHAR(15),
                PRIMARY KEY (CVE_CLIE)
);


CREATE TABLE PROVEEDOR (
                CVE_PROV VARCHAR(5) NOT NULL,
                PROVEEDOR VARCHAR(30) NOT NULL,
                RFC_PROV VARCHAR(13),
                DIRECCION_PROV VARCHAR(30),
                CIUDAD_PROV VARCHAR(20),
                TEL_PROV VARCHAR(15),
                PRIMARY KEY (CVE_PROV)
);


CREATE TABLE PRODUCTO (
                CVE_PROD NUMERIC(4) NOT NULL,
                PRODUCTO VARCHAR(20) NOT NULL,
                MARCA VARCHAR(20),
                PRECIO_VENTA NUMERIC(10,2) DEFAULT 0.00 NOT NULL,
                EXISTENCIA NUMERIC(3) DEFAULT 0 NOT NULL,
                PRIMARY KEY (CVE_PROD)
);


CREATE TABLE VENTA (
                NUM_VENTA INT NOT NULL,
                CVE_CLIE VARCHAR(5) NOT NULL,
                FECHA_VENTA DATE NOT NULL,
                PRIMARY KEY (NUM_VENTA),
                FOREIGN KEY (CVE_CLIE) REFERENCES CLIENTE (CVE_CLIE)
);


CREATE TABLE DET_VENTA (
                NUM_VENTA INT NOT NULL,
                CVE_PROD NUMERIC(4) NOT NULL,
                CANTIDAD NUMERIC(2) DEFAULT 1 NOT NULL,
                PRECIO_UNITARIO NUMERIC(10,2) DEFAULT 0.00 NOT NULL,
                PRIMARY KEY (NUM_VENTA, CVE_PROD),
                FOREIGN KEY (CVE_PROD) REFERENCES PRODUCTO (CVE_PROD),
                FOREIGN KEY (NUM_VENTA) REFERENCES VENTA (NUM_VENTA)
                
);


CREATE TABLE PROV_PROD (
                CVE_PROV VARCHAR(5) NOT NULL,
                CVE_PROD NUMERIC(4) NOT NULL,
                PRECIO_COSTO NUMERIC(10,2) DEFAULT 0.00 NOT NULL,
                CARGOS NUMERIC(10,2) DEFAULT 0.00 NOT NULL,
                PRIMARY KEY (CVE_PROV, CVE_PROD),
                FOREIGN KEY (CVE_PROV) REFERENCES PROVEEDOR (CVE_PROV),
                FOREIGN KEY (CVE_PROD) REFERENCES PRODUCTO (CVE_PROD)
);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (1, 'DISCO DURO 40Gb.', 'COMPAQ', 5371.45, 4);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (2, 'DISCO DURO 40Gb.', 'CISCO', 4186.05, 10);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (3, 'PROCESADOR P4 1.4Ghz', 'INTEL', 2998.73, 18);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (4, 'MONITOR 17"', 'INTEL', 426.25, 8);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (5, 'DISCO DURO 30Gb.', '3COM', 4547.3, 13);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (6, 'GABINETE PARA P4', 'CISCO', 5280.11, 1);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (7, 'PROCESADOR P4 1.3Ghz', '3COM', 3644.82, 19);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (8, 'PROCESADOR PIII 933M', 'ACER', 2065.78, 19);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (9, 'T. RED PCI 10/100', 'CREATIVE', 991.68, 8);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (10, 'GABINETE PARA P4', 'AOPEN', 6012.96, 18);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (11, 'IMP. LASER 1200dpi', 'AOPEN', 3319.16, 9);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (12, 'DVD 8x', 'CISCO', 2606.02, 4);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (13, 'MONITOR 17"', 'COMPAQ', 2189.34, 17);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (14, 'MONITOR 17"', 'AOPEN', 1870.82, 2);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (15, 'GABINETE MINITORRE', 'CISCO', 2189.34, 7);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (16, 'CD-ROM 52x', 'CREATIVE', 4287.34, 15);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (17, 'MONITOR 17"', 'SAMSUNG', 869.27, 12);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (18, 'IMP. LASER 1200dpi', 'INTEL', 3319.16, 1);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (19, 'PROCESADOR PIII 933M', 'COMPAQ', 6394.15, 2);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (20, 'CD-ROM 52x', 'INTEL', 1251.92, 11);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (21, 'PROCESADOR PIII 933M', '3COM', 2189.34, 15);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (22, 'CD-ROM 52x', '3COM', 3720.65, 1);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (23, 'DVD 8x', 'COMPAQ', 3983.83, 8);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (24, 'T. VIDEO 32Mb.', 'SAMSUNG', 5814.77, 16);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (25, 'PROCESADOR PIII 933M', 'AOPEN', 5814.77, 4);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (26, 'T. RED ISA 10 BASE-T', 'ACER', 6594.29, 13);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (27, 'MONITOR 17"', 'CREATIVE', 3802.24, 11);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (28, 'T. VIDEO 16Mb.', 'CREATIVE', 1870.82, 11);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (29, 'DISCO DURO 40Gb.', '3COM', 2480.81, 4);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (30, 'IMP. LASER 1200dpi', '3COM', 2314.8, 9);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (31, 'GABINETE PARA P4', 'CISCO', 6487.3, 14);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (32, 'DISCO DURO 20Gb.', 'AOPEN', 2780.52, 2);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (33, 'PROCESADOR P4 1.3Ghz', '3COM', 869.27, 11);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (34, 'DISCO DURO 30Gb.', 'COMPAQ', 426.25, 2);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (35, 'PROCESADOR P4 1.4Ghz', 'COMPAQ', 1628.9, 13);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (36, 'IMP. LASER 1200dpi', 'COMPAQ', 4186.05, 5);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (37, 'MONITOR 15"', '3COM', 6673.9, 3);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (38, 'IMP. LASER 1200dpi', '3COM', 2606.02, 16);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (39, 'GABINETE MINITORRE', 'INTEL', 6673.9, 13);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (40, 'DISCO DURO 40Gb.', 'AOPEN', 5123.66, 10);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (41, 'T. VIDEO 16Mb.', 'CISCO', 2314.8, 9);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (42, 'CD-ROM 52x', 'SAMSUNG', 2606.02, 3);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (43, 'DISCO DURO 30Gb.', 'SAMSUNG', 2780.52, 16);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (44, 'IMP. LASER 1200dpi', 'CREATIVE', 5536.3, 11);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (45, 'IMP. LASER 1200dpi', 'CISCO', 5918.33, 19);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (46, 'GABINETE MINITORRE', '3COM', 3720.65, 5);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (47, 'GABINETE PARA P4', '3COM', 2480.81, 17);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (48, 'T. RED ISA 10 BASE-T', 'CREATIVE', 6487.3, 17);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (49, 'T. VIDEO 16Mb.', 'SAMSUNG', 2189.34, 7);

insert into PRODUCTO (CVE_PROD, PRODUCTO, MARCA, PRECIO_VENTA, EXISTENCIA) values (50, 'DISCO DURO 30Gb.', 'AOPEN', 1782.63, 5);


insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('XLYMW', 'Kara', 'Large', 'Geigy Road-P O Box 113', 'Colorado Springs');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('XXI49', 'Dominico', 'Bailey', '671 Blackstone Ave.', 'Tel Aviv');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('Y5RUK', 'Tracey', 'Pahls', '940 Moore Street N E-P O Box 4', 'Philadelphia');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('OK25S', 'Vida', 'Wilkinson', '355 Golf Rd.', 'Toledo');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('49T6U', 'Rita', 'Sachman', '3181 Barkwood Ct.', 'Tarrant');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('I03C1', 'Daphne', 'Gellar', '4522 N. Greenview Apt. 1B', 'Juneau');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('JDRO1', 'Wendell', 'Bassi', '940 Moore Street N E-P O Box 4', 'Quebec');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('S22W0', 'Ruth', 'Zelmar', '115 Judson Rd.', 'Hatchechubbee');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('DY76I', 'Erich', 'Funk', '2000 9th Street-P O Box 90', 'Lima');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('48D5N', 'Betsy', 'Grey', '2600 Winsor Mall', 'Ashford');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('HOFZA', 'Luther', 'Eriksen', '1600 Fairview Avenue-P O Box 6', 'Barcelona');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('LA1NH', 'Nevin', 'Vickman', '965 Marion Place Apt. 65C', 'Cherokee');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('PGH04', 'Cornelius', 'Cabeza', '38976 Forest View Rd.', 'Jeruselum');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('006RW', 'Milton', 'Eggerman', '1550 Ridge Rd.', 'Garrison');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('9YOKH', 'Oakey', 'Graham', '456 Groverland Ave.', 'Fort Rucker');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('V3BN4', 'Lilly', 'Gray', '218 Oakridge Ave.', 'Milford');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('FMLV6', 'Radoslaw', 'Anderson', '788 Catamaugus Ave.', 'Union Springs');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('6WQWQ', 'Anton', 'Smith', '2801 U S Highway 280 S', 'El Segundo');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('M55U8', 'Audrey', 'Rivera', '21 Lakeview Terrace #2312', 'Cincinnati');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('7TB59', 'Arthur', 'Heller', '922 East Meighan Boulevard', 'Belize');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('XMPD1', 'Edgar', 'Richman', '746 Judson Place', 'Lima');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('CA2BC', 'Elmer', 'Anovitz', '445 Park Ave.', 'Jersey City');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('EKQ1C', 'Rob', 'Gordon', '1547 Knolwood Rd.', 'Dadeville');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('W4Q92', 'Ivan', 'Christopher', '1839 McCraren Rd.', 'Newport Beach');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('PULIO', 'Andrew', 'Ferratti', 'Highway 78 South-P O Drawer 9', 'Stratton');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('APES2', 'Phil', 'Allen', '54 Lakeview Terrace', 'Irvine');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('0K7SS', 'Justine', 'Ortega', '2505 Allison ct.', 'New York City');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('1HGBP', 'Chloris', 'Steibel', '970 Vilas Circle', 'London');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('HIRYI', 'Joel', 'Salayton', '1801 First Avenue S-P O Box 10', 'Fairhope');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('YYDNY', 'Bartlett', 'Strauss', '1954 First St.', 'Belfast');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('SMQFE', 'Robin', 'Wilcox', '1000 George Wallace Dr-P O Box', 'Homewood');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('5WAOO', 'Kevin', 'Finch', 'Parker Road Hwy 98-P O Drawer ', 'Naples');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('YTFTM', 'Wylie', 'Abbot-Cravett', '1770 first St.', 'Ozark');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('FRC2Z', 'Iain', 'Ozerogivc', '1752 Clinton Ave.', 'Greensboro');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('MXGJV', 'Barrett', 'Muzik', 'Highway 280 E-P O Box 1943', 'Easton');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('98AW2', 'Bob', 'Chetek', '3901 Chester Ave. Apt. 3C', 'Blue Hill');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('KIN42', 'Ann', 'Baghade', '21 Lakeview Terrace #2312', 'San Salvador');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('K9RWS', 'Alfred', 'Jones', '12 Broadview Lane', 'Cleveland');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('MU8VK', 'Martha', 'Swerdlow', '77 Blackhawk Rd', 'Barcelona');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('XTVOC', 'Theodore', 'Neff', '1337 Cavell Ave.', 'Linz');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('VWK2M', 'Jill', 'Wesson', '1704 Ridgelee Rd', 'Chappaqua');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('IM2BU', 'Accalia', 'Filipowski', '1547 Vine', 'Monroeville');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('Z09IS', 'Yvonne', 'Hartley', '899 Harvard Ct', 'Alexander City');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('ZT5L7', 'Alison', 'Williams', '42 Valley Rd.', 'Brazillia');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('C3SAO', 'Dion', 'Waxews', '1415 South Roselle Road', 'Kansas City');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('KRVYZ', 'Sarah', 'Richards', '5518 Madison St.', 'Bonn');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('EQ12P', 'Angela', 'McCarley', '2000 Ninth Avenue S-P O Box 55', 'Monroeville');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('JU0NL', 'Lucy', 'Aldo', '1486 Oakwood', 'Atmore');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('AE78O', 'Mark', 'Russian', '1658 Second St.', 'Huntington Beach');

insert into CLIENTE (CVE_CLIE, NOMBRE, APATERNO, DIRECCION, CIUDAD) values ('GY751', 'Alvin', 'Vyas', 'Computer Center Station 6520', 'Jackson');


insert into PROVEEDOR (CVE_PROV, PROVEEDOR, DIRECCION_PROV, CIUDAD_PROV) values ('XXID7', 'DATAFLUX', '425 Lake Ave.', 'Mt. Rose');

insert into PROVEEDOR (CVE_PROV, PROVEEDOR, DIRECCION_PROV, CIUDAD_PROV) values ('10FM2', 'NOVITECH', '1000 First Street N-P O Box 48', 'Catalina Island');

insert into PROVEEDOR (CVE_PROV, PROVEEDOR, DIRECCION_PROV, CIUDAD_PROV) values ('Y5GC8', 'CHS', '632 Florence Dr.', 'Brookline');

insert into PROVEEDOR (CVE_PROV, PROVEEDOR, DIRECCION_PROV, CIUDAD_PROV) values ('7EM7H', 'MPS', '1907 S. Prospect Ave.', 'Fort Payne');

insert into PROVEEDOR (CVE_PROV, PROVEEDOR, DIRECCION_PROV, CIUDAD_PROV) values ('HQ9EA', 'INGRAM', '3344 Beachwood Ln.', 'Bath');


insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 1, 1040.36, 41.65);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 1, 451.4, 42.65);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 1, 1276.01, 45.27);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 1, 3062.63, 37.33);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 1, 259.69, 46.12);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 2, 711.72, 37.33);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 2, 977.18, 47.13);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 2, 4074.7, 31.82);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 2, 259.69, 47.63);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 2, 2096.4, 45.8);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 3, 4274, 36);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 3, 1215.55, 40.15);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 3, 1040.36, 45.8);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 3, 1149.92, 43.58);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 3, 2268.85, 41.65);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 4, 2587.34, 43.97);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 4, 711.72, 34.24);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 4, 259.69, 40.15);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 4, 1215.55, 35.45);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 4, 4830.12, 35.78);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 5, 2399.59, 48.88);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 5, 873.47, 36.92);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 5, 2638.77, 45.8);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 5, 576.22, 44.45);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 5, 2268.85, 36.38);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 6, 819.81, 36);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 6, 2968.38, 36);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 6, 977.18, 33.92);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 6, 2399.59, 38.43);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 6, 451.4, 35.45);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 7, 4515.86, 35.45);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 7, 1365.34, 35.78);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 7, 1652.18, 45.27);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 7, 2638.77, 45.54);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 7, 1652.18, 40.51);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 8, 3153.32, 41.39);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 8, 2399.59, 30.37);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 8, 1276.01, 45.27);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 8, 2399.59, 47.63);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 8, 4274, 30.37);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 9, 2203.62, 31.82);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 9, 659.04, 35.12);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 9, 3866.26, 36);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 9, 1590.88, 40.51);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 9, 4830.12, 35.45);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('XXID7', 10, 3153.32, 41.39);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('10FM2', 10, 3153.32, 32.1);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('Y5GC8', 10, 977.18, 43.58);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('7EM7H', 10, 4611.06, 39.35);

insert into PROV_PROD (CVE_PROV, CVE_PROD, PRECIO_COSTO, CARGOS) values ('HQ9EA', 10, 3251.8, 33.08);



insert into VENTA values (1,"006RW","2025/11/29");
insert into DET_VENTA values (1,1,2,5371.45);
insert into DET_VENTA values (1,4,1,426.25);
insert into DET_VENTA values (1,42,1,2606.02);

insert into VENTA values (10,"49T6U","2025/11/30");
insert into DET_VENTA values (10,2,5,4186.05);
insert into DET_VENTA values (10,33,2,869.27);

insert into VENTA values (11,"006RW","2025/11/30");
insert into DET_VENTA values (11,2,5,4186.05);
insert into DET_VENTA values (11,33,2,869.27);

insert into VENTA values (3,"XMPD1","2025/11/29");
insert into DET_VENTA values (3,23,1,3983.83);

insert into VENTA values (7,"5WAOO","2025/11/29");
insert into DET_VENTA values (7,1,2,5371.45);
insert into DET_VENTA values (7,4,1,426.25);
insert into DET_VENTA values (7,42,1,2606.02);
insert into DET_VENTA values (7,36,1,4186.05);
