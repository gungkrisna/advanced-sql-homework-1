-- For the first 10 orders by CutomerId BLONP : get the Order's Id , OrderDate , previous OrderDate , and difference between the previous and current. Return results ordered by OrderDate (ascending)
-- Details: The "previous" OrderDate for the first order should default to itself (lag time = 0). Use the julianday() function for date arithmetic

SELECT Id,
	LastOrder,
	PreviousOrder,
	ROUND(JULIANDAY(LastOrder) - JULIANDAY(PreviousOrder), 2) AS Difference
FROM(
	SELECT Id,
	OrderDate AS LastOrder,
	LAG(OrderDate, 1, OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrder
	FROM 'Order'
	WHERE CustomerId = "BLONP"
	ORDER BY LastOrder
	LIMIT 10
);