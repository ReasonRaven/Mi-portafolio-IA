create table customer(
cus_code NUMERIC(3,0) PRIMARY KEY,
cus_lname VARCHAR(15) NOT NULL,
cus_fname VARCHAR(15) NOT NULL,
cus_initial CHAR(1),
cus_areacode CHAR(15) DEFAULT '615' NOT NULL
CHECK(cus_areacode in ('615','713','931')),
cus_phone CHAR(8) NOT NULL,
cus_balance NUMERIC(9,2) DEFAULT 0.00,
CONSTRAINT cus_ui1 UNIQUE(cus_lname, cus_fname));

