/*Utils*/
insert into utils(id,name) values ('statAct','Active')
GO
insert into utils(id,name) values ('statDis','Disabled')
GO
insert into utils(id,name) values ('ordPenP','Pending Pay')
GO
insert into utils(id,name) values ('ordPen','Pending')
GO
insert into utils(id,name) values ('ordComp','Completed')
GO
insert into utils(id,name) values ('ordPenD','Pending Driver')
GO
insert into utils(id,name) values ('ordPenDel','Pending Delivery')
GO
insert into utils(id,name) values ('ordPenK','Pending Pickup')
GO
insert into utils(id,name) values ('memPen','Pending')
GO
insert into utils(id,name) values ('memAct','Activa')
GO
insert into utils(id,name) values ('typeDr','Driver')
GO
insert into utils(id,name) values ('typeLo','Local')
GO
insert into utils(id,name) values ('intMon','Mensual')
GO
insert into utils(id,name) values ('intAnu','Anual')
GO
insert into utils(id,name) values ('memPenP','Pending Pay')
GO
insert into utils(id,name) values ('vhcBike','Bicicleta')
GO
insert into utils(id,name) values ('vhcCar','Carro')
GO
/*Utils*/

/*Roles*/
INSERT INTO [ROLE] (ID, NAME)
VALUES (1, 'Admin');

INSERT INTO [ROLE] (ID, NAME)
VALUES (2, 'LocalOwner');

INSERT INTO [ROLE] (ID, NAME)
VALUES (3, 'Driver');

INSERT INTO [ROLE] (ID, NAME)
VALUES (4, 'FUser');
/*Roles*/

/*Users*/

INSERT INTO USERS (ID, NAME, LAST_NAME, PHONE_NUMBER, BIRTHDATE, PASSWORD, STATUS, BALANCE, PAYPAL_USER, EMAIL, CREATION_DATE, PHONE_CONF, EMAIL_CONF)
values (1,'Admin','',0000,SYSDATETIME(),'4dm1n','statAct',0,'','ipsum@jobs.com',SYSDATETIME(), '', '')
GO

INSERT INTO ROLEXUSER(ID_USER, ID_ROLE, PRIVILEGE)
VALUES(1, 1, 0)
GO

INSERT INTO USERS (ID, NAME, LAST_NAME, PHONE_NUMBER, BIRTHDATE, PASSWORD, STATUS, BALANCE, PAYPAL_USER, EMAIL, CREATION_DATE, PHONE_CONF, EMAIL_CONF)

VALUES(115963256, 'Ronald', 'McDonald', '25256556', SYSDATETIME(), 'mc', 'statAct', 0, '', 'mcdonalds@bussiness.com', SYSDATETIME(), 'PWOEMSKQ','LMBSQLAO');
GO

INSERT INTO ROLEXUSER(ID_USER, ID_ROLE, PRIVILEGE)
VALUES(115963256, 2, 0)
GO
/*Users*/

/*Membership*/
INSERT INTO MEMBERSHIP(FEE, TYPE, COMMISSION, FEE_INTERVAL, STATUS)
VALUES(0, 'typeLo', 0, 'intAnu', 'memAct')
GO
/*Membership*/

/*Aplication*/
INSERT INTO LOCAL(ID, ID_MEMBERSHIP, NAME, STATUS, LOCATION, OPENING_HOURS, PHONE_NUMBER, EMAIL, DESCRIPTION, WEBSITE, PRICE_RANGE, CATEGORY)
VALUES (1, 1, 'Goeats', 'statAct', 'Goeats', 'Goeats', 'Goeats','Goeats','Goeats','Goeats','Goeats','typeLo');
GO
/*Aplication*/

/*New product: Membership*/
insert into PRODUCT(ID_LOCAL,NAME,STATUS,PRICE,DESCRIPTION,CATEGORY)
values (1,'Membership','statAct',0,'Applications Membership','statAct');
GO
/*New product: Membership*/

/*Admin Views*/
INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Locals', 'Locales');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Locals/RegisterLocal', 'Registrar local');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Products', 'Ver productos');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Products/RegisterProduct', 'Registrar producto');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Category', 'Categorías');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Category/CreateCategory', 'Registrar categoria');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Landing/AdminReg', 'Registrar administrador');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Landing/User', 'Ver usuarios');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Landing/ViewMembership', 'Ver membresías');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Landing/ViewPending', 'Mebresías pendientes');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Landing/ListOrders', 'Ver Ordenes');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Tax/RegisterTax', 'Crear Impuesto');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Tax', 'Listar Impuesto');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Coupon/RegisterCoupon', 'Crear Cupon');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (1, '/Coupon', 'Listar Cupon');


/*Admin Views*/

/*Driver Views*/
INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (3, '/Landing/MyMembership', 'Mi membresía');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (3, '/Landing/ListOrders', 'Ver Ordenes');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (3, '/Driver/Membership', 'Membresía');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (3, '/Driver/Orders', 'Órdenes');

/*Driver Views*/

/*LocalOwner Views*/
INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (2, '/Locals', 'Mis locales');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (2, '/Locals/RegisterLocal', 'Registrar local');

/*LocalOwner Views*/

GO
