
SET DATEFORMAT dmy;

create database Fernandez_Herrera_DB
GO
use Fernandez_Herrera_DB
GO

create table USUARIOS(
 ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
 NOMBRE VARCHAR (100) NOT NULL , 
 APELLIDO VARCHAR (100)NOT NULL,
 EMAIL VARCHAR(100) UNIQUE NOT NULL,
 PASS VARCHAR(8) NOT NULL,
 TIPO VARCHAR(2) NOT NULL,
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
 DESCRIPCION VARCHAR(5000) NOT NULL,
 PRECIO MONEY NOT NULL ,
 IMAGENURL VARCHAR(1000) NOT NULL,
 Cantidad int not null ,
 Oferta bit  null,
 Estado bit not null ,
 IDMARCA INT NOT NULL FOREIGN KEY REFERENCES MARCAS(ID),
 IDCATEGORIA INT NOT NULL FOREIGN KEY REFERENCES CATEGORIAS(ID),
)

GO
create table CARRITO(
ID INT NOT NULL PRIMARY KEY ,
IDUSUARIO BIGINT NOT NULL FOREIGN KEY REFERENCES USUARIOS(ID), 
TOTAL MONEY NOT NULL
)
GO
create table ITEMS (
ID BIGINT NOT NULL identity (1,1), 
IDCARRITO INT NOT NULL FOREIGN KEY REFERENCES CARRITO (ID),
CANTIDAD INT NOT NULL,
SUBTOTAL MONEY CHECK(SUBTOTAL > 0)
PRIMARY KEY (ID,IDCARRITO)
)
go

Create table TiposPedidos(
ID int not null primary key identity(1,1),
Nombre varchar(100) not null
)

go
Create table Pedidos( 
Id bigint not null identity(1,1),
Usuario bigint not null foreign key references Usuarios( ID),
Direccion varchar ( 100) not null,
TelefonoContacto int  null,
EstadoPedido int not null foreign key references TiposPedidos( ID),
Carrito int not null foreign key references Carrito (id)
Primary key(usuario,carrito),
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
--cambie la tabla
--MENSAJE
--INSERT INTO MENSAJES VALUES(1,1,'QUISIERA SABER SI TIENE STOCK','HOLA ,SI TENEMOS')
--INSERT INTO MENSAJES VALUES(1,1,'ACEPTAN CABAL','HOLA ,POR EL MOMENTO SOLO TRABAJAMOS CON VISA')
--TIPOS PEDIDOS
INSERT INTO TiposPedidos VALUES ('PENDIENTE')
INSERT INTO TiposPedidos VALUES ('EN PROCESO')
INSERT INTO TiposPedidos VALUES ('EN CAMINO')
INSERT INTO TiposPedidos VALUES ('ENTREGADO')
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
SELECT * FROM USUARIOS
--COMPONENTES
INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('PC Armada | Intel Core I3 10100F + 8GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU021 Micro Intel Core I3 10100F 4 Núcleos / 8 Threads HT 4.3Ghz (10ma Gen) LGA1200  
 MOT205 Mother ASUS PRIME H410M-E (10ma Gen) LGA1200  
 RAM022 Memoria RAM NeoForza/HP 8GB DDR4 2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3 
 VGA124 Placa de Video Palit NVIDIA GeForce GT 710 2GB DDR3 
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes 
 SER004 Armado de PC Basic - No Incluye Sistema Operativo ' 

,57999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Notebook ASUS X509MA Intel N4020 | 4GB | 500Gb | 15.6','
PROCESADOR
Marca: Intel / Modelo: Celeron N4020
Núcleos: 2 / Frecuencia: 2.80 GHz
GRÁFICOS
Marca: Intel / Modelo: UHD
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: Hasta 8Gb Reemplazando La Que Trae
ALMACENAMIENTO
Capacidad: 500Gb / Clase: HDD
Puerto M2: Si, solo NVME
PANTALLA
Tamaño: 15.6 / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: Si
USB 2.0: 2 / USB 3.1: 1
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Linux'  
,62999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/6Qb6xKi5QfifPITOy9Jj/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('Notebook Lenovo IP S145 AMD A6 9225 | 4GB | 1TB | Win10 | 15.6 | 81N300N7AR','PROCESADOR
Marca: AMD / Modelo: A6 9225
Núcleos: 2 / Frecuencia: 3.1GHz 
GRÁFICOS
Marca: AMD Radeon / Modelo: R4
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: 1 Slot Ocupado (Puede Reemplazar RAM Hasta 8Gb)
ALMACENAMIENTO
Capacidad: 1TB / Clase: HDD
Puerto M2: Si, NVME
PANTALLA
Tamaño: 15.6" / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: No
USB 2.0: 1 / USB 3.1: 2
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Windows 10 Home 64bits'  
,66999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/ghTK94Sfcb0iqdPzIyZe/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX','Garantia de 12 meses'
,25999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/skzKBEUHDOtZQWJ6AkMG/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro AMD Ryzen 5 3600 - 6 Núcleos / 12 Threads 4.2Ghz AM4','Garantia de 12 meses'
,36999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/kanaXeWTnCPgAR6bhe6N/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I7 11700F 8 Núcleos / 16 Threads HT 4.9Ghz (11va Gen) LGA1200','Garantia de 12 meses'
,47999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/27XhOV7630M2JfOzHdWk/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I3 10105F 4 Núcleos / 8 Threads HT 4.4Ghz (10ma Gen) LGA1200','Garantia de 12 meses'
,18999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/7X7nDz9qUW68sVjNeKjh/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('PC Armada | Intel Core I3 10100F + 8GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU021 Micro Intel Core I3 10100F 4 Núcleos / 8 Threads HT 4.3Ghz (10ma Gen) LGA1200  
 MOT205 Mother ASUS PRIME H410M-E (10ma Gen) LGA1200  
 RAM022 Memoria RAM NeoForza/HP 8GB DDR4 2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3 
 VGA124 Placa de Video Palit NVIDIA GeForce GT 710 2GB DDR3 
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes 
 SER004 Armado de PC Basic - No Incluye Sistema Operativo ' 

,57999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Notebook ASUS X509MA Intel N4020 | 4GB | 500Gb | 15.6','
PROCESADOR
Marca: Intel / Modelo: Celeron N4020
Núcleos: 2 / Frecuencia: 2.80 GHz
GRÁFICOS
Marca: Intel / Modelo: UHD
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: Hasta 8Gb Reemplazando La Que Trae
ALMACENAMIENTO
Capacidad: 500Gb / Clase: HDD
Puerto M2: Si, solo NVME
PANTALLA
Tamaño: 15.6 / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: Si
USB 2.0: 2 / USB 3.1: 1
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Linux'  
,62999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/6Qb6xKi5QfifPITOy9Jj/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('Notebook Lenovo IP S145 AMD A6 9225 | 4GB | 1TB | Win10 | 15.6 | 81N300N7AR','PROCESADOR
Marca: AMD / Modelo: A6 9225
Núcleos: 2 / Frecuencia: 3.1GHz 
GRÁFICOS
Marca: AMD Radeon / Modelo: R4
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: 1 Slot Ocupado (Puede Reemplazar RAM Hasta 8Gb)
ALMACENAMIENTO
Capacidad: 1TB / Clase: HDD
Puerto M2: Si, NVME
PANTALLA
Tamaño: 15.6" / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: No
USB 2.0: 1 / USB 3.1: 2
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Windows 10 Home 64bits'  
,66999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/ghTK94Sfcb0iqdPzIyZe/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX','Garantia de 12 meses'
,25999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/skzKBEUHDOtZQWJ6AkMG/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro AMD Ryzen 5 3600 - 6 Núcleos / 12 Threads 4.2Ghz AM4','Garantia de 12 meses'
,36999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/kanaXeWTnCPgAR6bhe6N/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I7 11700F 8 Núcleos / 16 Threads HT 4.9Ghz (11va Gen) LGA1200','Garantia de 12 meses'
,47999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/27XhOV7630M2JfOzHdWk/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I3 10105F 4 Núcleos / 8 Threads HT 4.4Ghz (10ma Gen) LGA1200','Garantia de 12 meses'
,18999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/7X7nDz9qUW68sVjNeKjh/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('PC Armada | Intel Core I3 10100F + 8GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU021 Micro Intel Core I3 10100F 4 Núcleos / 8 Threads HT 4.3Ghz (10ma Gen) LGA1200  
 MOT205 Mother ASUS PRIME H410M-E (10ma Gen) LGA1200  
 RAM022 Memoria RAM NeoForza/HP 8GB DDR4 2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3 
 VGA124 Placa de Video Palit NVIDIA GeForce GT 710 2GB DDR3 
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes 
 SER004 Armado de PC Basic - No Incluye Sistema Operativo ' 

,57999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Notebook ASUS X509MA Intel N4020 | 4GB | 500Gb | 15.6','
PROCESADOR
Marca: Intel / Modelo: Celeron N4020
Núcleos: 2 / Frecuencia: 2.80 GHz
GRÁFICOS
Marca: Intel / Modelo: UHD
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: Hasta 8Gb Reemplazando La Que Trae
ALMACENAMIENTO
Capacidad: 500Gb / Clase: HDD
Puerto M2: Si, solo NVME
PANTALLA
Tamaño: 15.6 / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: Si
USB 2.0: 2 / USB 3.1: 1
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Linux'  
,62999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/6Qb6xKi5QfifPITOy9Jj/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('Notebook Lenovo IP S145 AMD A6 9225 | 4GB | 1TB | Win10 | 15.6 | 81N300N7AR','PROCESADOR
Marca: AMD / Modelo: A6 9225
Núcleos: 2 / Frecuencia: 3.1GHz 
GRÁFICOS
Marca: AMD Radeon / Modelo: R4
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: 1 Slot Ocupado (Puede Reemplazar RAM Hasta 8Gb)
ALMACENAMIENTO
Capacidad: 1TB / Clase: HDD
Puerto M2: Si, NVME
PANTALLA
Tamaño: 15.6" / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: No
USB 2.0: 1 / USB 3.1: 2
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Windows 10 Home 64bits'  
,66999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/ghTK94Sfcb0iqdPzIyZe/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX','Garantia de 12 meses'
,25999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/skzKBEUHDOtZQWJ6AkMG/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro AMD Ryzen 5 3600 - 6 Núcleos / 12 Threads 4.2Ghz AM4','Garantia de 12 meses'
,36999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/kanaXeWTnCPgAR6bhe6N/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I7 11700F 8 Núcleos / 16 Threads HT 4.9Ghz (11va Gen) LGA1200','Garantia de 12 meses'
,47999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/27XhOV7630M2JfOzHdWk/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I3 10105F 4 Núcleos / 8 Threads HT 4.4Ghz (10ma Gen) LGA1200','Garantia de 12 meses'
,18999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/7X7nDz9qUW68sVjNeKjh/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('PC Armada | Intel Core I3 10100F + 8GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU021 Micro Intel Core I3 10100F 4 Núcleos / 8 Threads HT 4.3Ghz (10ma Gen) LGA1200  
 MOT205 Mother ASUS PRIME H410M-E (10ma Gen) LGA1200  
 RAM022 Memoria RAM NeoForza/HP 8GB DDR4 2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3 
 VGA124 Placa de Video Palit NVIDIA GeForce GT 710 2GB DDR3 
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes 
 SER004 Armado de PC Basic - No Incluye Sistema Operativo ' 

,57999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Notebook ASUS X509MA Intel N4020 | 4GB | 500Gb | 15.6','
PROCESADOR
Marca: Intel / Modelo: Celeron N4020
Núcleos: 2 / Frecuencia: 2.80 GHz
GRÁFICOS
Marca: Intel / Modelo: UHD
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: Hasta 8Gb Reemplazando La Que Trae
ALMACENAMIENTO
Capacidad: 500Gb / Clase: HDD
Puerto M2: Si, solo NVME
PANTALLA
Tamaño: 15.6 / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: Si
USB 2.0: 2 / USB 3.1: 1
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Linux'  
,62999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/6Qb6xKi5QfifPITOy9Jj/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('Notebook Lenovo IP S145 AMD A6 9225 | 4GB | 1TB | Win10 | 15.6 | 81N300N7AR','PROCESADOR
Marca: AMD / Modelo: A6 9225
Núcleos: 2 / Frecuencia: 3.1GHz 
GRÁFICOS
Marca: AMD Radeon / Modelo: R4
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: 1 Slot Ocupado (Puede Reemplazar RAM Hasta 8Gb)
ALMACENAMIENTO
Capacidad: 1TB / Clase: HDD
Puerto M2: Si, NVME
PANTALLA
Tamaño: 15.6" / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: No
USB 2.0: 1 / USB 3.1: 2
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Windows 10 Home 64bits'  
,66999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/ghTK94Sfcb0iqdPzIyZe/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX','Garantia de 12 meses'
,25999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/skzKBEUHDOtZQWJ6AkMG/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro AMD Ryzen 5 3600 - 6 Núcleos / 12 Threads 4.2Ghz AM4','Garantia de 12 meses'
,36999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/kanaXeWTnCPgAR6bhe6N/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I7 11700F 8 Núcleos / 16 Threads HT 4.9Ghz (11va Gen) LGA1200','Garantia de 12 meses'
,47999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/27XhOV7630M2JfOzHdWk/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I3 10105F 4 Núcleos / 8 Threads HT 4.4Ghz (10ma Gen) LGA1200','Garantia de 12 meses'
,18999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/7X7nDz9qUW68sVjNeKjh/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('PC Armada | Intel Core I3 10100F + 8GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU021 Micro Intel Core I3 10100F 4 Núcleos / 8 Threads HT 4.3Ghz (10ma Gen) LGA1200  
 MOT205 Mother ASUS PRIME H410M-E (10ma Gen) LGA1200  
 RAM022 Memoria RAM NeoForza/HP 8GB DDR4 2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3 
 VGA124 Placa de Video Palit NVIDIA GeForce GT 710 2GB DDR3 
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes 
 SER004 Armado de PC Basic - No Incluye Sistema Operativo ' 

,57999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Notebook ASUS X509MA Intel N4020 | 4GB | 500Gb | 15.6','
PROCESADOR
Marca: Intel / Modelo: Celeron N4020
Núcleos: 2 / Frecuencia: 2.80 GHz
GRÁFICOS
Marca: Intel / Modelo: UHD
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: Hasta 8Gb Reemplazando La Que Trae
ALMACENAMIENTO
Capacidad: 500Gb / Clase: HDD
Puerto M2: Si, solo NVME
PANTALLA
Tamaño: 15.6 / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: Si
USB 2.0: 2 / USB 3.1: 1
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Linux'  
,62999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/6Qb6xKi5QfifPITOy9Jj/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('Notebook Lenovo IP S145 AMD A6 9225 | 4GB | 1TB | Win10 | 15.6 | 81N300N7AR','PROCESADOR
Marca: AMD / Modelo: A6 9225
Núcleos: 2 / Frecuencia: 3.1GHz 
GRÁFICOS
Marca: AMD Radeon / Modelo: R4
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: 1 Slot Ocupado (Puede Reemplazar RAM Hasta 8Gb)
ALMACENAMIENTO
Capacidad: 1TB / Clase: HDD
Puerto M2: Si, NVME
PANTALLA
Tamaño: 15.6" / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: No
USB 2.0: 1 / USB 3.1: 2
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Windows 10 Home 64bits'  
,66999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/ghTK94Sfcb0iqdPzIyZe/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX','Garantia de 12 meses'
,25999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/skzKBEUHDOtZQWJ6AkMG/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro AMD Ryzen 5 3600 - 6 Núcleos / 12 Threads 4.2Ghz AM4','Garantia de 12 meses'
,36999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/kanaXeWTnCPgAR6bhe6N/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I7 11700F 8 Núcleos / 16 Threads HT 4.9Ghz (11va Gen) LGA1200','Garantia de 12 meses'
,47999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/27XhOV7630M2JfOzHdWk/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I3 10105F 4 Núcleos / 8 Threads HT 4.4Ghz (10ma Gen) LGA1200','Garantia de 12 meses'
,18999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/7X7nDz9qUW68sVjNeKjh/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('PC Armada | Intel Core I3 10100F + 8GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU021 Micro Intel Core I3 10100F 4 Núcleos / 8 Threads HT 4.3Ghz (10ma Gen) LGA1200  
 MOT205 Mother ASUS PRIME H410M-E (10ma Gen) LGA1200  
 RAM022 Memoria RAM NeoForza/HP 8GB DDR4 2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3 
 VGA124 Placa de Video Palit NVIDIA GeForce GT 710 2GB DDR3 
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes 
 SER004 Armado de PC Basic - No Incluye Sistema Operativo ' 

,57999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Notebook ASUS X509MA Intel N4020 | 4GB | 500Gb | 15.6','
PROCESADOR
Marca: Intel / Modelo: Celeron N4020
Núcleos: 2 / Frecuencia: 2.80 GHz
GRÁFICOS
Marca: Intel / Modelo: UHD
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: Hasta 8Gb Reemplazando La Que Trae
ALMACENAMIENTO
Capacidad: 500Gb / Clase: HDD
Puerto M2: Si, solo NVME
PANTALLA
Tamaño: 15.6 / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: Si
USB 2.0: 2 / USB 3.1: 1
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Linux'  
,62999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/6Qb6xKi5QfifPITOy9Jj/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('Notebook Lenovo IP S145 AMD A6 9225 | 4GB | 1TB | Win10 | 15.6 | 81N300N7AR','PROCESADOR
Marca: AMD / Modelo: A6 9225
Núcleos: 2 / Frecuencia: 3.1GHz 
GRÁFICOS
Marca: AMD Radeon / Modelo: R4
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: 1 Slot Ocupado (Puede Reemplazar RAM Hasta 8Gb)
ALMACENAMIENTO
Capacidad: 1TB / Clase: HDD
Puerto M2: Si, NVME
PANTALLA
Tamaño: 15.6" / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: No
USB 2.0: 1 / USB 3.1: 2
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Windows 10 Home 64bits'  
,66999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/ghTK94Sfcb0iqdPzIyZe/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX','Garantia de 12 meses'
,25999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/skzKBEUHDOtZQWJ6AkMG/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro AMD Ryzen 5 3600 - 6 Núcleos / 12 Threads 4.2Ghz AM4','Garantia de 12 meses'
,36999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/kanaXeWTnCPgAR6bhe6N/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I7 11700F 8 Núcleos / 16 Threads HT 4.9Ghz (11va Gen) LGA1200','Garantia de 12 meses'
,47999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/27XhOV7630M2JfOzHdWk/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I3 10105F 4 Núcleos / 8 Threads HT 4.4Ghz (10ma Gen) LGA1200','Garantia de 12 meses'
,18999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/7X7nDz9qUW68sVjNeKjh/imagen',1,1,1,1,7) 


INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('PC Armada | Intel Core I3 10100F + 8GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
 CPU021 Micro Intel Core I3 10100F 4 Núcleos / 8 Threads HT 4.3Ghz (10ma Gen) LGA1200  
 MOT205 Mother ASUS PRIME H410M-E (10ma Gen) LGA1200  
 RAM022 Memoria RAM NeoForza/HP 8GB DDR4 2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3 
 VGA124 Placa de Video Palit NVIDIA GeForce GT 710 2GB DDR3 
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes 
 SER004 Armado de PC Basic - No Incluye Sistema Operativo ' 

,57999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('PC Armada | AMD Athlon 3000G + 4GB + SSD','Imágenes de carácter ilustrativo, las PC son armadas y poseen sistema operativo. No se incluyen monitor ni periféricos, sólo los componentes detallados debajo. Si desea armar una configuración a su medida podrá hacerla desde nuestro Armador de PC.
CPU067 Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX 
 MOT076 Mother MSI A320M-A PRO M2 AM4  
 RAM034 Memoria RAM Crucial/Oloy 4GB DDR4 2400/2666Mhz PC  
 HDD056 Disco SSD Gigabyte 240GB SATA3  
 SER004 Armado de PC Basic - No Incluye Sistema Operativo
 GAB003 Gabinete KIT ATX C/Fuente 500w. Teclado. Mouse y Parlantes'  
,45499.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/EshTCUvq6gwsm3Ivrjh7/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Notebook ASUS X509MA Intel N4020 | 4GB | 500Gb | 15.6','
PROCESADOR
Marca: Intel / Modelo: Celeron N4020
Núcleos: 2 / Frecuencia: 2.80 GHz
GRÁFICOS
Marca: Intel / Modelo: UHD
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: Hasta 8Gb Reemplazando La Que Trae
ALMACENAMIENTO
Capacidad: 500Gb / Clase: HDD
Puerto M2: Si, solo NVME
PANTALLA
Tamaño: 15.6 / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: Si
USB 2.0: 2 / USB 3.1: 1
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Linux'  
,62999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/6Qb6xKi5QfifPITOy9Jj/imagen',1,1,1,1,7)
  
  INSERT INTO COMPONENTES 
VALUES('Notebook Lenovo IP S145 AMD A6 9225 | 4GB | 1TB | Win10 | 15.6 | 81N300N7AR','PROCESADOR
Marca: AMD / Modelo: A6 9225
Núcleos: 2 / Frecuencia: 3.1GHz 
GRÁFICOS
Marca: AMD Radeon / Modelo: R4
MEMORIA
Capacidad: 4GB / Tipo: DDR4 SODIMM
Expansión: 1 Slot Ocupado (Puede Reemplazar RAM Hasta 8Gb)
ALMACENAMIENTO
Capacidad: 1TB / Clase: HDD
Puerto M2: Si, NVME
PANTALLA
Tamaño: 15.6" / Resolución: 1366x768
CONECTIVIDAD
WiFi: Si, AC / Bluetooth: Si, 4.2
HDMI: Si / Red: No
USB 2.0: 1 / USB 3.1: 2
Grabadora DVD: No / Lector Memorias: Si
SISTEMA OPERATIVO
OS: Windows 10 Home 64bits'  
,66999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/ghTK94Sfcb0iqdPzIyZe/imagen',1,1,1,1,7)

INSERT INTO COMPONENTES 
VALUES('Micro AMD Athlon 3000G Vega 3 DualCore AM4 BOX','Garantia de 12 meses'
,25999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/skzKBEUHDOtZQWJ6AkMG/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro AMD Ryzen 5 3600 - 6 Núcleos / 12 Threads 4.2Ghz AM4','Garantia de 12 meses'
,36999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/kanaXeWTnCPgAR6bhe6N/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I7 11700F 8 Núcleos / 16 Threads HT 4.9Ghz (11va Gen) LGA1200','Garantia de 12 meses'
,47999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/27XhOV7630M2JfOzHdWk/imagen',1,1,1,1,7) 

INSERT INTO COMPONENTES 
VALUES('Micro Intel Core I3 10105F 4 Núcleos / 8 Threads HT 4.4Ghz (10ma Gen) LGA1200','Garantia de 12 meses'
,18999.00,'https://s3-sa-east-1.amazonaws.com/saasargentina/7X7nDz9qUW68sVjNeKjh/imagen',1,1,1,1,7) 

