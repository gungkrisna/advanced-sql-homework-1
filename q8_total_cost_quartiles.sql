-- For each Customer , get the CompanyName, CustomerId, and "total expenditures". Output the bottom quartile of Customers, as measured by total expenditures.
-- Details: Calculate expenditure using UnitPrice and Quantity (ignore Discount ). Compute the quartiles for each company's total expenditures using NTILE. The bottom quartile is the 1st quartile, order them by increasing expenditure.

WITH CustomerExpenditures AS (
    SELECT IFNULL(CompanyName, 'MISSING_NAME') AS CompanyName,
    	o.CustomerId,
    	ROUND(SUM(od.Quantity * od.UnitPrice), 2) AS TotalExpenditure
    FROM 'Order' AS o
    INNER JOIN OrderDetail od on od.OrderId = o.Id
    LEFT JOIN Customer c on c.Id = o.CustomerId
    GROUP BY o.CustomerId
),
QuartilesData AS (
    SELECT *, NTILE(4) OVER (ORDER BY TotalExpenditure) AS Q
    FROM CustomerExpenditures
)
SELECT CompanyName, CustomerId, TotalExpenditure
FROM QuartilesData
WHERE Q = 1
ORDER BY TotalExpenditure;