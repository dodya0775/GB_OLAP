--dmnLocation
select LocationID, Name as LocationName from [Production].Location

--dmnProduct
select ProductID, Name as ProdactName from [Production].Product

--dmnDate
select distinct ActualStartDate, YEAR(ActualStartDate) as Year, MONTH(ActualStartDate) as MonthNum, DAY(ActualStartDate) as Day from [Production].[WorkOrderRouting]

--fact
select LocationID, ProductID, ActualStartDate, ActualCost from [Production].[WorkOrderRouting]
order by ActualStartDate, ProductID


--create

--dmnLocation
DROP TABLE IF EXISTS dwh_dz.dbo.dmnLocation
select LocationID, Name as LocationName
into dwh_dz.dbo.dmnLocation
from [Production].Location

--dmnProduct
DROP TABLE IF EXISTS dwh_dz.dbo.dmnProduct
select ProductID, Name as ProductName
into dwh_dz.dbo.dmnProduct
from [Production].Product

--dmnDate
DROP TABLE IF EXISTS dwh_dz.dbo.dmnDate
select distinct ActualStartDate, YEAR(ActualStartDate) as Year, MONTH(ActualStartDate) as Month, DAY(ActualStartDate) as Day
into dwh_dz.dbo.dmnDate
from [Production].WorkOrderRouting

select YEAR, MONTH, DAY from dwh_dz.dbo.dmnDate

--fact
DROP TABLE IF EXISTS dwh_dz.dbo.Fact
select WorkOrderID, LocationID, ProductID, ActualStartDate, ActualCost
into dwh_dz.dbo.Fact
from [Production].[WorkOrderRouting]
order by ActualStartDate, ProductID

