# GB_OLAP
Урок 2. Многомерная модель данных
Домашнее задание
На основе базы данных AdventureWorks постройте свою базу данных с таблицей фактов и таблицами измерений, по схеме "Звезда".

Product, SalesOrderDetail, SalesOrderHeader Звезда состоит из: FctSales, DmnDate, DmnOrder, DmnProduct

Таблица фактов:

select ProductID, f.SalesOrderID, h.OrderDate, sum(f.OrderQty * f.UnitPrice) as Sum from [ods].[dbo].[FctSales] f inner join [ods].[dbo].DmnOrder h on h.SalesOrderID = f.SalesOrderID group by ProductID, f.SalesOrderID, OrderDate) AS SOURCE

где: ProductID - внешний ключ для DmnProduct SalesOrderID - внешний ключ для DmnOrder OrderDate - внешний ключ для DmnDate

как создавалась таблица: INSERT INTO ods.[dbo].[FctSales] ([ProductID] ,[SalesOrderID] ,[OrderQty] ,[UnitPrice] ,[ModifiedDate]) select d.ProductID, d.SalesOrderID, d.OrderQty, d.UnitPrice, d.ModifiedDate from [stg].[dbo].[SalesOrderDetail] d

DmnOrder: INSERT INTO [ods].[dbo].[DmnOrder] ([SalesOrderID], [SalesOrderNumber], [AccountNumber], [CreditCardID], [OrderDate], [ModifiedDate]) select SalesOrderID, SalesOrderNumber, AccountNumber, CreditCardID, OrderDate, ModifiedDate from [stg].[dbo].SalesOrderHeader
