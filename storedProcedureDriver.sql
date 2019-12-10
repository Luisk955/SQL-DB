--CREATE DRIVER
CREATE PROCEDURE [dbo].[CRE_DRIVER_PR]
	@P_ID_USER INT,
	@P_ID_MEMBERSHIP INT,
	@P_IMAGE VARCHAR(255),
	@P_VEHICLE_LICENCE_PLATE INT,
	@P_VEHICLE_ECO_FRIENDLY VARCHAR(255),
	@P_VEHICLE_TYPE VARCHAR(255),
	@P_VEHICLE_IMAGE VARCHAR(255),
	@P_COMMISSION_PER_KM INT

AS
	INSERT INTO DRIVER(ID_USER,ID_MEMBERSHIP,IMAGE,VEHICLE_LICENCE_PLATE,VEHICLE_ECO_FRIENDLY,VEHICLE_TYPE,VEHICLE_IMAGE,COMMISSION_PER_KM)
	VALUES (@P_ID_USER,@P_ID_MEMBERSHIP,@P_IMAGE,@P_VEHICLE_LICENCE_PLATE,@P_VEHICLE_ECO_FRIENDLY,@P_VEHICLE_TYPE,@P_VEHICLE_IMAGE,@P_COMMISSION_PER_KM);
GO

--RETRIVE ALL DRIVERS
CREATE PROCEDURE [dbo].[RET_ALL_DRIVERS_PR]
AS
	SELECT * FROM DRIVER;
GO

--RETRIVE ALL DRIVERS JOIN USER
CREATE PROCEDURE [dbo].[RET_ALL_DRIVERS_USERS_PR]
AS
	SELECT (SELECT NAME FROM USERS WHERE USERS.ID=DRIVER.ID_USER) AS NAME,
	(SELECT LAST_NAME FROM USERS WHERE USERS.ID=DRIVER.ID_USER) AS LAST_NAME,
	ID_MEMBERSHIP,
	IMAGE,
	VEHICLE_LICENCE_PLATE,
	VEHICLE_ECO_FRIENDLY,
	VEHICLE_TYPE,
	VEHICLE_IMAGE,
	COMMISSION_PER_KM
	FROM DRIVER
GO

--RETRIVE ORDERS BY DRIVER
CREATE PROCEDURE [dbo].[RET_ALL_DRIVERS_ORDERS_PR]
	@P_ID_DRIVER INT
AS
	SELECT * FROM ORDERS WHERE ID_DRIVER = @P_ID_DRIVER;
GO

--Retrieve Driver by Id
CREATE PROCEDURE RET_DRIVERS_PR
	@P_ID_USER INT
AS
	SELECT * FROM DRIVER WHERE ID_USER = @P_ID_USER;
GO
