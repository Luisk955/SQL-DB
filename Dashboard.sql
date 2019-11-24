CREATE PROCEDURE [dbo].[RET_VIEWS_BYROLE_PR]
  @P_USER_ID INT
AS
BEGIN
Select V.CONTENT, V.TITLE from dbo.[USERS]
  INNER JOIN [dbo].[ROLEXUSER] as RxU ON [USERS].ID=RxU.ID_USER 
  INNER JOIN [dbo].[ROLE] as Rol ON Rol.ID=RxU.ID_ROLE
  INNER JOIN [dbo].[VIEW] as V ON V.ID_ROLE=Rol.ID 
  WHERE USERS.ID=@P_USER_ID;
END

Go


INSERT INTO [ROLE] (ID, NAME)
VALUES (1, 'Admin');

INSERT INTO [ROLE] (ID, NAME)
VALUES (2, 'LocalOwner');

INSERT INTO [ROLE] (ID, NAME)
VALUES (3, 'Driver');

INSERT INTO [ROLE] (ID, NAME)
VALUES (4, 'FUser');

INSERT INTO [ROLEXUSER] (ID_USER, ID_ROLE, PRIVILEGE)
VALUES (65565223, 1, 0);

INSERT INTO [ROLEXUSER] (ID_USER, ID_ROLE, PRIVILEGE)
VALUES (115990509, 2, 0);

INSERT INTO [ROLEXUSER] (ID_USER, ID_ROLE, PRIVILEGE)
VALUES (115990509, 3, 0);

INSERT INTO [ROLEXUSER] (ID_USER, ID_ROLE, PRIVILEGE)
VALUES (115990509, 1, 0);

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

/*Admin Views*/

/*Driver Views*/
INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (3, '/Landing/MyMembership', 'Mi membresía');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (3, '/Landing/ListOrders', 'Ver Ordenes');
/*Driver Views*/

/*LocalOwner Views*/
INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (2, '/Locals', 'Mis locales');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (2, '/Locals/RegisterLocal', 'Registrar local');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (2, '/Products', 'Ver productos');

INSERT INTO [VIEW] (ID_ROLE, CONTENT, TITLE)
VALUES (2, '/Products/RegisterProduct', 'Registrar producto');
/*LocalOwner Views*/
