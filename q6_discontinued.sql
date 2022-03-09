-- For each of the 8 discontinued products in the database, which customer made the first ever order for the product? Output the customer's CompanyName and ContactName

SELECT ProductName, CompanyName, ContactName
FROM(
	SELECT ProductName, CompanyName, ContactName, MIN(OrderDate)
	FROM(
		SELECT Id, ProductName
		FROM Product
		WHERE Discontinued = 1
	) AS DiscontinuedProduct
	INNER JOIN OrderDetail od ON od.ProductId = DiscontinuedProduct.Id 
	INNER JOIN 'Order' o ON o.Id = od.OrderId 
	INNER JOIN Customer c ON c.Id = o.CustomerId
	GROUP BY DiscontinuedProduct.Id 
	)
ORDER BY ProductName;