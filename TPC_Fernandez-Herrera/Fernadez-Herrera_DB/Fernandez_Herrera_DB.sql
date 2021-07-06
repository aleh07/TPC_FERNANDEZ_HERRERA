
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
 EMAIL VARCHAR(100) NOT NULL,
 DIRECION VARCHAR(100) NULL,
 TELEFONO INT NULL,
 PASS VARCHAR(12) NOT NULL,
 TIPO CHAR(1) NOT NULL,
 ESTADO BIT NOT NULL,
)

GO
create table MENSAJES (
ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
IDUSUARIO BIGINT NOT NULL FOREIGN KEY REFERENCES USUARIOS(ID),
ESTADO BIT NOT NULL,
MENSAJE VARCHAR(500) NOT NULL,
RESPUESTA VARCHAR(500)NOT NULL
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
 NOMBRE VARCHAR(100) NOT NULL,
 DESCRIPCION VARCHAR(500) NOT NULL,
 PRECIO MONEY NOT NULL ,
 IMAGENURL VARCHAR(1000) NOT NULL,
 Cantidad int not null ,
 Oferta bit  null,
 Estado bit not null ,
 IDMARCA INT NOT NULL FOREIGN KEY REFERENCES MARCAS(ID),
 IDCATEGORIA INT NOT NULL FOREIGN KEY REFERENCES CATEGORIAS(ID),
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
go
Create table TiposPedidos(
ID int not null primary key identity(1,1),
Nombre varchar(100) not null
)
go
Create table Pedidos( 
Id bigint not null identity(1,1),
Cliente bigint not null foreign key references Usuarios( ID),
Direccion varchar ( 100) not null,
TelefonoContacto int null,
EstadoPedido int not null foreign key references TiposPedidos( ID),
Carrito int not null foreign key references Carrito (id)
Primary key(cliente,carrito),
Estado bit not null
)
go
create table Presupuestos(
ID bigint not null primary key identity (1,1),
IDCOMPONENTE BIGINT NOT NULL FOREIGN KEY REFERENCES COMPONENTES(ID),
ESTADO BIT NOT NULL
)


--DATOS
--USUARIOS
INSERT INTO USUARIOS VALUES('NES34','PEDRO','RAMIREZ','03/12/1985',35432234,'NES34@HOTMAIL.COM','FSFS',1122332,'MEMENTI23','C',1)
INSERT INTO USUARIOS VALUES('ATX32','LAURA','GOMEZ','03/11/1997',44432234,'ATX32@HOTMAIL.COM','FDFDFD',1123243,'LAU4443','C',1)
--MENSAJE
INSERT INTO MENSAJES VALUES(1,1,'QUISIERA SABER SI TIENE STOCK','HOLA ,SI TENEMOS')
INSERT INTO MENSAJES VALUES(1,1,'ACEPTAN CABAL','HOLA ,POR EL MOMENTO SOLO TRABAJAMOS CON VISA')
--datos categorias
insert  into CATEGORIAS values('Accesorios')
insert  into CATEGORIAS values('Auriculares') 
insert  into CATEGORIAS values('Microfonos')
insert  into CATEGORIAS values('Cables')
insert  into CATEGORIAS values('Cargadores')
insert  into CATEGORIAS values('Cartucho Alternativo')
insert  into CATEGORIAS values('Cartuchos Originales')
insert  into CATEGORIAS values('Celulares y Tablets')
insert  into CATEGORIAS values('Motherboards')
insert  into CATEGORIAS values('Procesadores') 
insert  into CATEGORIAS values('Pantallas')
insert  into CATEGORIAS values('Fuentes')
insert  into CATEGORIAS values('Rams')
insert  into CATEGORIAS values('DiscoRigidos')
insert  into CATEGORIAS values('Gabinetes')
insert  into CATEGORIAS values('PlacasdeVideos')


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
insert  into MARCAS values('KINGTONG')
insert  into MARCAS values('SEAGATE')

--COMPONENTES
INSERT INTO COMPONENTES VALUES('CARTUCHO EPSON','Botella Epson 544 Negro',450.99,'https://eclypse.com.ar/wp-content/uploads/2020/03/544N-300x300.jpg',1,1,1,1,7)
INSERT INTO COMPONENTES VALUES('AsRock Radeon RX 550 Phantom Gaming','Placa de Video AsRock Radeon RX 550 Phantom Gaming 2Gb GDDR5',450.99,'https://s3-sa-east-1.amazonaws.com/saasargentina/6w0HR6Ntf8gwv0dXgIfw/imagen',1,1,1,8,16)
INSERT INTO COMPONENTES VALUES(' MSI H110M PRO-VH ','Mother MSI H110M PRO-VH DDR4 HDMI S1151',450.99,'https://s3-sa-east-1.amazonaws.com/saasargentina/vDqmnCN0pOYHI96qMzjo/imagen',1,1,1,9,6)
INSERT INTO COMPONENTES VALUES('  Athlon 3000G Vega 3 DualCore AM4 BOX ','Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX',450.99,'https://s3-sa-east-1.amazonaws.com/saasargentina/skzKBEUHDOtZQWJ6AkMG/imagen',1,1,1,8,10)
INSERT INTO COMPONENTES VALUES(' RAM  4GB  ','Memoria RAM 4GB DDR4 2666Mhz Value',450.99,'https://s3-sa-east-1.amazonaws.com/saasargentina/oSUqVhoCIOHuDzvTBIxb/imagen',1,1,1,8,11)
INSERT INTO COMPONENTES VALUES(' DR PC 1TbSATA3','Disco Rígido PC 1Tb Seagate Barracuda SATA3',450.99,'https://s3-sa-east-1.amazonaws.com/saasargentina/yVXzYVIprX9JQYEhMOIi/imagen',1,1,1,14,12)
INSERT INTO COMPONENTES VALUES('  H410M-H V2 DDR4 (10ma Gen) LGA1200','Mother Gigabyte H410M-H V2 DDR4 (10ma Gen) LGA1200',450.99,'https://s3-sa-east-1.amazonaws.com/saasargentina/RBNVEnsUVcAGVnS8ayne/imagen',1,1,1,9,6)
