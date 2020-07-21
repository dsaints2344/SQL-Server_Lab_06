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

-- Store Procedure for Deleting Product Details
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

--Strore procedure for creating customers
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

--Store procedure for updating customer
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

--Store procedure for deleting customer
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

