use master
go

if exists(select* from sysdatabases where name='obligatiorio')
begin
	drop database obligatorio
end
go

create database obligatorio
on(
name=obligatorio,
filename='C:\obligatorioweb\base de datos\obligatorio.mdf'
)
go

use obligatorio 
go

---creacion de tablas

create table vehiculos
(
	matricula varchar (7) not null primary key,
	costo money not null,
	marca varchar(50) not null,
	modelo varchar(50) not null,
	año int not null,
	puertas int not null
)
go

create table clientes
(
	ci int not null primary key,
	tarjeta int unique not null,
	nombre varchar (50) not null,
	fechaN smalldatetime not null,
	direccion varchar (50) not null,
	telefono int not null
)
go

create table alquiler
(
	matricula varchar (7) not null foreign key references vehiculos(matricula),
	ci int not null foreign key references clientes(ci),
	codigo int not null primary key identity,
	precio money not null,                                    
	FechaI smalldatetime not null,
	fechaF smalldatetime not null
)
go

create table autos
(
	matricula varchar (7) not null foreign key references vehiculos(matricula),
	anclaje varchar (50) not null
)
go

create table utilitarios
(
	matricula varchar (7) not  null foreign key references vehiculos (matricula),
	capacidad int not null,
	Furgoneta_pickup varchar(50) not null
)
go
------------------------------------------------------  /*insercion de datos*/  -----------------------------------------------------------------------------------

--Clientes /////posiblemente haya que cambiar las fechas de nacimiento
insert clientes (ci,tarjeta,nombre,fechan,direccion,telefono) values (11111111,1111,'Pedro Gonzales','1985/5/20','Nueva Troya 1303',24804656)
insert clientes (ci,tarjeta,nombre,fechan,direccion,telefono) values (22222222,2222,'Jose Morales','1991/7/10','Lafinur 2345',094865521)
insert clientes (ci,tarjeta,nombre,fechan,direccion,telefono) values (33333333,3333,'Adriana Silva','1970/3/24','Martin C. Martinez 6740',22035648)
insert clientes (ci,tarjeta,nombre,fechan,direccion,telefono) values (44444444,4444,'Oscar Perez','1983/10/5','Basilio Araujo 2020',091555231)
insert clientes (ci,tarjeta,nombre,fechan,direccion,telefono) values (55555555,5555,'Florencia Fernandez','1991/9/15','Cuba 1750',28056979)
go

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Vehiculos

--Autos
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SQL2345',70,'Chery','QQ',2011,5)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SAT1529',45,'Chevrolet','Prisma',2012,5)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SMO6363',100,'Volkswagen','Gol',2016,5)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SBG7518',45,'Hyundai','i10',2013,5)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SWE2483',70,'Renault','Logan',2011,4)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SER1515',100,'Renault','Fluence',2017,4)
--Utilitarios
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SBA1238',120,'Nissan','Nv200',2010,5)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SAA5864',150,'Peugeot','Expert',2016,5)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SSH4692',120,' Volkswagen','Caddy',2017,5)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SAD1564',120,'Chevrolet','Montana',2010,2)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SMJ3687',120,'Fiat','Fiorino',1996,2)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('STM6660',150,'Fiat','Fullback',2016,4)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('STF1515',150,'Citroën','SpaceTourer',2017,5)
insert vehiculos (matricula,costo,marca,modelo,año,puertas) values ('SBC7391',150,'JAC','T6',2017,4)
go 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Tabla Utilitarios
insert utilitarios (matricula, capacidad, furgoneta_pickup) values ('SBA1238',720,'Furgoneta')
insert utilitarios (matricula, capacidad, furgoneta_pickup) values ('SAA5864',1188,'Furgoneta')
insert utilitarios (matricula, capacidad, furgoneta_pickup) values ('SSH4692',762,'Furgoneta')
insert utilitarios (matricula, capacidad, furgoneta_pickup) values ('SAD1564',730,'Pick Up')
insert utilitarios (matricula, capacidad, furgoneta_pickup) values ('SMJ3687',500,'Pick Up')
insert utilitarios (matricula, capacidad, furgoneta_pickup) values ('STM6660',1000,'Pick Up')
insert utilitarios (matricula, capacidad, furgoneta_pickup) values ('SBC7391',820,'Pick Up')
insert utilitarios (matricula, capacidad, furgoneta_pickup) values ('STF1515',1400,'Furgoneta')
go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Tabla Autos
insert autos (matricula, anclaje) values ('SQL2345','ISOFIX')
insert autos (matricula, anclaje) values ('SAT1529','Cinturon')
insert autos (matricula, anclaje) values ('SMO6363','Cinturon')
insert autos (matricula, anclaje) values ('SBG7518','Latch')
insert autos (matricula, anclaje) values ('SWE2483','ISOFIX')
insert autos (matricula, anclaje) values ('SER1515','Latch')
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Alquileres

insert alquiler (matricula,ci,precio,FechaI,fechaF) values ('smj3687',33333333,240,'2017/10/10','2017/10/12')
insert alquiler (matricula,ci,precio,FechaI,fechaF) values ('smj3687',44444444,360,'2017/09/10','2017/09/13')
go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------- Procedimientos Almacenados --------------------------------------

-- Eliminar Vehiculo

create proc EliminarVehiculo
@mat varchar(7)
as
Begin
	if not exists (select * from vehiculos where matricula = @mat)
	begin
		return -1
	end
    if exists (select * from alquiler where matricula = @mat)
	begin
		return -2
	end
	begin transaction
	delete from autos where matricula = @mat
	if @@error <> 0 
	begin
		rollback transaction
		return 0
	end 
	delete from utilitarios where matricula = @mat
	if @@error <> 0
	begin
		rollback tran
		return 0
	end
	delete from vehiculos where matricula = @mat
	if @@error <> 0 
	begin
		rollback tran
		return 0
	end
	commit transaction
	return 1
end
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Realizar Alquiler
   
create Procedure Alquilar
@ci int,
@matricula varchar (7),
@fechai smalldatetime,
@fechaf smalldatetime,
@costo money
as
begin
        if not exists (select * from clientes where ci  = @ci)
        return -1 
	    if not exists (select * from vehiculos where matricula = @matricula)
		return -2
		if exists (select * from alquiler where matricula = @matricula and
		(FechaI between @fechai  and @fechaf or fechaF between @fechai and @fechaf
		or @fechai between FechaI and fechaF or @fechaf between FechaI and fechaF)) 
		return -4	
		insert into alquiler values (@matricula,@ci,@costo,@fechai,@fechaf) 
end
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Total Vehiculo

create procedure TotalVehiculo
@matricula varchar(7)
as
begin
	select  sum(precio) as Total_Vehiculo
	from alquiler
	where matricula=@matricula
end
go

---------------------------------------------------------------------------------------------------
create proc UtilitariosDisponibles
@inicio smalldatetime,
@fin smalldatetime
as
begin
	select distinct vehiculos.* , utilitarios.Furgoneta_pickup, utilitarios.capacidad
    from vehiculos inner join utilitarios
    on vehiculos.matricula = utilitarios.matricula 
	where vehiculos.matricula not in (
	select alquiler.matricula 
	from alquiler 
	where FechaI  between @inicio  and @fin or fechaF between @inicio and @fin)	
end
go
    
----------------------------------------------------------------------------------------------
create proc AutosDisponibles
@inicio smalldatetime,
@fin smalldatetime
as
begin
	select distinct vehiculos.*, autos.anclaje
    from vehiculos inner join autos  
    on vehiculos.matricula = autos.matricula 
	where vehiculos.matricula not in (
	select alquiler.matricula 
	from alquiler 
	where FechaI  between @inicio  and @fin or fechaF between @inicio and @fin)	 
end
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Historial Alquiler

create proc HistorialAlquiler
@mat varchar (7)
as
begin
	select * 
	from alquiler inner join clientes 
	on alquiler.ci = clientes.ci 
	inner join vehiculos
	on alquiler.matricula = vehiculos.matricula
	where alquiler.matricula=@mat    and alquiler.ci=clientes.ci 
	and alquiler.matricula = vehiculos.matricula
end
go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Agregar autos y utilitarios

create proc AgregarAuto
@mat varchar(7),
@marca varchar (50),
@mod varchar(50),
@año int,
@puertas int,
@costo money,
@anclaje varchar(50)
as
begin 
	if exists (select * from vehiculos where matricula = @mat )
		return -1
	begin transaction 
	insert into vehiculos (matricula,costo,marca,modelo,año,puertas) values (@mat,@costo,@marca,@mod,@año,@puertas)
	if @@ERROR <> 0
	begin
	rollback tran
	return 0
	end
	insert into autos (matricula,anclaje) values (@mat,@anclaje)
	if @@ERROR <> 0
	begin
	rollback tran
	return 0
	end
	commit tran	
	return 1
end
go
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
create proc AgregarUtilitario
@mat varchar(7),
@marca varchar (50),
@mod varchar(50),
@año int,
@puertas int,
@costo money,
@capacidad int,
@Furgo varchar (50)
as
begin 
	if exists (select * from vehiculos where matricula = @mat )
		return -1
	begin transaction 
	insert into vehiculos (matricula,costo,marca,modelo,año,puertas) values (@mat,@costo,@marca,@mod,@año,@puertas)
	if @@ERROR <> 0
	begin
	rollback tran
	return 0
	end
	insert into  utilitarios (matricula,capacidad,Furgoneta_pickup) values (@mat,@capacidad,@Furgo)
	if @@ERROR <> 0
	begin
	rollback tran
	return 0
	end
	commit tran	
	return 1
end
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Modificar Vehiculos

create proc ModificarAuto
@mat varchar(7),
@marca varchar (50),
@mod varchar(50),
@año int,
@puertas int,
@costo money,
@anclaje varchar(50)
as
begin 
	if  not exists (select * from vehiculos where matricula = @mat )
		return -1
    if  not exists (select * from autos where matricula = @mat )
		return -2
	begin transaction 
	update vehiculos set  costo = @costo, marca = @marca,modelo=@mod,año=@año,puertas=@puertas
	where matricula = @mat
	if @@ERROR <> 0
	begin
	rollback tran
	return 0
	end
	update autos set anclaje = @anclaje
	where matricula = @mat
	if @@ERROR <> 0
	begin
	rollback tran
	return 0
	end
	commit tran	
	return 1
end
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

create proc ModificarUtilitario
@mat varchar(7),
@marca varchar (50),
@mod varchar(50),
@año int,
@puertas int,
@costo money,
@capacidad int,
@Furgo varchar (50)
as
begin 
	if  not exists (select * from vehiculos where matricula = @mat )
		return -1
    if  not exists (select * from utilitarios where matricula = @mat )
		return -2
	begin transaction 
	update vehiculos set  costo = @costo, marca = @marca,modelo=@mod,año=@año,puertas=@puertas
	where matricula = @mat
	if @@ERROR <> 0
	begin
	rollback tran
	return 0
	end
	update utilitarios set capacidad = @capacidad, Furgoneta_pickup = @Furgo
	where matricula = @mat
	if @@ERROR <> 0
	begin
	rollback tran
	return 0
	end
	commit tran	
	return 1
end
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Buscar Vehiculos

create proc BuscarAuto
@Matricula varchar(7)
as
begin
	select  vehiculos.*, autos.anclaje 
	
	from vehiculos inner join autos
	on vehiculos.matricula = @Matricula and autos.matricula=@Matricula
end
go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
create proc BuscarUtilitario
@Matricula varchar(7)
as
begin
	select  vehiculos.*, utilitarios.capacidad, utilitarios.Furgoneta_pickup 
	from vehiculos inner join utilitarios
	on vehiculos.matricula = @Matricula and utilitarios.matricula=@Matricula
end
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Agregar Cliente

create proc AgregarCliente
@cedula int,
@nombre varchar (50),
@tarjeta int,
@telefono int,
@direccion varchar (50),
@nacimiento smalldatetime
as
begin
	if exists (select * from clientes where ci=@cedula)
	return -1
	begin transaction
	insert into clientes (ci,tarjeta,nombre,fechaN,direccion,telefono) values (@cedula,@tarjeta,@nombre,@nacimiento,@direccion,@telefono)
	if @@ERROR <> 0
	begin
	rollback tran
	return -2
	end
	commit tran
	return 1
end
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Buscar Cliente

create proc BuscarCliente
@ci int
as
begin
	select  *  from clientes
	where ci = @ci
end
go
---------------------------------------------------------------------------------------------------
--Eliminar Cliente
create proc EliminarCliente
@cedula int
as
begin
	if not exists (select * from clientes where ci=@cedula)
	return -1
	begin tran
	delete from alquiler where ci = @cedula
	if @@ERROR <> 0 
	begin
	rollback transaction
	return -2
	end
	delete from clientes where ci = @cedula
	if @@ERROR <> 0
	begin
	rollback transaction
	return -2
	end
	commit tran
	return 1
end
go
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Modificar Cliente

create proc ModificarCliente
@cedula int,
@nombre varchar (50),
@tarjeta int,
@telefono int,
@direccion varchar (50),
@nacimiento smalldatetime
as
begin
	if not exists (select * from clientes where ci=@cedula)
	return -1
	begin tran
	update clientes set nombre=@nombre,tarjeta=@tarjeta,direccion=@direccion,fechaN=@nacimiento,telefono = @telefono
	where ci = @cedula
	if @@ERROR <> 0 
	begin
		rollback tran 
		return -2
	end
	commit tran
	return 1
end
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Listado de Vehiculos 

create proc ListarAutos
as
begin
	select vehiculos.*, autos.anclaje from vehiculos inner join autos
	on vehiculos.matricula = autos.matricula
end
go
---------------------------------------------------------------------------------------------------
create proc ListarUtilitarios
as
begin
	select vehiculos.*, utilitarios.capacidad,utilitarios.Furgoneta_pickup from vehiculos inner join utilitarios
	on vehiculos.matricula = utilitarios.matricula
end
go
----------------------------------------------------------------------------------------------------
