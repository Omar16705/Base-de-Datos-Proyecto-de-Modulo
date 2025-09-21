CREATE DATABASE Sistema_de_Inventario
go 
--Creacion de la base de datos

USE Sistema_de_Inventario
go
--Usar la base de datos

Create table ROL(
idRol int identity(1,1) primary key,
NombreRol varchar (30));
go
--Creacion de la tabla rol
inserT into ROL values ('Administrador'),('Vendedor'),('Almacenista'); 

create table Usuarios (
idUsuario int identity(1,1) primary key,
NombreCompletoUsuario varchar (50)not null,
correoUsuario varchar (50) unique not null,
Clave varchar (100) not null,
rol_id int not null,
foreign key (rol_id) references ROL(idRol));
go
--Creacion de la tabla Usuarios

select * from Usuarios



Create table Proveedores (
idProveedor int primary key identity(1,1),
DocumentoProveedor varchar (100) unique not null,
NombreProveedor varchar (50) not null,
CorreoProveedor varchar (50) unique not null,
TelefonoProveedor varchar (50) not null);
go
--Creacion de la tabla Proveedor

insert into Proveedores values ('PR-2025001','Omar Perez','omar@gmail.com','7106-1920');


Create table Categoria(
idCategoria int primary key identity (1,1),
NombreCategoria varchar (100) not null);
go


insert into Categoria values ('En existencia');


Create table Productos (
idProducto int primary key identity (1,1) ,
CodigoProducto varchar (50) unique not null,
NombreProducto varchar (80) not null,
categoria_id int not null,
foreign key (categoria_id) references Categoria(idCategoria), 
Proveedor_id int not null,
foreign key (Proveedor_id) references Proveedores(idProveedor),
Stock int not null default 0,
PrecioCompra decimal (10,2) default 0,
PrecioVenta decimal (10,2) default 0
);
go


insert into Productos VALUES ('CPR-2025001', 'Soda',1,1,1,19.99,20.00);

select * from Productos




create view vw_Login
as
SELECT        dbo.Usuarios.Clave, dbo.Usuarios.NombreCompletoUsuario, dbo.Usuarios.correoUsuario, dbo.ROL.NombreRol
FROM            dbo.ROL INNER JOIN
                         dbo.Usuarios ON dbo.ROL.idRol = dbo.Usuarios.rol_id






                         create view vw_VerUsuarios
                         as
 SELECT       dbo.Usuarios.idUsuario,  dbo.Usuarios.NombreCompletoUsuario, dbo.Usuarios.correoUsuario, dbo.Usuarios.Clave, dbo.ROL.NombreRol
FROM            dbo.ROL INNER JOIN
                         dbo.Usuarios ON dbo.ROL.idRol = dbo.Usuarios.rol_id


                        