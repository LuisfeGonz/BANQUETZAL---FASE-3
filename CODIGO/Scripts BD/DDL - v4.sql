CREATE DATABASE BANQUETZAL;

USE BANQUETZAL;

CREATE TABLE Agencia
(
	IdAgencia INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nombre    VARCHAR (50) NOT NULL ,
	Direccion VARCHAR (50) NOT NULL ,
   Fondos    BIGINT NOT NULL
) ;

CREATE TABLE AsociacionCuenta
(
	-- IdAsociacion   INTEGER NOT NULL AUTO_INCREMENT,
   CUICliente     NUMERIC (13) NOT NULL ,
	CuentaAsociada INTEGER NOT NULL
) ;
  
ALTER TABLE AsociacionCuenta ADD CONSTRAINT CuentaAsociada_PK PRIMARY KEY ( CUICliente, CuentaAsociada ) ;

CREATE TABLE Canje
(
   IdCanje    INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   CUICliente NUMERIC (13) NOT NULL ,
   IdProducto INTEGER NOT NULL
) ;

CREATE TABLE Cheque
(
   IdCheque INTEGER NOT NULL ,
   IdCuenta INTEGER NOT NULL ,
   IdEstado INTEGER NOT NULL
) ;
  
ALTER TABLE Cheque ADD CONSTRAINT Cheque_PK PRIMARY KEY ( IdCheque, IdCuenta ) ;

CREATE TABLE Cliente
(
   CUI        NUMERIC (13) NOT NULL PRIMARY KEY,
   Usuario    VARCHAR (50) NOT NULL ,
   Contrasena VARCHAR (25) NOT NULL ,
   Nombres    VARCHAR (50) NOT NULL ,
   Apellidos  VARCHAR (50) NOT NULL ,
   Nacimiento DATE NOT NULL ,
   Puntos     INTEGER NOT NULL
) ;

CREATE TABLE ClienteCuenta
(
   -- IdAsignacion INTEGER NOT NULL AUTO_INCREMENT,
   CUICliente   NUMERIC (13) NOT NULL ,
   IdCuenta     INTEGER NOT NULL ,
	Salario      NUMERIC (7,2)
) ;
  
ALTER TABLE ClienteCuenta ADD CONSTRAINT ClienteCuenta_PK PRIMARY KEY ( CUICliente, IdCuenta ) ;

CREATE TABLE Cuenta
(
   IdCuenta          INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Fondos            BIGINT NOT NULL ,
   Individualidad    CHAR (1) NOT NULL ,
   IdTipoCuenta      INTEGER NOT NULL ,
   IdEstado          INTEGER NOT NULL ,
   CUIPresidente     NUMERIC (13) ,
   CUIVicepresidente NUMERIC (13) ,
   CUIContador       NUMERIC (13)
) ;

CREATE TABLE Estado
(
   IdEstado    INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre      VARCHAR (15) NOT NULL ,
   Descripcion VARCHAR (75)
) ;

CREATE TABLE EstadoPrestamo
(
   IdEstadoPrestamo INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre           VARCHAR (23) NOT NULL ,
   Descripcion      VARCHAR (75) NOT NULL
) ;

CREATE TABLE ModalidadPago
(
   IdModalidad INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre      VARCHAR (10) NOT NULL ,
   Descripcion VARCHAR (50)
) ;

CREATE TABLE Operacion
(
   IdRegistro            INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Fecha                 DATE NOT NULL ,
   Monto                 NUMERIC (9,2) ,
   CuentaTransferencia   INTEGER ,
   NombreTransaccionista VARCHAR (50) ,
   IdCuenta              INTEGER ,
	CUICliente            NUMERIC (13) ,
   IdTipoOperacion       INTEGER NOT NULL ,
   IdTrabajador          INTEGER NOT NULL
  ) ;

CREATE TABLE Prestamo
(
   IdPrestamo       INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Monto            NUMERIC (7,2) NOT NULL ,
   Saldo            NUMERIC (7,2) NOT NULL ,
   IdEstadoPrestamo INTEGER NOT NULL ,
   IdModalidadPago  INTEGER NOT NULL ,
   IdTipoPrestamo   INTEGER NOT NULL ,
   CUICliente       NUMERIC (13) NOT NULL
) ;

CREATE TABLE Producto
(
   IdProducto  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre      VARCHAR (25) NOT NULL ,
   ValorPuntos INTEGER NOT NULL
) ;

CREATE TABLE Proveedor
(
   IdProveedor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre      VARCHAR (25) NOT NULL ,
   Direccion   VARCHAR (50) NOT NULL
) ;

CREATE TABLE Rol
(
   IdRol       INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre      VARCHAR (19) NOT NULL ,
   Descripcion VARCHAR (75)
) ;

CREATE TABLE Stock
(
   IdStock     INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Cantidad    INTEGER NOT NULL ,
   IdProveedor INTEGER NOT NULL ,
   IdProducto  INTEGER NOT NULL
) ;

CREATE TABLE TipoCuenta
(
   IdTipoCuenta INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre       VARCHAR (25) NOT NULL ,
   TasaInteres  NUMERIC (3,2) NOT NULL ,
   Descripcion  VARCHAR (75)
) ;

CREATE TABLE TipoOperacion
(
   IdTipoOperacion INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre          VARCHAR (20) NOT NULL ,
   Puntos          INTEGER NOT NULL ,
   Descripcion     VARCHAR (75)
) ;

CREATE TABLE TipoPrestamo
(
   IdTipoPrestamo INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Nombre         VARCHAR (25) NOT NULL ,
   TasaInteres    NUMERIC (3,2) NOT NULL ,
   Descripcion    VARCHAR (50)
) ;

CREATE TABLE Trabajador
(
   IdTrabajador INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Usuario      VARCHAR (50) NOT NULL ,
   Contrasena   VARCHAR (25) NOT NULL ,
   Nombre       VARCHAR (50) NOT NULL ,
   Telefono     NUMERIC (8) NOT NULL ,
   Direccion    VARCHAR (50) NOT NULL ,
   IdRol        INTEGER NOT NULL ,
   IdAgencia    INTEGER NOT NULL
) ;

ALTER TABLE AsociacionCuenta ADD CONSTRAINT AsociacionCuenta_Cliente_FK 	FOREIGN KEY ( CUICliente ) 		 REFERENCES Cliente ( CUI ) ;
ALTER TABLE AsociacionCuenta ADD CONSTRAINT AsociacionCuenta_Cuenta_FK  	FOREIGN KEY ( CuentaAsociada ) 	 REFERENCES Cuenta ( IdCuenta ) ;

ALTER TABLE Canje 			  ADD CONSTRAINT Canje_Cliente_FK 			   	FOREIGN KEY ( CUICliente ) 		 REFERENCES Cliente ( CUI ) ;
ALTER TABLE Canje 			  ADD CONSTRAINT Canje_Producto_FK 					FOREIGN KEY ( IdProducto ) 		 REFERENCES Producto ( IdProducto ) ;

ALTER TABLE Cheque 			  ADD CONSTRAINT Cheque_Cuenta_FK 					FOREIGN KEY ( IdCuenta ) 			 REFERENCES Cuenta ( IdCuenta ) ;
ALTER TABLE Cheque 			  ADD CONSTRAINT Cheque_Estado_FK 					FOREIGN KEY ( IdEstado ) 			 REFERENCES Estado ( IdEstado ) ;


ALTER TABLE ClienteCuenta 	  ADD CONSTRAINT ClienteCuenta_Cliente_FK 		FOREIGN KEY ( CUICliente ) 		 REFERENCES Cliente ( CUI ) ;
ALTER TABLE ClienteCuenta 	  ADD CONSTRAINT ClienteCuenta_Cuenta_FK 			FOREIGN KEY ( IdCuenta ) 			 REFERENCES Cuenta ( IdCuenta ) ;

ALTER TABLE Cuenta 			  ADD CONSTRAINT Cuenta_Cliente_FK 					FOREIGN KEY ( CUIPresidente )     REFERENCES Cliente ( CUI ) ;
ALTER TABLE Cuenta 			  ADD CONSTRAINT Cuenta_Cliente_FKv1 				FOREIGN KEY ( CUIVicepresidente ) REFERENCES Cliente ( CUI ) ;
ALTER TABLE Cuenta 			  ADD CONSTRAINT Cuenta_Cliente_FKv2 				FOREIGN KEY ( CUIContador ) 		 REFERENCES Cliente ( CUI ) ;
ALTER TABLE Cuenta 			  ADD CONSTRAINT Cuenta_EstadoCuenta_FK 			FOREIGN KEY ( IdEstado ) 			 REFERENCES Estado ( IdEstado ) ;
ALTER TABLE Cuenta 			  ADD CONSTRAINT Cuenta_TipoCuenta_FK 				FOREIGN KEY ( IdTipoCuenta ) 		 REFERENCES TipoCuenta ( IdTipoCuenta ) ;

ALTER TABLE Operacion 		  ADD CONSTRAINT Operacion_Cliente_FK 				FOREIGN KEY ( CUICliente ) 		 REFERENCES Cliente ( CUI ) ;
ALTER TABLE Operacion 		  ADD CONSTRAINT Operacion_Cuenta_FK 				FOREIGN KEY ( IdCuenta ) 			 REFERENCES Cuenta ( IdCuenta ) ;
ALTER TABLE Operacion 		  ADD CONSTRAINT Operacion_TipoOperacion_FK 		FOREIGN KEY ( IdTipoOperacion ) 	 REFERENCES TipoOperacion ( IdTipoOperacion ) ;
ALTER TABLE Operacion 		  ADD CONSTRAINT Operacion_Trabajador_FK 			FOREIGN KEY ( IdTrabajador ) 		 REFERENCES Trabajador ( IdTrabajador ) ;

ALTER TABLE Prestamo 		  ADD CONSTRAINT Prestamo_Cliente_FK 				FOREIGN KEY ( CUICliente ) 		 REFERENCES Cliente ( CUI ) ;
ALTER TABLE Prestamo 		  ADD CONSTRAINT Prestamo_EstadoPrestamo_FK 		FOREIGN KEY ( IdEstadoPrestamo )  REFERENCES EstadoPrestamo ( IdEstadoPrestamo ) ;
ALTER TABLE Prestamo			  ADD CONSTRAINT Prestamo_ModalidadPago_FK 		FOREIGN KEY ( IdModalidadPago ) 	 REFERENCES ModalidadPago ( IdModalidad ) ;
ALTER TABLE Prestamo			  ADD CONSTRAINT Prestamo_TipoPrestamo_FK 		FOREIGN KEY ( IdTipoPrestamo ) 	 REFERENCES TipoPrestamo ( IdTipoPrestamo ) ;

ALTER TABLE Stock				  ADD CONSTRAINT ProveedorProducto_Producto_FK  FOREIGN KEY ( IdProducto ) 		 REFERENCES Producto ( IdProducto ) ;
ALTER TABLE Stock				  ADD CONSTRAINT ProveedorProducto_Proveedor_FK FOREIGN KEY ( IdProveedor ) 		 REFERENCES Proveedor ( IdProveedor ) ;

ALTER TABLE Trabajador 		  ADD CONSTRAINT Trabajador_Agencia_FK 			FOREIGN KEY ( IdAgencia ) 			 REFERENCES Agencia ( IdAgencia ) ;
ALTER TABLE Trabajador 		  ADD CONSTRAINT Trabajador_Rol_FK 					FOREIGN KEY ( IdRol ) 				 REFERENCES Rol ( IdRol ) ;
