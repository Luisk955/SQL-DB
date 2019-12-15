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

	VALUES (@P_ID,@P_NAME,@P_LAST_NAME,@P_PHONE_NUMBER,CONVERT(datetime, @P_BIRTHDATE, 20),@PASSWORD,'statAct', @P_BALANCE,@P_PAYPAL_USER,@P_EMAIL,CONVERT(datetime, @P_CREATION_DATE, 20),@P_PHONE_CONF,@P_EMAIL_CONF);

	close symmetric key PASSWORD_key_01;
	end
GO*/

----prueba
--execute  [dbo].[CRE_USER_PR] 22,'Mario','Delgado','88184364','2019-04-05 00:00:00.000','lucas',22,'lucas@paypal.com','lucas@gmail.com','2019-04-05 ','nadad','dasdsads'
--go



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




--execute  RET_USERL_LOGIN 'mario20','pedro@gmail.com'
--go





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

--execute  RET_RECOVERPASS_PR 'fdfdf@gmail.com'

--go





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


CREATE PROCEDURE UPD_USERPaypalEmail
@P_ID int,
@P_PAYPAL_USER nvarchar(25)
	

	
AS
	UPDATE dbo.[USERS] SET PAYPAL_USER=@P_PAYPAL_USER  WHERE ID=@P_ID;
GO



Create procedure RET_USERL_byID
@P_ID int
as
Begin
SELECT
us.ID,us.NAME,us.LAST_NAME,us.PHONE_NUMBER,us.BIRTHDATE,us.PASSWORD,us.STATUS,us.BALANCE,us.PAYPAL_USER,us.EMAIL,us.CREATION_DATE,us.PHONE_CONF,us.EMAIL_CONF,Rol.NAME as RNAME from dbo.[USERS] as us 
INNER JOIN [dbo].[ROLEXUSER] as RxU  ON  us.ID=RxU.ID_USER 
INNER JOIN [dbo].[ROLE] as Rol  ON  Rol.ID=RxU.ID_ROLE  WHERE us.ID=@P_ID
END

Go

create procedure MONTO_TOTAL_ORDEN
@P_ID_ORDER int
AS
BEGIN
select oderP.ID_ORDER,oderP.PRODUCT_NAME,oderP.PRICE,oderP.AMOUNT ,oderP.FINAL_PRICE   FROM dbo.[ORDERS] as ord 
INNER JOIN  [dbo].[ORDER_PRODUCT] as oderP on ord.ID=oderP.ID_ORDER where  ord.ID=@P_ID_ORDER
END

GO

create procedure LISTAR_ORDENES_BY_ID_USER
@P_ID_ORDER int
AS
BEGIN
select oderP.ID_ORDER,oderP.PRODUCT_NAME,oderP.PRICE,oderP.AMOUNT ,oderP.FINAL_PRICE,ord.END_TIME   FROM dbo.[ORDERS] as ord 
INNER JOIN  [dbo].[ORDER_PRODUCT] as oderP on ord.ID=oderP.ID_ORDER where  ord.ID_BUYER=@P_ID_ORDER
END

GO

--execute  UPD_PASS_PR 22, 'lucas22'
--go



CREATE PROCEDURE UPD_USER_BALANCE
@P_ID int,
@P_BALANCE float(25)
	

	
AS

begin



	UPDATE dbo.[USERS] SET BALANCE=BALANCE+@P_BALANCE  WHERE ID=@P_ID;


	
	end
GO

execute UPD_USER_BALANCE 11, 2525
go



CREATE PROCEDURE RET_ALL_MEMBERSHIP_LOCAL_DRIVER_USER_PR
@P_ID int
AS
SELECT m.id ID,m.FEE FEE,m.COMMISSION COMMISSION,m.FEE_INTERVAL FEE_INTERVAL,U.NAME STATUS,m.TYPE TYPE from MEMBERSHIP as m 

INNER JOIN LOCAL L on M.ID = L.ID_MEMBERSHIP
INNER JOIN USERXLOCAL as UXL ON L.ID=UXL.ID_LOCAL


JOIN UTILS U ON M.STATUS = U.ID
WHERE UXL.ID_USER = @P_ID and m.STATUS ='memPenP'
UNION 
Select m.id ID,m.FEE FEE,m.COMMISSION COMMISSION,m.FEE_INTERVAL FEE_INTERVAL,U.NAME STATUS,m.TYPE TYPE from membership M
JOIN DRIVER D ON M.ID = D.ID_MEMBERSHIP
JOIN UTILS U ON M.STATUS = U.ID
WHERE D.ID_USER = @P_ID and m.STATUS ='memPenP'

Go



--execute RET_ALL_MEMBERSHIP_LOCAL_DRIVER_USER_PR 8
--go


--UPDATE dbo.[USERS] SET EMAIL_CONF='Active'  WHERE ID=@P_ID;


create procedure UPD_MEMBERSHIP_STATUS_PR
@P_ID int,
@P_FEE float
as
begin
UPDATE dbo.[MEMBERSHIP] SET STATUS='Activa'  WHERE ID=@P_FEE;


end
go

--execute UPD_MEMBERSHIP_STATUS_PR 11,1
--go






create procedure RET_BALANCE_USERL_byID
@P_ID int

as


BEGIN
select us.BALANCE,us.PAYPAL_USER   FROM dbo.[USERS] as us where us.ID=@P_ID

END
go

--execute RET_BALANCE_USERL_byID 11
--go


--execute UPD_MEMBERSHIP_STATUS_PR 11,1
--go

create procedure UPD_USERCHECK_PR
   @P_EMAIL_CONF varchar(255),
   @P_PHONE_CONF varchar(255)

   as
   begin
   UPDATE dbo.[USERS] SET STATUS='Act'  WHERE EMAIL_CONF=@P_EMAIL_CONF and PHONE_CONF=@P_PHONE_CONF
   end

   go


--  execute UPD_USERCHECK_PR 'tidhmTIDH','tidhmTIDH'
--go