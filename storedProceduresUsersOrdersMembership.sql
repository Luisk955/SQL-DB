insert into PRODUCT(ID_LOCAL,NAME,STATUS,PRICE,DESCRIPTION,CATEGORY)
values (1,'Membership','Active',0,'Applications Membership','CATSYS');
GO
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
insert into utils(id,name) values ('memPen','Pending')
GO
CREATE PROCEDURE RET_MEMBERSHIP_PR

	@P_ID INT

AS

	SELECT M.ID ID,M.FEE FEE,M.TYPE TYPE,M.COMMISSION COMMISSION,M.FEE_INTERVAL FEE_INTERVAL,U.NAME STATUS FROM MEMBERSHIP M 
	JOIN UTILS U ON M.STATUS=U.ID WHERE M.ID = @P_ID;

GO

CREATE PROCEDURE [dbo].[CRE_MEMBERSHIP_PR]

	@P_FEE FLOAT,

	@P_TYPE NVARCHAR(45),

	@P_COMMISSION FLOAT,

	@P_FEE_INTERVAL nvarchar(45),

	@P_STATUS nvarchar(45)

AS
	DECLARE @INCREMENT_UTIL TABLE([ID] INT);
	DELETE From @INCREMENT_UTIL;
	INSERT INTO MEMBERSHIP (fee,type,COMMISSION,FEE_INTERVAL,STATUS)
	OUTPUT inserted.ID INTO @INCREMENT_UTIL
	VALUES (@P_FEE,@P_TYPE,@P_COMMISSION,@P_FEE_INTERVAL,@P_STATUS);
	SELECT ID FROM @INCREMENT_UTIL;

	
GO

CREATE PROCEDURE RET_ALL_MEMBERSHIP_PR

AS

	SELECT M.Fee Fee, M.COMMISSION COMMISSION, M.FEE_INTERVAL Fee_Interval, M.ID Id, M.TYPE Type,U.Name Status FROM MEMBERSHIP M
	JOIN UTILS U ON M.STATUS=U.ID;

GO

CREATE PROCEDURE DEL_MEMBERSHIP_PR

	@P_ID INT

AS

	DELETE FROM MEMBERSHIP WHERE ID = @P_ID;

GO

CREATE PROCEDURE [dbo].[UPD_MEMBERSHIP_PR]

	@P_ID INT,

	@P_FEE FLOAT,

	@P_TYPE NVARCHAR(45),

	@P_COMMISSION FLOAT,

	@P_FEE_INTERVAL nvarchar(45),

	@P_STATUS nvarchar(45)

AS

	UPDATE MEMBERSHIP SET fee=@P_FEE,type=@P_TYPE,COMMISSION=@P_COMMISSION,FEE_INTERVAL=@P_FEE_INTERVAL,STATUS=@P_STATUS WHERE ID=@P_ID;

GO

CREATE PROCEDURE [dbo].[CRE_ORDER_PR]

	@P_ID_BUYER INT,

	@P_ID_SELLER INT,

	@P_ID_DRIVER INT,

	@P_ID_LOCATION INT,

	@P_INVOICE INT,

	@P_TYPE NVARCHAR(45),

	@P_START_TIME DATE,

	@P_END_TIME DATE,

	@P_DESCRIPTION NVARCHAR(255),

	@P_STATUS nvarchar(45)

AS

	INSERT INTO ORDERS(id_buyer,ID_SELLER,ID_DRIVER,ID_LOCATION,STATUS,INVOICE,TYPE,START_TIME,END_TIME,DESCRIPTION) VALUES (@P_ID_BUYER,@P_ID_SELLER,@P_ID_DRIVER,@P_ID_LOCATION,@P_STATUS,@P_INVOICE,@P_TYPE, @P_START_TIME,@P_END_TIME,@P_DESCRIPTION);

GO

CREATE PROCEDURE [dbo].[UPD_ORDER_PR]

	@P_ID INT,

	@P_ID_BUYER INT,

	@P_ID_SELLER INT,

	@P_ID_DRIVER INT,

	@P_ID_LOCATION INT,

	@P_INVOICE INT,

	@P_TYPE NVARCHAR(45),

	@P_START_TIME DATE,

	@P_END_TIME DATE,

	@P_DESCRIPTION NVARCHAR(500),

	@P_STATUS nvarchar(45)

AS

	UPDATE ORDERS SET ID_BUYER=@P_ID_BUYER,ID_SELLER=@P_ID_SELLER,ID_DRIVER=@P_ID_DRIVER,ID_LOCATION=@P_ID_LOCATION,STATUS=@P_STATUS,INVOICE=@P_INVOICE, TYPE=@P_TYPE, START_TIME=@P_START_TIME, END_TIME=@P_END_TIME, DESCRIPTION=@P_DESCRIPTION WHERE ID=@P_ID;

GO

CREATE PROCEDURE RET_ORDER_PR

	@P_ID INT

AS

	SELECT O.Id ID,O.Id_Buyer Id_Buyer, O.Id_Seller Id_Seller, O.Id_Driver Id_Driver, O.ID_LOCATION ID_LOCATION,O.INVOICE INVOICE,U.NAME STATUS,O.START_TIME START_TIME,O.END_TIME END_TIME, O.DESCRIPTION DESCRIPTION, O.TYPE TYPE FROM ORDERS O
	JOIN UTILS U ON O.STATUS=U.ID WHERE O.ID = @P_ID;

GO

CREATE PROCEDURE RET_ALL_ORDER_PR

AS

	SELECT O.Id ID,O.Id_Buyer Id_Buyer, O.Id_Seller Id_Seller, O.Id_Driver Id_Driver, O.ID_LOCATION ID_LOCATION,O.INVOICE INVOICE,U.NAME STATUS,O.START_TIME START_TIME,O.END_TIME END_TIME, O.DESCRIPTION DESCRIPTION, O.TYPE TYPE FROM ORDERS O
	JOIN UTILS U ON O.STATUS=U.ID;

GO

CREATE PROCEDURE DEL_ORDER_PR

	@P_ID INT

AS

	DELETE FROM ORDERS WHERE ID = @P_ID;

GO

CREATE PROCEDURE [dbo].[CRE_USER_PR]

	@P_ID INT,

	@P_NAME NVARCHAR(45),

	@P_LAST_NAME NVARCHAR(45),

	@P_PHONE_NUMBER NVARCHAR(45),

	@P_BIRTHDATE DATE,

	@P_PASSWORD NVARCHAR(45),

	@P_BALANCE FLOAT,

	@P_PAYPAL_USER VARCHAR(45),

	@P_EMAIL NVARCHAR(45),

	@P_CREATION_DATE DATE,

	@P_PHONE_CONF VARCHAR(45),

	@P_EMAIL_CONF VARCHAR(45)

AS

	INSERT INTO USERS (ID,NAME,LAST_NAME,PHONE_NUMBER,BIRTHDATE,PASSWORD,STATUS,BALANCE,PAYPAL_USER,EMAIL,CREATION_DATE,PHONE_CONF,EMAIL_CONF) 

	VALUES (@P_ID,@P_NAME,@P_LAST_NAME,@P_PHONE_NUMBER,CONVERT(datetime, @P_BIRTHDATE, 20),@P_PASSWORD,'statAct', @P_BALANCE,@P_PAYPAL_USER,@P_EMAIL,CONVERT(datetime, @P_CREATION_DATE, 20),@P_PHONE_CONF,@P_EMAIL_CONF);


GO

CREATE PROCEDURE [dbo].[UPD_USER_PR]

	@P_ID INT,

	@P_NAME NVARCHAR(45),

	@P_LAST_NAME NVARCHAR(45),

	@P_PHONE_NUMBER NVARCHAR(45),

	@P_BIRTHDATE DATE,

	@P_PASSWORD NVARCHAR(45),

	@P_STATUS NVARCHAR(45),

	@P_BALANCE FLOAT,

	@P_PAYPAL_USER VARCHAR(45),

	@P_EMAIL NVARCHAR(45),

	@P_CREATION_DATE DATE,

	@P_PHONE_CONF VARCHAR(45),

	@P_EMAIL_CONF VARCHAR(45)

AS

	UPDATE USERS SET NAME=@P_NAME,LAST_NAME=@P_LAST_NAME,PHONE_NUMBER=@P_PHONE_NUMBER,BIRTHDATE=@P_BIRTHDATE,STATUS=@P_STATUS,PASSWORD=@P_PASSWORD, BALANCE=@P_BALANCE, PAYPAL_USER=@P_PAYPAL_USER, EMAIL=@P_EMAIL, CREATION_DATE=@P_CREATION_DATE, PHONE_CONF=@P_PHONE_CONF, EMAIL_CONF=@P_EMAIL_CONF WHERE ID=@P_ID;

GO

CREATE PROCEDURE [dbo].[RET_USER_PR]

	@P_ID INT

AS

	SSELECT US.ID ID,US.NAME NAME,US.LAST_NAME LAST_NAME, U.NAME STATUS,US.PHONE_NUMBER PHONE_NUMBER,US.BIRTHDATE BIRTHDATE,US.BALANCE BALANCE,US.PAYPAL_USER PAYPAL_USER,US.EMAIL EMAIL,US.CREATION_DATE CREATION_DATE FROM USERS US
	JOIN UTILS U ON US.STATUS=U.ID WHERE US.ID = @P_ID;

GO

CREATE PROCEDURE RET_ALL_USER_PR

AS

	SELECT US.ID ID,US.NAME NAME,US.LAST_NAME LAST_NAME, U.NAME STATUS,US.PHONE_NUMBER PHONE_NUMBER,US.BIRTHDATE BIRTHDATE,US.BALANCE BALANCE,US.PAYPAL_USER PAYPAL_USER,US.EMAIL EMAIL,US.CREATION_DATE CREATION_DATE FROM USERS US
	JOIN UTILS U ON US.STATUS=U.ID;

GO

CREATE PROCEDURE DEL_USER_PR

	@P_ID INT

AS

	DELETE FROM USERS WHERE ID = @P_ID;

GO

CREATE PROCEDURE [dbo].[RET_PENDING_MEMEBERSHIP_PR]
AS
	SELECT * from membership where status='memPen';
GO

create PROCEDURE RET_LOCAL_OWNER_NAME_PR
	@P_ID INT
AS
	SELECT l.NAME name FROM LOCAL L
	WHERE L.ID = @P_ID; 
GO

CREATE PROCEDURE [dbo].[RET_LOCAL_OWNER_PR]
	@P_ID INT
AS
	SELECT UXL.ID_USER ID FROM LOCAL L 
	JOIN USERXLOCAL UXL ON L.ID=UXL.ID_LOCAL
	WHERE L.ID_Membership = @P_ID; 
GO

CREATE PROCEDURE [dbo].[RET_MEMBERSHIP_DRIVER_NAME_PR]
	@P_ID INT
AS
	SELECT CONCAT(U.NAME,' ',U.LAST_NAME) NAME FROM DRIVER D
	JOIN USERS U ON D.ID_USER=U.ID
	WHERE D.ID_MEMBERSHIP = @P_ID; 
GO

CREATE PROCEDURE [dbo].[RET_MEMBERSHIP_DRIVER_PR]
	@P_ID INT
AS
	SELECT D.ID_USER ID FROM DRIVER D 
	WHERE D.ID_MEMBERSHIP = @P_ID; 
GO

CREATE PROCEDURE [dbo].[CRE_UNP_ORDER_PR]
	@P_ID_BUYER INT,
	@P_ID_SELLER INT,
	@P_STATUS VARCHAR(255),
	@P_START_TIME DATETIME,
	@P_TYPE VARCHAR(255)

AS
	DECLARE @INCREMENT_UTIL TABLE([ID] INT);
	DELETE From @INCREMENT_UTIL;
	INSERT INTO ORDERS (ID_BUYER,ID_SELLER,STATUS,START_TIME,TYPE)
	OUTPUT inserted.ID INTO @INCREMENT_UTIL
	VALUES (@P_ID_BUYER,@P_ID_SELLER,'ordPenP',@P_START_TIME,@P_TYPE);
	SELECT ID FROM @INCREMENT_UTIL;

GO

CREATE PROCEDURE RET_ALL_MEMBERSHIP_USER_PR
@P_ID int
AS
SELECT m.id ID,m.FEE FEE,m.COMMISSION COMMISSION,m.FEE_INTERVAL FEE_INTERVAL,U.NAME STATUS,m.TYPE TYPE from MEMBERSHIP M 
JOIN LOCAL L on M.ID = L.ID_MEMBERSHIP
JOIN USERXLOCAL UXL ON L.ID=UXL.ID_LOCAL
JOIN UTILS U ON M.STATUS = U.ID
WHERE UXL.ID_USER = @P_ID
UNION 
Select m.id ID,m.FEE FEE,m.COMMISSION COMMISSION,m.FEE_INTERVAL FEE_INTERVAL,U.NAME STATUS,m.TYPE TYPE from membership M
JOIN DRIVER D ON M.ID = D.ID_MEMBERSHIP
JOIN UTILS U ON M.STATUS = U.ID
WHERE D.ID_USER = @P_ID;
Go

CREATE PROCEDURE CRE_USERXLOCAL_PR
	@P_ID INT,
	@P_LOCAL_ID INT
AS
	INSERT INTO USERXLOCAL (ID_LOCAL,ID_USER) VALUES (@P_LOCAL_ID,@P_ID);
GO

CREATE PROCEDURE [dbo].[RET_ALL_USER_PR]

AS

	SELECT U.ID,U.NAME,U.LAST_NAME, U.STATUS,U.PHONE_NUMBER,U.BIRTHDATE,U.BALANCE,U.PAYPAL_USER,U.EMAIL,U.CREATION_DATE,R.NAME TYPE FROM USERS U
	left JOIN ROLEXUSER RXU ON U.ID=RXU.ID_USER
	left JOIN ROLE R ON RXU.ID_ROLE = R.ID
GO

CREATE PROCEDURE [dbo].[RET_USER_PR]

	@P_ID INT

AS
	SELECT U.ID,U.NAME,U.LAST_NAME, U.STATUS,U.PHONE_NUMBER,U.BIRTHDATE,U.BALANCE,U.PAYPAL_USER,U.EMAIL,U.CREATION_DATE,R.NAME TYPE FROM USERS U
	left JOIN ROLEXUSER RXU ON U.ID=RXU.ID_USER
	left JOIN ROLE R ON RXU.ID_ROLE = R.ID WHERE U.ID = @P_ID;
GO
CREATE PROCEDURE SET_USER_ROLE_PR
	@P_ID INT,
	@P_ROLE INT
AS
	INSERT INTO ROLEXUSER(ID_USER,ID_ROLE) VALUES (@P_ID,@P_ROLE)
GO
CREATE PROCEDURE [dbo].[UPD_USER_PR]

	@P_ID INT,

	@P_NAME NVARCHAR(45),

	@P_LAST_NAME NVARCHAR(45),

	@P_PHONE_NUMBER NVARCHAR(45),

	@P_EMAIL NVARCHAR(45)

AS

	UPDATE USERS SET NAME=@P_NAME,LAST_NAME=@P_LAST_NAME,PHONE_NUMBER=@P_PHONE_NUMBER, EMAIL=@P_EMAIL WHERE ID=@P_ID;

GO

CREATE PROCEDURE RET_CURRENT_ORDER_USER_PR
	@P_Id_Buyer int
as
	Select O.Id Id,O.Id_Buyer Id_Buyer,O.Id_Seller Id_Seller,O.Id_Driver Id_Driver,O.Id_Location Id_Location, O.Invoice Invoice,U.Name Status,O.Start_Time Start_Time,O.End_Time,O.Description Description,O.Type Type from orders O
	Join UTILS U on O.STATUS=U.Id
	where o.id_buyer=@P_Id_Buyer;
GO

CREATE PROCEDURE RET_CURRENT_ORDER_DRIVER_PR
	@P_ID_DRIVER int
as
	Select O.Id Id,O.Id_Buyer Id_Buyer,O.Id_Seller Id_Seller,O.Id_Driver Id_Driver,O.Id_Location Id_Location, O.Invoice Invoice,U.Name Status,O.Start_Time Start_Time,O.End_Time,O.Description Description,O.Type Type from orders O
	Join UTILS U on O.STATUS=U.Id
	where o.ID_DRIVER=@P_ID_DRIVER;
GO
CREATE PROCEDURE RET_CURRENT_ORDER_LOCAL_PR
	@P_ID_SELLER int
as
	Select O.Id Id,O.Id_Buyer Id_Buyer,O.Id_Seller Id_Seller,O.Id_Driver Id_Driver,O.Id_Location Id_Location, O.Invoice Invoice,U.Name Status,O.Start_Time Start_Time,O.End_Time,O.Description Description,O.Type Type from orders O
	Join UTILS U on O.STATUS=U.Id
	where o.ID_SELLER=@P_ID_SELLER;
GO
