Create DataBase BANQUETZAL;

USE BANQUETZAL;

CREATE TABLE Agencia
  (
    IdAgencia INTEGER NOT NULL ,
    Nombre    VARCHAR (50) NOT NULL ,
    Direccion VARCHAR (50) NOT NULL ,
    Fondos    NUMERIC (7,2) NOT NULL
  ) ;
  
ALTER TABLE Agencia ADD CONSTRAINT Agencia_PK PRIMARY KEY ( IdAgencia ) ;
ALTER TABLE Agencia AUTO_INCREMENT = 1000 ;

CREATE TABLE AsociacionCuenta
  (
    IdAsociacion    INTEGER NOT NULL ,
    CuentaPrincipal INTEGER NOT NULL ,
    CuentaAsociada  INTEGER NOT NULL
  ) ;
  
ALTER TABLE AsociacionCuenta ADD CONSTRAINT CuentaAsociada_PK PRIMARY KEY ( IdAsociacion ) ;
ALTER TABLE AsociacionCuenta AUTO_INCREMENT = 1000 ;

CREATE TABLE Canje
  (
    IdCanje    INTEGER NOT NULL ,
    CUICliente NUMERIC (13) NOT NULL ,
    IdProducto INTEGER NOT NULL
  ) ;
  
ALTER TABLE Canje ADD CONSTRAINT Canje_PK PRIMARY KEY ( IdCanje ) ;
ALTER TABLE Canje AUTO_INCREMENT = 1000 ;

CREATE TABLE Cheque
  (
    IdCheque        INTEGER NOT NULL ,
    Cuenta_IdCuenta INTEGER NOT NULL
  ) ;
  
ALTER TABLE Cheque ADD CONSTRAINT Cheque_PK PRIMARY KEY ( IdCheque ) ;
ALTER TABLE Cheque AUTO_INCREMENT = 1000 ;

CREATE TABLE Cliente
  (
    CUI        NUMERIC (13) NOT NULL ,
    Contrasena VARCHAR (25) NOT NULL ,
    Nombres    VARCHAR (50) NOT NULL ,
    Apellidos  VARCHAR (50) NOT NULL ,
    Nacimiento DATE NOT NULL ,
    Puntos     INTEGER NOT NULL ,
    Salario    NUMERIC (7,3)
  ) ;
  
ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY ( CUI ) ;
ALTER TABLE Cliente AUTO_INCREMENT = 1000 ;

CREATE TABLE ClienteCuenta
  (
    CUICliente        NUMERIC (13) NOT NULL ,
    CUIVicePresidente NUMERIC (13) ,
    CUIContador       NUMERIC (13) ,
    IdCuenta          INTEGER NOT NULL
  ) ;
  
ALTER TABLE ClienteCuenta ADD CONSTRAINT ClienteCuenta_PK PRIMARY KEY ( CUICliente, IdCuenta ) ;

CREATE TABLE Cuenta
  (
    IdCuenta       INTEGER NOT NULL ,
    Fondos         NUMERIC (9,2) NOT NULL ,
    Individualidad CHAR (1) NOT NULL ,
    IdTipoCuenta     INTEGER NOT NULL ,
    Estado         INTEGER NOT NULL
  ) ;
  
ALTER TABLE Cuenta ADD CONSTRAINT Cuenta_PK PRIMARY KEY ( IdCuenta ) ;
ALTER TABLE Cuenta AUTO_INCREMENT = 1000 ;

CREATE TABLE EstadoCuenta
  (
    IdEstadoCuenta INTEGER NOT NULL ,
    Nombre         VARCHAR (10) NOT NULL ,
    Descripcion    VARCHAR (75)
  ) ;
  
ALTER TABLE EstadoCuenta ADD CONSTRAINT EstadoCuenta_PK PRIMARY KEY ( IdEstadoCuenta ) ;
ALTER TABLE EstadoCuenta AUTO_INCREMENT = 1000 ;

CREATE TABLE EstadoPrestamo
  (
    IdEstadoPrestamo INTEGER NOT NULL ,
    Nombre           VARCHAR (23) NOT NULL ,
    Descripcion      VARCHAR (75) NOT NULL
  ) ;
  
ALTER TABLE EstadoPrestamo ADD CONSTRAINT EstadoPrestamo_PK PRIMARY KEY ( IdEstadoPrestamo ) ;
ALTER TABLE EstadoPrestamo AUTO_INCREMENT = 1000 ;

CREATE TABLE ModalidadPago
  (
    IdModalidad INTEGER NOT NULL ,
    Nombre      VARCHAR (10) NOT NULL ,
    Descripcion VARCHAR (50)
  ) ;
  
ALTER TABLE ModalidadPago ADD CONSTRAINT ModalidadPago_PK PRIMARY KEY ( IdModalidad ) ;
ALTER TABLE ModalidadPago AUTO_INCREMENT = 1000 ;

CREATE TABLE Operacion
  (
    IdRegistro          INTEGER NOT NULL ,
    Fecha               DATE NOT NULL ,
    CuentaTransferencia INTEGER ,
    NombreCambioCheque  VARCHAR (50) ,
    IdCuenta            INTEGER NOT NULL ,
    IdTipoOperacion       INTEGER NOT NULL ,
    IdTrabajador        INTEGER NOT NULL
  ) ;
  
ALTER TABLE Operacion ADD CONSTRAINT Operacion_PK PRIMARY KEY ( IdRegistro ) ;
ALTER TABLE Operacion AUTO_INCREMENT = 1000 ;

CREATE TABLE Prestamo
  (
    IdPrestamo     INTEGER NOT NULL ,
    Saldo          NUMERIC (7,2) NOT NULL ,
    IdEstadoPrestamo INTEGER NOT NULL ,
    IdModalidadPago  INTEGER NOT NULL ,
    IdTipoPrestamo   INTEGER NOT NULL ,
    CUICliente     NUMERIC (13) NOT NULL
  ) ;
  
ALTER TABLE Prestamo ADD CONSTRAINT Prestamo_PK PRIMARY KEY ( IdPrestamo ) ;
ALTER TABLE Prestamo AUTO_INCREMENT = 1000 ;

CREATE TABLE Producto
  (
    IdProducto  INTEGER NOT NULL ,
    Nombre      VARCHAR (25) NOT NULL ,
    ValorPuntos INTEGER NOT NULL
  ) ;
  
ALTER TABLE Producto ADD CONSTRAINT Producto_PK PRIMARY KEY ( IdProducto ) ;
ALTER TABLE Producto AUTO_INCREMENT = 1000 ;

CREATE TABLE Proveedor
  (
    IdProveedor INTEGER NOT NULL ,
    Nombre      VARCHAR (25) NOT NULL ,
    Direccion   VARCHAR (50) NOT NULL
  ) ;
  
ALTER TABLE Proveedor ADD CONSTRAINT Proveedor_PK PRIMARY KEY ( IdProveedor ) ;
ALTER TABLE Producto AUTO_INCREMENT = 1000 ;

CREATE TABLE ProveedorProducto
  (
    IdProveedorProducto INTEGER NOT NULL ,
    Stock               INTEGER NOT NULL ,
    IdProveedor         INTEGER NOT NULL ,
    IdProducto          INTEGER NOT NULL
  ) ;
  
ALTER TABLE ProveedorProducto ADD CONSTRAINT ProveedorProducto_PK PRIMARY KEY ( IdProveedorProducto ) ;

ALTER TABLE ProveedorProducto AUTO_INCREMENT = 1000 ;

CREATE TABLE Rol
  (
    IdRol       INTEGER NOT NULL ,
    Nombre      VARCHAR (19) NOT NULL ,
    Descripcion VARCHAR (75)
  ) ;
  
ALTER TABLE Rol ADD CONSTRAINT Rol_PK PRIMARY KEY ( IdRol ) ;
ALTER TABLE Rol AUTO_INCREMENT = 1000 ;

CREATE TABLE TipoCuenta
  (
    IdTipoCuenta INTEGER NOT NULL ,
    Nombre       VARCHAR (25) NOT NULL ,
    TasaInteres  NUMERIC (3,2) NOT NULL ,
    Descripcion  VARCHAR (75)
  ) ;
  
ALTER TABLE TipoCuenta ADD CONSTRAINT TipoCuenta_PK PRIMARY KEY ( IdTipoCuenta ) ;
ALTER TABLE TipoCuenta AUTO_INCREMENT = 1000 ;

CREATE TABLE TipoOperacion
  (
    IdTipoOperacion INTEGER NOT NULL ,
    Nombre          VARCHAR (20) NOT NULL ,
    Puntos          INTEGER NOT NULL ,
    Descripcion     VARCHAR (75)
  ) ;
  
ALTER TABLE TipoOperacion ADD CONSTRAINT TipoOperacion_PK PRIMARY KEY ( IdTipoOperacion ) ;
ALTER TABLE TipoOperacion AUTO_INCREMENT = 1000 ;

CREATE TABLE TipoPrestamo
  (
    IdTipoPrestamo INTEGER NOT NULL ,
    Nombre         VARCHAR (25) NOT NULL ,
    TasaInteres    NUMERIC (3,2) NOT NULL ,
    Descripcion    VARCHAR (50)
  ) ;
  
ALTER TABLE TipoPrestamo ADD CONSTRAINT TipoPrestamo_PK PRIMARY KEY ( IdTipoPrestamo ) ;
ALTER TABLE TipoPrestamo AUTO_INCREMENT = 1000 ;

CREATE TABLE Trabajador
  (
    IdTrabajador            INTEGER NOT NULL ,
    Usuario                 VARCHAR (50) NOT NULL ,
    Contrasena              VARCHAR (25) NOT NULL ,
    Nombre                  VARCHAR (50) NOT NULL ,
    Telefono                INTEGER NOT NULL ,
    Direccion               VARCHAR (50) NOT NULL ,
    Rol_IdRol               INTEGER NOT NULL ,
    Agencia_IdAgencia       INTEGER NOT NULL ,
    Trabajador_IdTrabajador INTEGER
  ) ;
  
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_PK PRIMARY KEY ( IdTrabajador ) ;
ALTER TABLE Trabajador AUTO_INCREMENT = 1000 ;

ALTER TABLE AsociacionCuenta ADD CONSTRAINT AsociacionCuenta_Cuenta_FK FOREIGN KEY ( CuentaPrincipal ) REFERENCES Cuenta ( IdCuenta ) ;
ALTER TABLE AsociacionCuenta ADD CONSTRAINT AsociacionCuenta_Cuenta_FKv1 FOREIGN KEY ( CuentaAsociada ) REFERENCES Cuenta ( IdCuenta ) ;
ALTER TABLE Canje ADD CONSTRAINT Canje_Cliente_FK FOREIGN KEY ( CUICliente ) REFERENCES Cliente ( CUI ) ;
ALTER TABLE Canje ADD CONSTRAINT Canje_Producto_FK FOREIGN KEY ( IdProducto ) REFERENCES Producto ( IdProducto ) ;
ALTER TABLE Cheque ADD CONSTRAINT Cheque_Cuenta_FK FOREIGN KEY ( Cuenta_IdCuenta ) REFERENCES Cuenta ( IdCuenta ) ;
ALTER TABLE ClienteCuenta ADD CONSTRAINT ClienteCuenta_Cliente_FK FOREIGN KEY ( CUICliente ) REFERENCES Cliente ( CUI ) ;
ALTER TABLE ClienteCuenta ADD CONSTRAINT ClienteCuenta_Cuenta_FK FOREIGN KEY ( IdCuenta ) REFERENCES Cuenta ( IdCuenta ) ;
ALTER TABLE Cuenta ADD CONSTRAINT Cuenta_EstadoCuenta_FK FOREIGN KEY ( Estado ) REFERENCES EstadoCuenta ( IdEstadoCuenta ) ;
ALTER TABLE Cuenta ADD CONSTRAINT Cuenta_TipoCuenta_FK FOREIGN KEY ( IdTipoCuenta ) REFERENCES TipoCuenta ( IdTipoCuenta ) ;
ALTER TABLE Operacion ADD CONSTRAINT Operacion_Cuenta_FK FOREIGN KEY ( IdCuenta ) REFERENCES Cuenta ( IdCuenta ) ;
ALTER TABLE Operacion ADD CONSTRAINT Operacion_TipoOperacion_FK FOREIGN KEY ( IdTipoOperacion ) REFERENCES TipoOperacion ( IdTipoOperacion ) ;
ALTER TABLE Operacion ADD CONSTRAINT Operacion_Trabajador_FK FOREIGN KEY ( IdTrabajador ) REFERENCES Trabajador ( IdTrabajador ) ;
ALTER TABLE Prestamo ADD CONSTRAINT Prestamo_Cliente_FK FOREIGN KEY ( CUICliente ) REFERENCES Cliente ( CUI ) ;
ALTER TABLE Prestamo ADD CONSTRAINT Prestamo_EstadoPrestamo_FK FOREIGN KEY ( IdEstadoPrestamo ) REFERENCES EstadoPrestamo ( IdEstadoPrestamo ) ;
ALTER TABLE Prestamo ADD CONSTRAINT Prestamo_ModalidadPago_FK FOREIGN KEY ( IdModalidadPago ) REFERENCES ModalidadPago ( IdModalidad ) ;
ALTER TABLE Prestamo ADD CONSTRAINT Prestamo_TipoPrestamo_FK FOREIGN KEY ( IdTipoPrestamo ) REFERENCES TipoPrestamo ( IdTipoPrestamo ) ;
ALTER TABLE ProveedorProducto ADD CONSTRAINT ProveedorProducto_Producto_FK FOREIGN KEY ( IdProducto ) REFERENCES Producto ( IdProducto ) ;
ALTER TABLE ProveedorProducto ADD CONSTRAINT ProveedorProducto_Proveedor_FK FOREIGN KEY ( IdProveedor ) REFERENCES Proveedor ( IdProveedor ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_Agencia_FK FOREIGN KEY ( Agencia_IdAgencia ) REFERENCES Agencia ( IdAgencia ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_Rol_FK FOREIGN KEY ( Rol_IdRol ) REFERENCES Rol ( IdRol ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_Trabajador_FK FOREIGN KEY ( Trabajador_IdTrabajador ) REFERENCES Trabajador ( IdTrabajador ) ;
