﻿--CREATE COUPON
CREATE PROCEDURE [dbo].[CRE_COUPON_PR]
@P_CODE INT,
	@P_STATUS VARCHAR(255),
	@P_VALUE FLOAT,
	@P_END_DATE DATE,
	@P_MAX_USES INT,
	@P_CURRENT_USES INT
AS
	INSERT INTO COUPON VALUES(@P_CODE,@P_STATUS,@P_VALUE,CONVERT(datetime,@P_END_DATE,20),@P_MAX_USES,@P_CURRENT_USES);

	GO
	-- DELETE COUPON
CREATE PROCEDURE [dbo].[DEL_COUPON_PR]
	@P_CODE INT
AS
	DELETE FROM COUPON WHERE CODE=@P_CODE;

	GO


	

--RETRIVE ALL COUPON
CREATE PROCEDURE [dbo].[RET_ALL_COUPON_PR]
AS
	SELECT * FROM COUPON;

	GO

	
--RETRIEVE COUPON BY ID
CREATE PROCEDURE [dbo].[RET_COUPON_PR]
	@P_CODE INT
AS
	SELECT * FROM [dbo].COUPON where CODE= @P_CODE;

	GO

	
--UPDATE COUPON
CREATE PROCEDURE [dbo].[UPD_COUPON_PR]
	@P_CODE INT,
	@P_STATUS VARCHAR(255),
	@P_VALUE FLOAT,
	@P_END_DATE DATE,
	@P_MAX_USES INT,
	@P_CURRENT_USES INT 
AS
	UPDATE [dbo].[COUPON] SET CODE=@P_CODE, STATUS=@P_STATUS,VALUE=@P_VALUE ,END_DATE=@P_END_DATE ,MAX_USES=@P_MAX_USES ,CURRENT_USES=@P_CURRENT_USES WHERE CODE=@P_CODE;

	GO