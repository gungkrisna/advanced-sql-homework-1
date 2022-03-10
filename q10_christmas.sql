-- Concatenate the ProductName s ordered by the Company 'Queen Cozinha' on 2014-12-25.
-- Details: Order the products by Id (ascending).

WITH PurchasedProducts AS (
	SELECT p.Id, p.ProductName
	FROM Product p
		INNER JOIN OrderDetail od ON p.Id = od.ProductId
		INNER JOIN 'Order' o ON o.Id = od.OrderId
		INNER JOIN Customer c ON o.CustomerId = c.Id
	WHERE DATE(OrderDate) = '2014-12-25' AND CompanyName = 'Queen Cozinha'
	GROUP BY p.Id 
),
c as (
	SELECT ROW_NUMBER() OVER (ORDER BY pp.id) AS seqnum, pp.ProductName AS name
	FROM PurchasedProducts pp
),
flattened AS (
	SELECT *
	FROM c
	WHERE seqnum = 1
	UNION ALL
	SELECT c.seqnum, f.name || ', ' || c.name 
	FROM c JOIN flattened f ON c.seqnum = f.seqnum + 1
)
SELECT name FROM flattened 
ORDER BY seqnum DESC LIMIT 1;
