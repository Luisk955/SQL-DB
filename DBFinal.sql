CREATE TABLE [EXCEPTION] (
  [ID] INT PRIMARY KEY,
  [EXCEPTION_MESSAGE] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [TAX] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [NAME] VARCHAR(255) NOT NULL,
  [PERCENTAGE] FLOAT NOT NULL
)
GO

CREATE TABLE [ERROR] (
  [ID] INT PRIMARY KEY,
  [NAME] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [ERROR_LOG] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [ID_ERROR] INT NOT NULL,
  [DATE] DATETIME NOT NULL,
  [DESCRIPTION] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [COUPON] (
  [CODE] INT PRIMARY KEY,
  [STATUS] VARCHAR(255) NOT NULL,
  [VALUE] FLOAT NOT NULL,
  [END_DATE] DATETIME NOT NULL,
  [MAX_USES] INT NOT NULL,
  [CURRENT_USES] INT NOT NULL
)
GO

CREATE TABLE [SYSTEM_LOG] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [ACTION] VARCHAR(255) NOT NULL,
  [ACTOR] VARCHAR(255) NOT NULL,
  [AFFECTED] VARCHAR(255) NOT NULL,
  [ACTION_DATE] DATETIME NOT NULL,
  [DESCRIPTION] VARCHAR(255) NOT NULL,
  [TYPE] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [UTILS] (
  [ID] VARCHAR(255) PRIMARY KEY,
  [NAME] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [VOTES] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [ID_USER] INT NOT NULL,
  [VOTED] INT NOT NULL,
  [TYPE] VARCHAR(255) NOT NULL,
  [GRADE] FLOAT NOT NULL
)
GO

CREATE TABLE [USERS] (
  [ID] INT PRIMARY KEY,
  [NAME] VARCHAR(255) NOT NULL,
  [LAST_NAME] VARCHAR(255) NOT NULL,
  [PHONE_NUMBER] INT NOT NULL,
  [BIRTHDATE] DATE NOT NULL,
  [PASSWORD] VARCHAR(255) NOT NULL,
  [STATUS] VARCHAR(255) NOT NULL,
  [BALANCE] FLOAT DEFAULT 0,
  [PAYPAL_USER] VARCHAR(255) NOT NULL,
  [EMAIL] VARCHAR(255) NOT NULL,
  [CREATION_DATE] DATETIME NOT NULL,
  [PHONE_CONF] VARCHAR(255) NOT NULL,
  [EMAIL_CONF] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [DIRECTION] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [ID_USER] INT NOT NULL,
  [NAME] VARCHAR(255) NOT NULL,
  [COORDINATE_X] FLOAT NOT NULL,
  [COORDINATE_Y] FLOAT NOT NULL,
  [DESCRIPTION] VARCHAR(255)
)
GO

CREATE TABLE [PASSWORD_LOG] (
  [ID_USER] INT NOT NULL,
  [OLD_PASSWORD] VARCHAR(255) NOT NULL,
  [NEW_PASSWORD] VARCHAR(255) NOT NULL,
  [CHANGE_DATE] DATETIME NOT NULL
)
GO

CREATE TABLE [ROLE] (
  [ID] INT PRIMARY KEY,
  [NAME] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [ROLEXUSER] (
  [ID_USER] INT NOT NULL,
  [ID_ROLE] INT NOT NULL,
  [PRIVILEGE] INT
)
GO

CREATE TABLE [VIEW] (
  [ID_ROLE] INT NOT NULL,
  [CONTENT] VARCHAR(255) NOT NULL,
  [TITLE] VARCHAR(255)
)
GO

CREATE TABLE [USERXLOCAL] (
  [ID_USER] INT NOT NULL,
  [ID_LOCAL] INT NOT NULL
)
GO

CREATE TABLE [LOCAL] (
  [ID] INT PRIMARY KEY,
  [ID_MEMBERSHIP] INT,
  [NAME] VARCHAR(255) NOT NULL,
  [STATUS] VARCHAR(255) NOT NULL,
  [LOCATION] VARCHAR(255) NOT NULL,
  [OPENING_HOURS] VARCHAR(255) NOT NULL,
  [PHONE_NUMBER] VARCHAR(255) NOT NULL,
  [EMAIL] VARCHAR(255) NOT NULL,
  [DESCRIPTION] VARCHAR(255) NOT NULL,
  [WEBSITE] VARCHAR(255) NOT NULL,
  [PRICE_RANGE] VARCHAR(255) NOT NULL,
  [CATEGORY] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [MEMBERSHIP] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [FEE] FLOAT NOT NULL,
  [TYPE] VARCHAR(255) NOT NULL,
  [COMMISSION] FLOAT NOT NULL,
  [FEE_INTERVAL] VARCHAR(255) NOT NULL,
  [STATUS] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [DRIVER] (
  [ID_USER] INT PRIMARY KEY,
  [ID_MEMBERSHIP] INT NOT NULL,
  [IMAGE] VARCHAR(255) NOT NULL,
  [VEHICLE_LICENCE_PLATE] INT,
  [VEHICLE_ECO_FRIENDLY] VARCHAR NOT NULL,
  [VEHICLE_TYPE] VARCHAR(255) NOT NULL,
  [VEHICLE_IMAGE] VARCHAR(255) NOT NULL,
  [COMMISSION_PER_KM] FLOAT NOT NULL
)
GO

CREATE TABLE [ORDERS] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [ID_BUYER] INT NOT NULL,
  [ID_SELLER] INT NOT NULL,
  [ID_DRIVER] INT,
  [ID_LOCATION] INT,
  [INVOICE] INT,
  [STATUS] VARCHAR(255) NOT NULL,
  [START_TIME] DATETIME NOT NULL,
  [END_TIME] DATETIME,
  [DESCRIPTION] VARCHAR(255),
  [TYPE] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [DOCUMENT] (
  [ID] INT PRIMARY KEY,
  [ID_OWNER] INT NOT NULL,
  [URL] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [ORDER_PRODUCT] (
  [ID_ORDER] INT NOT NULL,
  [PRODUCT_NAME] VARCHAR(255) NOT NULL,
  [PRICE] FLOAT NOT NULL,
  [AMOUNT] INT NOT NULL,
  [FINAL_PRICE] FLOAT NOT NULL
)
GO

CREATE TABLE [BAN] (
  [ID_DRIVER] INT NOT NULL,
  [ID_LOCAL] INT NOT NULL
)
GO

CREATE TABLE [LOCAL_IMAGE] (
  [URL] VARCHAR(255) PRIMARY KEY,
  [ID_LOCAL] INT NOT NULL
)
GO

CREATE TABLE [DISCOUNT] (
  [ID] INT PRIMARY KEY,
  [ID_LOCAL] INT NOT NULL,
  [NAME] VARCHAR(255) NOT NULL,
  [EXPIRATION_DATE] DATETIME NOT NULL,
  [TOTAL] FLOAT NOT NULL,
  [PERCENTAGE] FLOAT NOT NULL,
  [USAGE] VARCHAR(255) NOT NULL,
  [STATUS] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [PRODUCT] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [ID_LOCAL] INT NOT NULL,
  [NAME] VARCHAR(255) NOT NULL,
  [STATUS] VARCHAR(255) NOT NULL,
  [PRICE] FLOAT NOT NULL,
  [DESCRIPTION] VARCHAR(255) NOT NULL,
  [CATEGORY] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [PRODUCT_IMAGE] (
  [URL] VARCHAR(255) PRIMARY KEY,
  [ID_PRODUCT] INT NOT NULL
)
GO

ALTER TABLE [ERROR_LOG] ADD FOREIGN KEY ([ID_ERROR]) REFERENCES [ERROR] ([ID])
GO

ALTER TABLE [VOTES] ADD FOREIGN KEY ([ID_USER]) REFERENCES [USERS] ([ID])
GO

ALTER TABLE [DIRECTION] ADD FOREIGN KEY ([ID_USER]) REFERENCES [USERS] ([ID])
GO

ALTER TABLE [PASSWORD_LOG] ADD FOREIGN KEY ([ID_USER]) REFERENCES [USERS] ([ID])
GO

ALTER TABLE [ROLEXUSER] ADD FOREIGN KEY ([ID_USER]) REFERENCES [USERS] ([ID])
GO

ALTER TABLE [ROLEXUSER] ADD FOREIGN KEY ([ID_ROLE]) REFERENCES [ROLE] ([ID])
GO

ALTER TABLE [VIEW] ADD FOREIGN KEY ([ID_ROLE]) REFERENCES [ROLE] ([ID])
GO

ALTER TABLE [LOCAL] ADD FOREIGN KEY ([ID_MEMBERSHIP]) REFERENCES [MEMBERSHIP] ([ID])
GO

ALTER TABLE [LOCAL] ADD FOREIGN KEY ([CATEGORY]) REFERENCES [UTILS] ([ID])
GO

ALTER TABLE [USERXLOCAL] ADD FOREIGN KEY ([ID_USER]) REFERENCES [USERS] ([ID])
GO

ALTER TABLE [USERXLOCAL] ADD FOREIGN KEY ([ID_LOCAL]) REFERENCES [LOCAL] ([ID])
GO

ALTER TABLE [DRIVER] ADD FOREIGN KEY ([ID_USER]) REFERENCES [USERS] ([ID])
GO

ALTER TABLE [DRIVER] ADD FOREIGN KEY ([ID_MEMBERSHIP]) REFERENCES [MEMBERSHIP] ([ID])
GO

ALTER TABLE [ORDERS] ADD FOREIGN KEY ([ID_BUYER]) REFERENCES [USERS] ([ID])
GO

ALTER TABLE [ORDERS] ADD FOREIGN KEY ([ID_DRIVER]) REFERENCES [DRIVER] ([ID_USER])
GO

ALTER TABLE [ORDERS] ADD FOREIGN KEY ([ID_LOCATION]) REFERENCES [DIRECTION] ([ID])
GO


ALTER TABLE [ORDER_PRODUCT] ADD FOREIGN KEY ([ID_ORDER]) REFERENCES [ORDERS] ([ID])
GO

ALTER TABLE [BAN] ADD FOREIGN KEY ([ID_DRIVER]) REFERENCES [DRIVER] ([ID_USER])
GO

ALTER TABLE [BAN] ADD FOREIGN KEY ([ID_LOCAL]) REFERENCES [LOCAL] ([ID])
GO

ALTER TABLE [LOCAL_IMAGE] ADD FOREIGN KEY ([ID_LOCAL]) REFERENCES [LOCAL] ([ID])
GO

ALTER TABLE [DISCOUNT] ADD FOREIGN KEY ([ID_LOCAL]) REFERENCES [LOCAL] ([ID])
GO

ALTER TABLE [PRODUCT] ADD FOREIGN KEY ([ID_LOCAL]) REFERENCES [LOCAL] ([ID])
GO

ALTER TABLE [PRODUCT] ADD FOREIGN KEY ([CATEGORY]) REFERENCES [UTILS] ([ID])
GO

ALTER TABLE [PRODUCT_IMAGE] ADD FOREIGN KEY ([ID_PRODUCT]) REFERENCES [PRODUCT] ([ID])
GO
