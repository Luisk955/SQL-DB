-- procedimiento almacenado registar usuario con password encryptado
-- create  database master key
  create master key encryption by
  password ='SimplePassword';
  go

  -- create certificate
  create certificate cifrando01
  with subject='cifrando';
  go


  select * from sys.certificates
  go

-- create symmetric key 
create symmetric key PASSWORD_key_01
with algorithm = AES_256
encryption by certificate cifrando01;

go

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
	begin
	open symmetric key PASSWORD_key_01
decryption by certificate cifrando01;

declare @PASSWORD varbinary(128)
	set @PASSWORD = ENCRYPTBYKEY(KEY_GUID('PASSWORD_key_01'),convert(nvarchar(255),@P_PASSWORD));

	INSERT INTO USERS (ID,NAME,LAST_NAME,PHONE_NUMBER,BIRTHDATE,PASSWORD,STATUS,BALANCE,PAYPAL_USER,EMAIL,CREATION_DATE,PHONE_CONF,EMAIL_CONF) 

	VALUES (@P_ID,@P_NAME,@P_LAST_NAME,@P_PHONE_NUMBER,CONVERT(datetime, @P_BIRTHDATE, 20),@PASSWORD,'enabled', @P_BALANCE,@P_PAYPAL_USER,@P_EMAIL,CONVERT(datetime, @P_CREATION_DATE, 20),@P_PHONE_CONF,@P_EMAIL_CONF);

	close symmetric key PASSWORD_key_01;
	end
GO

----prueba
execute  [dbo].[CRE_USER_PR] 4,'Mario','Delgado','88184364','2019-04-05 00:00:00.000','mario',22,'mario@paypal.com','mariodelgt@gmail.com','2019-04-05 ','nadad','dasdsads'
go



------------ listar   



CREATE PROCEDURE RET_ALL_USER_PR

AS

	SELECT * FROM USERS;

GO

	create procedure listarUsersPassEncrypt
	as
begin

open symmetric key PASSWORD_key_01
decryption by certificate cifrando01;
select
ID,NAME,LAST_NAME, STATUS,convert(nvarchar(255),DECRYPTBYKEY(PASSWORD)) as [password descifrado],PHONE_NUMBER,BIRTHDATE,BALANCE,PAYPAL_USER,EMAIL,CREATION_DATE FROM USERS



close symmetric key PASSWORD_key_01;

END
GO

execute listarUsersPassEncrypt
go