-- RETRIVE ALL ORDERS FINAL USER

CREATE PROCEDURE RET_ORDERS_USER_PR
	@P_Id_Buyer int
as
	Select O.Id ID,O.Id_Buyer ID_BUYER,O.Id_Seller ID_SELLER,O.Id_Driver ID_DRIVER,O.Id_Location ID_LOCATION, O.Invoice INVOICE,U.Name STATUS,O.Start_Time START_TIME,O.End_Time END_TIME,O.Description DESCRIPTION,O.Type TYPE from orders O
	Join UTILS U on O.STATUS=U.Id
	where o.id_buyer=@P_Id_Buyer;
GO