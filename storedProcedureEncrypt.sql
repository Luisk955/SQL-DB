/*CREATE PROCEDURE [dbo].[CRE_USER_PR]

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
GO*/

----prueba
execute  [dbo].[CRE_USER_PR] 22,'Mario','Delgado','88184364','2019-04-05 00:00:00.000','lucas',22,'lucas@paypal.com','lucas@gmail.com','2019-04-05 ','nadad','dasdsads'
go
------------ listar
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


CREATE PROCEDURE RET_USERL_LOGIN
@P_PASSWORD nvarchar(255),
@P_EMAIL nvarchar(50)
AS
Begin


open symmetric key PASSWORD_key_01
decryption by certificate cifrando01;

Select us.ID,us.NAME,us.LAST_NAME,us.PHONE_NUMBER,us.BIRTHDATE,us.STATUS,us.BALANCE,us.PAYPAL_USER,us.EMAIL,us.CREATION_DATE,us.PHONE_CONF,us.EMAIL_CONF,Rol.NAME as RNAME from dbo.[USERS] as us 
INNER JOIN [dbo].[ROLEXUSER] as RxU  ON  us.ID=RxU.ID_USER 
INNER JOIN [dbo].[ROLE] as Rol  ON  Rol.ID=RxU.ID_ROLE  where  us.EMAIL=@P_EMAIL  
and convert(nvarchar(255),DECRYPTBYKEY(us.PASSWORD))=@P_PASSWORD

close symmetric key PASSWORD_key_01;

END


go

execute  RET_USERL_LOGIN 'mario20','pedro@gmail.com'
go

Create procedure RET_RECOVERPASS_PR
@P_EMAIL nvarchar(50)
as
Begin
open symmetric key PASSWORD_key_01
decryption by certificate cifrando01;


Select 
us.EMAIL,convert(nvarchar(255),DECRYPTBYKEY(us.PASSWORD)) as PASSWORD from dbo.[USERS] as us WHERE us.EMAIL =@P_EMAIL;


close symmetric key PASSWORD_key_01;
END

Go

execute  RET_RECOVERPASS_PR 'fdfdf@gmail.com'

go


drop procedure UPD_PASS_PR
go


CREATE PROCEDURE UPD_PASS_PR
@P_ID int,
@P_PASSWORD nvarchar(25)
	

	
AS

begin
open symmetric key PASSWORD_key_01
decryption by certificate cifrando01;

declare @PASSWORD varbinary(128)
	set @PASSWORD = ENCRYPTBYKEY(KEY_GUID('PASSWORD_key_01'),convert(nvarchar(255),@P_PASSWORD));
	UPDATE dbo.[USERS] SET PASSWORD=@PASSWORD  WHERE ID=@P_ID;


	close symmetric key PASSWORD_key_01;
	end
GO


execute  UPD_PASS_PR 22, 'lucas22'
go