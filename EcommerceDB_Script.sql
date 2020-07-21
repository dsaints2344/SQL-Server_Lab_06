-- USE MASTER

-- IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Ecommerce')
-- BEGIN
--   CREATE DATABASE Ecommerce
-- END
-- GO;

-- USE Ecommerce
-- GO;


CREATE TABLE [Category] (
  [CategoryID] int,
  [CategoryName] varchar(60),
  PRIMARY KEY ([CategoryID])
);

CREATE TABLE [ProductDetails] (
  [ProductDetailsID] int,
  [UnitPrice] float,
  [UnitTax] float,
  [Stock] int,
  [UnitsSold] int,
  [ProductID] int not null UNIQUE,
  PRIMARY KEY ([ProductDetailsID])
);

CREATE TABLE [Product] (
  [ProductID] int,
  [ProductName] varchar(100),
  [CategoryID] int,
  [ProductDetailsID] int not null FOREIGN KEY REFERENCES [ProductDetails]([ProductDetailsID]),
  [ProductCategoryID] int not null FOREIGN KEY REFERENCES [Category]([CategoryID]), 
  PRIMARY KEY ([ProductID])
);


CREATE TABLE [Orders] (
  [OrdersID] int,
  [CustomerID] int,
  [OrderDetailsID] int,
  [OrderAmount] float,
  [OrderAddress] varchar(60),
  [OrderTax] float,
  [OrderTotal] float,
  PRIMARY KEY ([OrdersID])
);

CREATE TABLE [OrderDetails] (
  [OrderDetailsID] int,
  [ProductID] int not null FOREIGN KEY REFERENCES [Product]([ProductID]),
  [DetailName] varchar(50),
  [DetailPrice] float,
  [DetailQuantity] int,
  [OrderID] int not null FOREIGN KEY REFERENCES [Orders]([OrdersID]),
  PRIMARY KEY ([OrderDetailsID])
);



CREATE TABLE [Customer] (
  [CustomerID] int,
  [Name] varchar(60),
  [LastName] varchar(60),
  [Address] varchar(110),
  [Country] varchar(30),
  [City] varchar(30),
  [Phone] varchar(10),
  [Credit] float,
  [OrderID] int not null FOREIGN KEY REFERENCES [Orders]([OrdersID]),
  PRIMARY KEY ([CustomerID])
);



ALTER TABLE [ProductDetails]
ADD CONSTRAINT FK__ProductDetails__Product FOREIGN KEY ([ProductID])
  REFERENCES [Product]([ProductID])
