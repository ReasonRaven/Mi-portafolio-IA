create table SDEPT (DEPT varchar(4),
                    MANAGER varchar(12),
                    CODE decimal(2,0));

create table DEPT (DEPT varchar(4) not null,
                   MANAGER varchar(12),
                   DUTY varchar(12),
                   BUDGET decimal(10,2),
		   PRIMARY KEY (DEPT));

create table EMPS (
     EMPNUM decimal(3,0) not null,
     DEPT varchar(4) not null,
     SURNAME varchar(12),
     GNAME varchar(9),
     ADDRESS varchar(18),
     CITY varchar(10),
     PROV char(2),
     PC varchar(6),
     PHONE char(8),
     RATE decimal(6,2),
     TAXCODE decimal(2,0),
     DEDUCTION decimal(6,2),
     PRIMARY KEY (EMPNUM),
     FOREIGN KEY (DEPT) REFERENCES DEPT(DEPT));
