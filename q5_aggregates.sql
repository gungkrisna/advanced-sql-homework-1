-- Compute some statistics about categories of products
-- Details: Get the number of products, average unit price (rounded to 2 decimal places), minimum unit price, maximum unit price, and total units on order for categories containing greater than 10 products.

SELECT CategoryName,
	COUNT(*) AS qty,
	ROUND(AVG(UnitPrice), 2) AS AveragePrice,
	MIN(UnitPrice) AS MinimumPrice,
	MAX(UnitPrice) AS MaximumPrice,
	SUM(UnitsOnOrder) AS TotalOrder
FROM Product p INNER JOIN Category c ON p.CategoryId = c.Id
GROUP BY p.CategoryId 
HAVING qty > 10
ORDER BY p.CategoryId;