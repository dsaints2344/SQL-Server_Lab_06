CREATE TABLE [Category] (
  [CategoryID] int,
  [CategoryName] varchar(60),
  PRIMARY KEY ([CategoryID])
);
GO;


CREATE TABLE [Customer] (
  [CustomerID] int,
  [Name] varchar(60),
  [LastName] varchar(60),
  [Address] varchar(110),
  [Country] varchar(30),
  [City] varchar(30),
  [Phone] varchar(10),
  [Credit] float,
  PRIMARY KEY ([CustomerID])
);

GO;

CREATE TABLE [ProductDetails] (
  [ProductDetailsID] int,
  [UnitPrice] float,
  [UnitTax] float,
  [Stock] int,
  [UnitsSold] int,
  PRIMARY KEY ([ProductDetailsID])
);

CREATE TABLE [Orders] (
  [OrderID] int,
  [CustomerID] int FOREIGN KEY REFERENCES [Customer]([CustomerID]),
  [OrderDetailsID] int FOREIGN KEY REFERENCES [OrderDetails]([OrderID]),
  [OrderAmount] float,
  [OrderAddress] varchar(60),
  [OrderTax] float,
  [Freight] float,
  [OrderTotal] float,
  PRIMARY KEY ([OrderID]),
);
CREATE INDEX [FK] ON  [Orders] ([CustomerID], [OrderDetailsID]);
GO;

CREATE TABLE [OrderDetails] (
  [OrderID] int FOREIGN KEY REFERENCES [Orders]([OrderID]),
  [ProductDetailsID] int FOREIGN KEY REFERENCES [ProductDetails]([ProductDetailsID]),
  [DetailName] varchar(50),
  [DetailPrice] float,
  [DetailQuantity] int,
  PRIMARY KEY ([OrderID]),
);

CREATE INDEX [FK] ON  [OrderDetails] ([ProductDetailsID], [OrderID]);
GO;

CREATE TABLE [Product] (
  [ProductID] int,
  [ProductName] varchar(100),
  [CategoryID] int FOREIGN KEY REFERENCES [Category]([CategoryID]),
  [ProductDetailsID] int   FOREIGN KEY REFERENCES [ProductDetails]([ProductDetailsID]),
  PRIMARY KEY ([ProductID]),
);

CREATE INDEX [FK] ON  [Product] ([CategoryID], [ProductDetailsID]);
