--
--LOCAL
-- 

--CREATE LOCAL
CREATE PROCEDURE [dbo].[CRE_LOCAL_PR]
    @P_ID INT,
    @P_ID_MEMBERSHIP INT,
    @P_NAME VARCHAR(255),
    @P_STATUS VARCHAR(255),
    @P_LOCATION VARCHAR(255),
    @P_OPENING_HOURS VARCHAR(255),
    @P_PHONE_NUMBER VARCHAR(255),
    @P_EMAIL VARCHAR(255),
    @P_DESCRIPTION VARCHAR(255),
    @P_WEBSITE VARCHAR(255),
    @P_PRICE_RANGE VARCHAR(255),
    @P_CATEGORY VARCHAR(255)

AS
    INSERT INTO [dbo].[LOCAL] (ID, ID_MEMBERSHIP, NAME, STATUS, LOCATION, OPENING_HOURS, PHONE_NUMBER, EMAIL, DESCRIPTION, WEBSITE, PRICE_RANGE, CATEGORY) VALUES(@P_ID, @P_ID_MEMBERSHIP, @P_NAME, @P_STATUS, @P_LOCATION, @P_OPENING_HOURS, @P_PHONE_NUMBER, @P_EMAIL, @P_DESCRIPTION, @P_WEBSITE, @P_PRICE_RANGE, @P_CATEGORY);

GO

--RETURN ALL LOCALS
CREATE PROCEDURE [dbo].[RET_ALL_LOCAL_PR]
AS
    SELECT ID, ID_MEMBERSHIP, NAME, STATUS, LOCATION, OPENING_HOURS, PHONE_NUMBER, EMAIL, DESCRIPTION, WEBSITE, PRICE_RANGE, CATEGORY FROM LOCAL;
GO

--RETURN LOCAL BY ID

CREATE PROCEDURE [dbo].[RET_LOCAL_BYID_PR]
    @P_ID INT
AS
    SELECT ID, ID_MEMBERSHIP, NAME, STATUS, LOCATION, OPENING_HOURS, PHONE_NUMBER, EMAIL, DESCRIPTION, WEBSITE, PRICE_RANGE, CATEGORY FROM LOCAL WHERE ID =  @P_ID;
GO


--UPDATE LOCAL
CREATE PROCEDURE [dbo].[UPD_LOCAL_PR]
    @P_ID INT,
    @P_ID_MEMBERSHIP INT,
    @P_NAME VARCHAR(255),
    @P_STATUS VARCHAR(255),
    @P_LOCATION VARCHAR(255),
    @P_OPENING_HOURS VARCHAR(255),
    @P_PHONE_NUMBER VARCHAR(255),
    @P_EMAIL VARCHAR(255),
    @P_DESCRIPTION VARCHAR(255),
    @P_WEBSITE VARCHAR(255),
    @P_PRICE_RANGE VARCHAR(255),
    @P_CATEGORY VARCHAR(255)
AS
    UPDATE LOCAL SET ID_MEMBERSHIP = @P_ID_MEMBERSHIP, NAME = @P_NAME, STATUS = @P_STATUS, LOCATION = @P_LOCATION, OPENING_HOURS = @P_OPENING_HOURS, PHONE_NUMBER = @P_PHONE_NUMBER, EMAIL = @P_EMAIL, DESCRIPTION = @P_DESCRIPTION, WEBSITE = @P_WEBSITE, PRICE_RANGE = @P_PRICE_RANGE, CATEGORY = @P_CATEGORY WHERE ID=@P_ID;
GO

--DELETE LOCAL
CREATE PROCEDURE [dbo].[DEL_LOCAL_PR]
    @P_ID INT
AS
    DELETE FROM LOCAL WHERE ID = @P_ID;
GO

--
--PRODUCT
-- 

--CREATE PRODUCT
CREATE PROCEDURE [dbo].[CRE_PRODUCT_PR]
    @P_ID_LOCAL INT,
    @P_NAME VARCHAR(255),
    @P_STATUS VARCHAR(255),
    @P_PRICE FLOAT,
    @P_DESCRIPTION VARCHAR(255),
    @P_CATEGORY VARCHAR(255)
AS
    INSERT INTO PRODUCT VALUES(@P_ID_LOCAL, @P_NAME, @P_STATUS, @P_PRICE, @P_DESCRIPTION, @P_CATEGORY);
GO

--RETURN ALL PRODUCTS
CREATE PROCEDURE [dbo].[RET_ALL_PRODUCTS_PR]
AS
    SELECT ID, ID_LOCAL, NAME, STATUS, PRICE, DESCRIPTION, CATEGORY FROM PRODUCT;
GO

--RETURN PRODUCT BY ID
CREATE PROCEDURE [dbo].[RET_PRODUCT_BYID_PR]
    @P_ID INT
AS
    SELECT ID, ID_LOCAL, NAME, STATUS, PRICE, DESCRIPTION, CATEGORY FROM PRODUCT WHERE ID = @P_ID;
GO

--UPDATE PRODUCT
CREATE PROCEDURE [dbo].[UPD_PRODUCT_PR]
    @P_ID INT,
    @P_NAME VARCHAR(255),
    @P_STATUS VARCHAR(255),
    @P_PRICE FLOAT,
    @P_DESCRIPTION VARCHAR(255),
    @P_CATEGORY VARCHAR(255)
AS
    UPDATE PRODUCT SET NAME = @P_NAME, STATUS = @P_STATUS, PRICE = @P_PRICE, DESCRIPTION = @P_DESCRIPTION, CATEGORY = @P_CATEGORY WHERE ID = @P_ID;
GO

--DELETE PRODUCT
CREATE PROCEDURE [dbo].[DEL_PRODUCT_PR]
    @P_ID INT
AS
    DELETE FROM PRODUCT WHERE ID = @P_ID;
GO
