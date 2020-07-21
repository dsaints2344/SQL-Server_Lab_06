--Stored procedure for adding
CREATE PROCEDURE InsertCategory(@id INT, @name VARCHAR(56))
AS
IF (@id IS NOT NULL AND @name <> '')
	BEGIN
		BEGIN TRY
			INSERT INTO Category(CategoryID, CategoryName) VALUES(@id, @name)
			SELECT * FROM Category
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right values'
	END
GO

--Stored procedure for updating product categories
CREATE PROCEDURE UpdateCategory(@id INT, @name VARCHAR(56))
AS
IF (@id IS NOT NULL AND @name <> '')
	BEGIN
		BEGIN TRY
			 UPDATE Category SET
			 CategoryName = @name
			 WHERE CategoryID = @id
			 SELECT * FROM Category 
			 WHERE CategoryID = @id
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right values'
	END
GO

--Stored procedure for deleting product category
CREATE PROCEDURE DeleteCategory(@id INT)
AS
IF (@id IS NOT NULL)
	BEGIN
		BEGIN TRY
			 DELETE Category WHERE CategoryID = @id
			 SELECT * FROM Category
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right value'
	END
GO

--Stored procedure for Inserting Product
CREATE PROCEDURE InsertProducts(@id INT, @name VARCHAR(56), @categoryId INT, @productDetailsId INT)
AS
IF (@id IS NOT NULL AND @name <> '' AND @categoryId IS NOT NULL AND @productDetailsId IS NOT NULL)
	BEGIN
		BEGIN TRY
			INSERT INTO Product (ProductID, ProductName, ProductDetailsID, ProductCategoryID) VALUES(@id, @name, @ProductDetailsID, @categoryId)
			SELECT * FROM Product
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right values'
	END
GO

--Stored procedures for updating products
CREATE PROCEDURE UpdateProducts(@id INT, @name VARCHAR(56), @categoryId INT, @productDetailsId INT)
AS
IF (@id IS NOT NULL AND @name <> '' AND @categoryId IS NOT NULL AND @productDetailsId IS NOT NULL)
	BEGIN
		BEGIN TRY
			UPDATE Product SET ProductName = @name, ProductCategoryID = @categoryId, ProductDetailsID = @productDetailsId
			WHERE ProductID = @id
			SELECT * FROM Product
			WHERE ProductID = @id
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right values'
	END
GO

--Stored procedure for deleting Product
CREATE PROCEDURE DeleteProducts(@id INT)
AS
IF (@id IS NOT NULL)
	BEGIN
		BEGIN TRY
			DELETE Product
			WHERE ProductID = @id
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right value'
	END
GO

-- Stored procedure for Inserting Product Details
CREATE PROCEDURE InsertProductDetails(@id INT, @unitPrice FLOAT, @unitTax FLOAT, @stock INT, @unitsSold INT)
AS
IF (@id IS NOT NULL AND @unitPrice IS NOT NULL AND @stock IS NOT NULL AND @unitsSold IS NOT NULL AND @unitTax IS NOT NULL)
	BEGIN
		BEGIN TRY
			INSERT INTO ProductDetails(ProductDetailsID, UnitPrice, UnitTax, UnitsSold, Stock) 
			VALUES(@id, @unitPrice, @unitTax, @unitsSold, @stock)
			SELECT * FROM ProductDetails
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right values'
	END
GO

-- Stored procedure for Updating Product details
CREATE PROCEDURE UpdateProductDetails(@id INT, @unitPrice FLOAT, @unitTax FLOAT, @stock INT, @unitsSold INT)
AS
IF (@id IS NOT NULL AND @unitPrice IS NOT NULL AND @stock IS NOT NULL AND @unitsSold IS NOT NULL AND @unitTax IS NOT NULL)
	BEGIN
		BEGIN TRY
			UPDATE ProductDetails SET UnitPrice = @unitPrice, UnitTax = @unitTax, UnitsSold = @unitsSold, Stock = @stock
			WHERE ProductDetailsID = @id
			SELECT * FROM ProductDetails
			WHERE ProductDetailsID = @id
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right values'
	END
GO

-- Stored Procedure for Deleting Product Details
CREATE PROCEDURE DeleteProductDetails(@id INT)
AS
IF (@id IS NOT NULL)
	BEGIN
		BEGIN TRY
			DELETE ProductDetails 
			WHERE ProductDetailsID = @id
			SELECT * 
			FROM ProductDetails
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right value'
	END
GO

--Strored procedure for creating customers
CREATE PROCEDURE InsertCustomer(@id INT, @name VARCHAR(60), @lastName VARCHAR(60), @address VARCHAR(110), @country VARCHAR(30), @city VARCHAR(30), @phone VARCHAR(10), @credit FLOAT)
AS
	IF(@id IS NOT NULL AND @name <> '' AND @lastName <> '' AND @address <> '' AND @country <> '' AND @city <> '' AND @phone <> '' AND @credit IS NOT NULL)
		BEGIN
		BEGIN TRY
			INSERT INTO Customer(CustomerID, Name, LastName, Address, Country, City, Credit)
			VALUES(@id, @name, @lastName, @address, @country, @city, @credit)
			SELECT * FROM Customer
		END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right values'
	END
GO

--Stored procedure for updating customer
CREATE PROCEDURE UpdateCustomer(@id INT, @name VARCHAR(60), @lastName VARCHAR(60), @address VARCHAR(110), @country VARCHAR(30), @city VARCHAR(30), @phone VARCHAR(10), @credit FLOAT)
AS
	IF(@id IS NOT NULL AND @name <> '' AND @lastName <> '' AND @address <> '' AND @country <> '' AND @city <> '' AND @phone <> '' AND @credit IS NOT NULL)
		BEGIN
			BEGIN TRY
				UPDATE Customer SET Name = @name, LastName = @lastName, Address = @address, Country = @country, City = @city, Phone = @phone, Credit = @credit
				WHERE CustomerID = @id
				SELECT * FROM Customer
				WHERE CustomerID = @id
				END TRY
		BEGIN CATCH
			SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END
ELSE
	BEGIN
	PRINT 'null input detected, please type the right values'
	END
GO

--Stored procedure for deleting customer
CREATE PROCEDURE DeleteCustomer(@id INT)
AS
	IF (@id IS NOT NULL)
		BEGIN
			BEGIN TRY
				DELETE Customer
				WHERE CustomerID = @id
				SELECT * FROM Customer
			END TRY
			BEGIN CATCH
				SELECT 
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_STATE() AS ErrorState,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				ERROR_MESSAGE() AS ErrorMessage
			END CATCH
		END
	ELSE
		BEGIN
			PRINT 'null input detected, please type the right value'
		END
GO


-- Function for calculating order total
CREATE FUNCTION GetTotal(@productName VARCHAR(100), @orderQuantity INT)
	RETURNS TABLE
	AS
		RETURN (
			SELECT Product.ProductID, ProductDetails.UnitPrice, (ProductDetails.UnitTax * @orderQuantity) AS TotalTax, ((ProductDetails.UnitTax * @orderQuantity) + (ProductDetails.UnitPrice * @orderQuantity)) AS TotalOrder 
			FROM Product INNER JOIN ProductDetails 
			ON Product.ProductID = ProductDetails.ProductID 
			WHERE Product.ProductName = @productName AND ProductDetails.Stock >= @orderQuantity
		)
	GO;

--stored procedure for Adding Orders
CREATE PROCEDURE AddOrder(@id INT, @customerId INT, @Quantity INT, @Name VARCHAR(100), @orderAddress VARCHAR(60))
AS
	IF(@id IS NOT NULL AND @customerId IS NOT NULL AND @Quantity IS NOT NULL AND @Name <> '' AND @orderAddress <> '')
		BEGIN
			BEGIN TRY
				IF((SELECT COUNT(*) FROM GetTotal(@Name, @Quantity)) = 0)
					BEGIN
						Print 'Wrong data or product out of stock'
					END
				ELSE
					DECLARE @tempTaxes FLOAT
					DECLARE @tempTotal FLOAT
					DECLARE @productId INT
					SET @tempTaxes = (SELECT TotalTax FROM GetTotal(@Name, @Quantity))
					SET @tempTotal = (SELECT TotalOrder FROM GetTotal(@Name, @Quantity))
					SET @productId = (SELECT ProductID FROM GetTotal(@Name, @Quantity))
					BEGIN
						INSERT INTO Orders(OrdersID, CustomerID, OrderAddress)
						VALUES(@id, @customerId, @orderAddress)

						INSERT INTO OrderDetails(OrderDetailsID, ProductID, DetailPrice, DetailQuantity, DetailTaxes, OrderID, DetailName)
						VALUES (@id, @productId, @tempTotal, @tempTotal, @Quantity, @id, @Name)

						UPDATE Orders
						SET OrderTax = (SELECT SUM(DetailTaxes) FROM OrderDetails WHERE ProductID = @id),
						OrderTotal = (SELECT SUM(DetailPrice) FROM OrderDetails WHERE ProductID = @id)

						UPDATE ProductDetails
						SET Stock = (SELECT Stock FROM Product) - @Quantity,
						UnitsSold = (SELECT UnitsSold FROM ProductDetails) + @Quantity 

					END
			END TRY
			BEGIN CATCH
				SELECT 
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_STATE() AS ErrorState,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				ERROR_MESSAGE() AS ErrorMessage
			END CATCH
		END
	ELSE
		BEGIN
			PRINT 'NULL input detected, please type the right value' 
		END
GO

-- Stored procedure for Adding Order Details
CREATE PROCEDURE AddOrderDetails(@id INT, @orderQuantity INT, @productName VARCHAR(100), @orderId INT)
AS
	DECLARE @ProductID INT
	DECLARE @tempTotal FLOAT
	DECLARE @tempTaxes FLOAT
	IF(@id IS NOT NULL AND @orderQuantity IS NOT NULL AND @orderId IS NOT NULL AND @productName <> '')
		

		SET @ProductID = (SELECT ProductID FROM GetTotal(@productName, @orderQuantity))
		SET @tempTotal = (SELECT TotalOrder FROM GetTotal(@productName, @orderQuantity))
		SET @tempTaxes = (SELECT TotalTax FROM GetTotal(@productName, @orderQuantity))

		BEGIN
			BEGIN TRY
				INSERT INTO OrderDetails (OrderDetailsID, ProductID, DetailName, DetailPrice, DetailQuantity, DetailTaxes, OrderID)
				VALUES (@id, @ProductID, @productName, @tempTotal, @orderQuantity, @tempTaxes, @orderId)
			END TRY
			BEGIN CATCH
				SELECT 
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_STATE() AS ErrorState,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				ERROR_MESSAGE() AS ErrorMessage
			END CATCH
		END
	ELSE
		BEGIN
			PRINT 'Null Input detected, please input the right values'
		END
GO

