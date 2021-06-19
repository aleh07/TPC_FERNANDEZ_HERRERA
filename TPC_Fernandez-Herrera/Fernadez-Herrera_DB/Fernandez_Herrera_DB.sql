SET DATEFORMAT dmy; 
create database Fernandez_Herrera_DB
GO
use Fernandez_Herrera_DB
GO
create table USUARIOS(
 ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
 NOMBREUSUARIO VARCHAR (100) NOT NULL UNIQUE,
 NOMBRE VARCHAR (100) NOT NULL , 
 APELLIDO VARCHAR (100)NOT NULL,
 FECHANAC DATE NOT NULL,
 DNI INT NOT NULL UNIQUE,
 PASS VARCHAR(12) NOT NULL,
 TIPO CHAR(1) NOT NULL
)

GO
create table MENSAJES (
ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
IDUSUARIO BIGINT NOT NULL FOREIGN KEY REFERENCES USUARIOS(ID),
ESTADO BIT NOT NULL,
MENSAJE VARCHAR(500),
RESPUESTA VARCHAR(500)
)

GO
create table MARCAS (
ID INT NOT NULL PRIMARY	KEY identity(1,1),
DESCRIPCION VARCHAR (100)NOT NULL
)
GO
create table CATEGORIAS (
ID INT NOT NULL PRIMARY	KEY identity(1,1),
DESCRIPCION VARCHAR (100)NOT NULL
)

GO
create table COMPONENTES (
 ID BIGINT NOT NULL PRIMARY KEY IDENTITY (1,1),
 NOMBRE VARCHAR(100),
 DESCRIPCION VARCHAR(100),
 IMAGENURL VARCHAR(1000),
 IDMARCA INT NOT NULL FOREIGN KEY REFERENCES MARCAS(ID),
 IDCATEGORIA INT NOT NULL FOREIGN KEY REFERENCES CATEGORIAS(ID),
)

GO
create table MOTHERBOARDS(
 ID BIGINT NOT NULL PRIMARY KEY ,
 IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
 CANTUSB INT NOT NULL,
 SOCKET VARCHAR(50) NOT NULL,
 CAPACIDADRAM VARCHAR(10) NOT NULL,
 CANTSATA INT NOT NULL,
 PUERTOS VARCHAR(20)

)
GO
create table PROCESADORES(
 ID BIGINT NOT NULL PRIMARY KEY ,
IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
 SOCKET VARCHAR(50) NOT NULL,
 CANTNUCLEOS INT NOT NULL,
 FRECUENCIA FLOAT NOT NULL


)
GO 
create table RAMS(
ID BIGINT NOT NULL PRIMARY KEY ,
 IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
 DDR INT NOT NULL,
 CAPACIDAD INT NOT NULL,
 VELOCIDAD INT NOT NULL

)
GO
create table DISCORIGIDOS(
ID BIGINT NOT NULL PRIMARY KEY ,
 IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
 CAPACIDAD VARCHAR (10)NOT NULL

)
GO
create table FUENTES(
ID BIGINT NOT NULL PRIMARY KEY ,
IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
POTENCIA VARCHAR NOT NULL,
CERTIFICACION VARCHAR(100)

)
GO
create table GABIENTES(
ID BIGINT NOT NULL PRIMARY KEY ,
IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
TAMA�OMOTHER VARCHAR(10),
CANTUSB INT

)
GO
create table PLACASDEVIDEO(
ID BIGINT NOT NULL PRIMARY KEY ,
IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
CAPACIDAD INT,
PUERTOS VARCHAR(10)

)
GO 
create table PANTALLAS
(
ID BIGINT NOT NULL PRIMARY KEY ,
IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
PULGADAS INT NOT NULL,
RESOLUCION VARCHAR (20) NOT NULL

)
GO
create table ITEMS (
ID BIGINT NOT NULL PRIMARY KEY,
IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
CANTIDAD INT NOT NULL,
SUBTOTAL MONEY CHECK(SUBTOTAL > 0)
)
GO
create table CARRITO(
ID INT NOT NULL PRIMARY KEY,
IDUSUARIO BIGINT NOT NULL FOREIGN KEY REFERENCES USUARIOS(ID), 
IDITEM BIGINT NOT NULL FOREIGN KEY REFERENCES ITEMS(ID),
TOTAL MONEY NOT NULL
)
--DATOS
--USUARIOS
INSERT INTO USUARIOS VALUES('NES34','PEDRO','RAMIREZ','03/12/1985',35432234,'MEMENTI23','C')
INSERT INTO USUARIOS VALUES('ATX32','LAURA','GOMEZ','03/11/1997',44432234,'LAU4443','C')
--MENSAJE
INSERT INTO MENSAJES VALUES(1,1,'QUISIERA SABER SI TIENE STOCK','HOLA ,SI TENEMOS')
INSERT INTO MENSAJES VALUES(1,1,'ACEPTAN CABAL','HOLA ,POR EL MOMENTO SOLO TRABAJAMOS CON VISA')
--datos categorias
insert  into CATEGORIAS values('Accesorios')
insert  into CATEGORIAS values('Auriculares') 
insert  into CATEGORIAS values('Microfonos')
insert  into CATEGORIAS values('Cables')
insert  into CATEGORIAS values('Cargadores')
insert  into CATEGORIAS values('Cartucho Alternativo hp')
insert  into CATEGORIAS values('Cartuchos Alternativos Epson')
insert  into CATEGORIAS values('Cartuchos Originales Epson')
insert  into CATEGORIAS values('Cartuchos Originales hp')
insert  into CATEGORIAS values('Celulares y Tablets')

--datos marcas

insert  into MARCAS values('HP')
insert  into MARCAS values('EPSON') 
insert  into MARCAS values('COMPAQ')
insert  into MARCAS values('LG')
insert  into MARCAS values('G-FORCE')
insert  into MARCAS values('MSSI')
insert  into MARCAS values('INTEL')
insert  into MARCAS values('AMD')
insert  into MARCAS values('LENOVO')
insert  into MARCAS values('MAC')
--COMPONENTES
INSERT INTO COMPONENTES VALUES('CARTUCHO EPSON','Botella Epson 544 Negro','https://eclypse.com.ar/wp-content/uploads/2020/03/544N-300x300.jpg',2,8)