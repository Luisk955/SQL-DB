insert into PRODUCT(ID_LOCAL,NAME,STATUS,PRICE,DESCRIPTION,CATEGORY)
values (1,'Membership','Active',0,'Applications Membership','CATSYS');
GO

CREATE PROCEDURE RET_MEMBERSHIP_PR

	@P_ID INT

AS

	SELECT * FROM MEMBERSHIP WHERE ID = @P_ID;

GO

CREATE PROCEDURE [dbo].[CRE_MEMBERSHIP_PR]

	@P_FEE FLOAT,

	@P_TYPE NVARCHAR(45),

	@P_COMMISSION FLOAT,

	@P_FEE_INTERVAL nvarchar(45),

	@P_STATUS nvarchar(45)

AS

	INSERT INTO MEMBERSHIP (fee,type,COMMISSION,FEE_INTERVAL,STATUS) VALUES (@P_FEE,@P_TYPE,@P_COMMISSION,@P_FEE_INTERVAL,@P_STATUS);


GO

CREATE PROCEDURE RET_ALL_MEMBERSHIP_PR

AS

	SELECT * FROM MEMBERSHIP;

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

	SELECT * FROM ORDERS WHERE ID = @P_ID;

GO

CREATE PROCEDURE RET_ALL_ORDER_PR

AS

	SELECT * FROM ORDERS;

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

	VALUES (@P_ID,@P_NAME,@P_LAST_NAME,@P_PHONE_NUMBER,CONVERT(datetime, @P_BIRTHDATE, 20),@P_PASSWORD,'enabled', @P_BALANCE,@P_PAYPAL_USER,@P_EMAIL,CONVERT(datetime, @P_CREATION_DATE, 20),@P_PHONE_CONF,@P_EMAIL_CONF);


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

	SELECT ID,NAME,LAST_NAME, STATUS,PHONE_NUMBER,BIRTHDATE,BALANCE,PAYPAL_USER,EMAIL,CREATION_DATE  FROM USERS WHERE ID = @P_ID;

GO

CREATE PROCEDURE RET_ALL_USER_PR

AS

	SELECT * FROM USERS;

GO

CREATE PROCEDURE DEL_USER_PR

	@P_ID INT

AS

	DELETE FROM USERS WHERE ID = @P_ID;

GO

CREATE PROCEDURE [dbo].[RET_PENDING_MEMEBERSHIP_PR]
AS
	SELECT * from membership where status='Pending';
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
	WHERE L.ID = @P_ID;
GO

CREATE PROCEDURE [dbo].[RET_MAX_ORDER_PR]
AS
	SELECT TOP 1 * FROM ORDERS ORDER BY ID DESC;
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


