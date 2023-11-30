-- Active: 1700095530729@@127.0.0.1@3306@ELECCIONES

##############################################################################

-- CREATE TABLES

-- CREATE REGION TABLE
CREATE TABLE REGIONS (
    id_region INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    region_name TEXT NOT NULL
);

-----------------------------------------------------------------

-- CREATE DEPARTMENTS TABLE
CREATE TABLE DEPARTMENTS (
    id_dept INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    dept_population INT,
    dept_name TEXT,
    id_region INT NOT NULL,
    CONSTRAINT FOREIGN KEY (id_region) REFERENCES REGIONS(id_region)
);

----------------------------------------------------------------------

-- CREATE CITIES
CREATE TABLE CITIES (
    id_city INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    city_population BIGINT,
    city_name TEXT,
    id_dept INT NOT NULL,
    CONSTRAINT FOREIGN KEY (id_dept) REFERENCES DEPARTMENTS(id_dept)
);

----------------------------------------------------------------------------

-- CREATE CLASSIFICATIONS TABLE
CREATE TABLE CLASSIFICATIONS (
    id_classification INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    classification_name TEXT
);

----------------------------------------------------------------------------

-- CREATE POLITICAL PARTY TABLE
CREATE TABLE POLITICAL_PARTY (
    id_pol_party INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    pol_party_name TEXT NOT NULL,
    id_classification INT NOT NULL
);

-----------------------------------------------------------------------------

-- CREATE CANDIDATES TABLE
CREATE TABLE CANDIDATES (
    id_candidate INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    f_name VARCHAR(30) NOT NULL,
    s_name VARCHAR(30),
    f_last_name VARCHAR(30),
    s_last_name VARCHAR(30),
    id_pol_party INT NOT NULL
);

--------------------------------------------------------------------------------

-- CREATE VOTATIONS TABLE
CREATE TABLE VOTATIONS (
    id_candidate INT NOT NULL,
    id_city INT NOT NULL,
    cant_votes INT DEFAULT (0),
    CONSTRAINT FOREIGN KEY (id_candidate) REFERENCES CANDIDATES(id_candidate),
    CONSTRAINT FOREIGN KEY (id_city) REFERENCES CITIES(id_city)
);

----------------------------------------------------------------------------------

#####################################################################################

-- INSERT REGIONS
INSERT INTO `REGIONS` (region_name)
VALUES
("Andina"), ("Costa Atlántica");

----------------------------------------------------------

-- INSERT DEPARTMENTS
INSERT INTO `DEPARTMENTS` (dept_population,dept_name,id_region)
VALUES
(2500000,"Antioquia",1),
(2000000,"Atlántico",2),
(1200000,"Bolívar",2),
(2000000,"Boyacá",1),
(12000000,"Cundinamarca",1),
(2000000,"Santander",1);

--------------------------------------------------------------------------

-- INSERT CITIES
INSERT INTO CITIES (city_population, city_name, id_dept)
VALUES
(3000000,"Medellín",1),
(500000,"Abejorral",1),
(250000,"Copacabana",1),
(1000000,"Barranquilla",2),
(750000,"Malambo",2),
(800000,"Luruaco",2),
(1000000,"Cartagena",3),
(900000,"Arjona",3),
(500000,"Maríalabaja",3),
(250000,"San Pablo",3),
(800000,"Turbaco",3),
(1000000,"Tunja",4),
(850000,"Sogamoso",4),
(250000,"Paipa",4),
(10000000,"Bogotá",5),
(900000,"Zipaquirá",5),
(800000,"Villeta",5),
(500000,"Cajicá",5),
(250000,"Tenjo",5),
(1400000,"Bucaramanga",6),
(800000,"San Gil",6),
(700000,"Socorro",6),
(500000,"Barichara",6),
(250000,"Puente Nacional",6);

------------------------------------------------------------

-- INSERT CLASSIFICATIONS
INSERT INTO `CLASSIFICATIONS` (classification_name)
VALUES
("Derecha"),
("Centro-Derecha"),
("Izquierda"),
("Centro-Izquierda"),
("Arrepentidos");

