DROP DATABASE IF EXISTS DbEjercicioFinalUnidad;
CREATE DATABASE IF NOT EXISTS DbEjercicioFinalUnidad;

USE DbEjercicioFinalUnidad;

DROP TABLE IF EXISTS Centros;
CREATE TABLE Centros(
CeCodigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CeNombre VARCHAR(30) UNIQUE NOT NULL,
CeDireccion VARCHAR(100) NOT NULL
)ENGINE = InnoDB;

DROP TABLE IF EXISTS Departamentos;
CREATE TABLE  Departamentos (
DeCodigo INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DeCodigoCentro INTEGER UNSIGNED REFERENCES Centros (DeCodigo) ON UPDATE CASCADE,
DeTipoDirector ENUM('P','F') DEFAULT 'P' ,
DePresupuesto DECIMAL (8, 0) UNSIGNED NOT NULL,
DeDepartamento INTEGER UNSIGNED,
DeNombre VARCHAR (30) NOT NULL UNIQUE,
DeDirector INTEGER UNSIGNED,
CONSTRAINT FKDepCentros FOREIGN KEY(DeCodigoCentro) REFERENCES Centros(CeCodigo)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Empleados;
CREATE TABLE Empleados (
EmCodigo INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
EmCodigoDepartamento INTEGER UNSIGNED NOT NULL,
EmExTelefono SMALLINT UNSIGNED NOT NULL,
EmFecNacimiento DATE NOT NULL,
EmFecIngreso DATE NOT NULL,
EmSalario DECIMAL (6, 0) UNSIGNED NOT NULL,
EmComision DECIMAL (4, 0) UNSIGNED ,
EmNumHijos SMALLINT UNSIGNED NOT NULL,
EmNombre VARCHAR(20) NOT NULL UNIQUE,
CONSTRAINT FKEmplDepartamentos FOREIGN KEY (EmCodigoDepartamento) REFERENCES Departamentos(DeCodigo)
) ENGINE = InnoDB;


INSERT INTo Centros (CeCodigo, CeNombre, CeDireccion) VALUES
(10, 'SEDE CENTRAL', 'C. ALCALA, 820, MADRID'),
(20, 'RELACION CON CLIENTES', 'C. ATOCHA. 405, MADRID'),
(50, 'ALMACEN', 'C. LAVAPIES, 520, MADRID'),
(70, 'FABRICA', 'Polígono Industrial Matxaria, 10, EIBAR - GUIPZCOA') ;

INSERT INTO  Departamentos (DeCodigo, DeCodigoCentro, DeDirector, DeTipoDirector, DePresupuesto, DeDepartamento, DeNombre) VALUES
	(  100, 10, 260, 'P', 120000, NULL, 'DIRECCION GENERAL')
	, (110, 20, 180, 'P', 150000, 100    , 'DIRECCION COMERCIAL')
	, (111, 20, 180, 'F', 110000, 110     , 'SECTOR INDUSTRIAL')
	, (112, 20, 270, 'P',   90000, 110     , 'SECTOR SERVICIOS')
	, (120, 10, 150, 'F',   30000, 100     , 'ORGANIZACION')
	, (121, 10, 150, 'P',   20000, 120     , 'PERSONAL')
	, (122, 10, 350, 'P',   60000, 120     , 'PROCESO DE DATOS')
	, (130, 10, 310, 'P',   20000, 100     , 'FINANZAS')
	, (123, NULL, 150, 'F', 100000, 121, 'PERSONAL CONTRATADO')
	, (140, NULL, NULL, 'F', 3520, 121, 'PRODUCCION')
	, (144, NULL, NULL, 'F', 4500, 121, 'CONTABILIDAD');
	
INSERT INTO  Empleados (EmCodigo, EmCodigoDepartamento, EmExtelefono, EmFecNacimiento, EmFecIngreso, EmSalario, EmComision,
EmNumHijos, EmNombre) VALUES
  (110, 121, 350, '1959-11-10', '1970-02-15', 3100, NULL, 3, 'PONS, CESAR')
, (120, 112, 840, '1955-06-09', '1968-10-01', 3500, 1100, 1, 'LASA, MARIO')
, (130, 112, 810, '1955-09-09', '1969-02-01', 2900, 1100, 2, 'TEROL, LUCIANO')
, (150, 121, 340, '1970-08-10', '1978-01-15', 4400, NULL, 0, 'PEREZ, JULIO')
, (160, 111, 740, '1969-07-09', '1988-11-11', 3100, 1100, 2, 'AGUIRRE, AUREO')
, (180, 110, 508, '1974-10-18', '1986-03-18', 4800, 500, 2, 'PEREZ, MARCOS')
, (190, 121, 350, '1954-05-12', '1967-02-11', 3000, NULL, 4, 'VEIGA, JULIANA')
, (210, 100, 200, '1958-09-28', '1970-01-22', 3800, NULL, 2, 'GALVEZ, PILAR')
, (240, 111, 760, '1964-02-26', '1966-02-24', 2800, 1000, 3, 'SANZ, LAVINIA')
, (250, 100, 250, '1966-10-27', '1967-03-01', 4500, NULL, 0, 'ALBA, ADRIANA')
, (260, 100, 220, '1955-12-03', '1970-07-12', 7200, NULL, 6, 'LOPEZ, ANTONIO')
, (270, 112, 800, '1965-05-21', '1976-09-10', 3800, 800, 3, 'GARCIA, OCTAVIO')
, (280, 130, 410, '1958-01-11', '1971-10-08', 2900, 800, 5, 'FLOR, DOROTEA')
, (285, 122, 620, '1959-10-25', '1968-02-15', 3800, NULL, 0, 'POLO, OTILIA')
, (290, 120, 910, '1957-11-30', '1968-02-14', 2700, 800, 3, 'GIL, GLORIA')
, (310, 130, 480, '1956-11-21', '1971-01-15', 4200, NULL, 0, 'GARCIA, AUGUSTO')
, (320, 122, 620, '1967-12-25', '1978-02-05', 4050, NULL, 2, 'SANZ, CORNELIO')
, (330, 112, 850, '1958-08-19', '1972-03-01', 2800, 900, 0, 'DIEZ, AMELIA')
, (350, 122, 610, '1959-04-13', '1984-09-10', 4500, NULL, 1, 'CAMPS, AURELIO')
, (360, 111, 750, '1968-10-28', '1968-10-10', 2500, 1000, 2, 'LARA, DORINDA')
, (370, 121, 360, '1977-06-22', '1987-01-20', 1900, NULL, 1, 'RUIZ, FABIOLA')
, (380, 112, 880, '1978-03-30', '1988-01-01', 1800, NULL, 0, 'MARTIN, MICAELA')
, (390, 110, 500, '1976-02-19', '1986-10-08', 2150, NULL, 1, 'MORAN, CARMEN')
, (400, 111, 780, '1979-08-18', '1987-11-01', 1850, NULL, 0, 'LARA, LUCRECIA')
, (410, 122, 660, '1978-07-14', '1988-10-13', 1750, NULL, 0, 'MUÑOZ, AZUCENA')
, (420, 130, 450, '1976-10-22', '1988-11-19', 4000, NULL, 0, 'FIERRO, CLAUDIA')
, (430, 122, 650, '1977-10-26', '1988-11-19', 2100, NULL, 1, 'MORA, VALERIANA')
, (440, 111, 760, '1976-09-26', '1986-02-28', 2100, 1000, 0, 'DURAN, LIVIA')
, (450, 112, 880, '1976-10-21', '1986-02-28', 2100, 1000, 0, 'PEREZ, SABINA')
, (480, 111, 760, '1975-04-04', '1986-02-28', 2100, 1000, 1, 'PINO, DIANA')
, (490, 112, 880, '1974-06-06', '1988-01-01', 1800, 1000, 0, 'TORRES, HORACIO')
, (500, 111, 750, '1975-10-08', '1987-01-01', 2000, 1000, 0, 'VAZQUEZ, HONORIA')
, (510, 110, 550, '1976-05-04', '1986-11-01', 2000, NULL, 1, 'CAMPOS, ROMULO')
, (550, 111, 780, '1970-01-10', '1988-01-21', 1000, 1200, 0, 'SANTOS, SANCHO')
;