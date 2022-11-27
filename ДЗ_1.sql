select WorkOrderID, LocationID,ProductID, ActualStartDate, ActualCost from [Production].[WorkOrderRouting]
order by ActualStartDate, ProductID