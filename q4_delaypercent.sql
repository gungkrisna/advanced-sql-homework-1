-- For each Shipper , find the percentage of orders which are late.
-- Details: An order is considered late if ShippedDate > RequiredDate . Print the following format, order by descending precentage, rounded to the nearest hundredths, like United Package|23.44

SELECT CompanyName,
	ROUND(NumberofDelay * 100.0 / NumberofShipping, 2) as LatePercentage
FROM(
	SELECT ShipVia AS id, COUNT(*) as NumberofShipping
	FROM 'Order'
	GROUP BY ShipVia
	) AS TotalShipment
INNER JOIN(
	SELECT ShipVia AS id, COUNT(*) as NumberofDelay
	FROM 'Order'
	WHERE ShippedDate > RequiredDate
	GROUP BY ShipVia
	) AS TotalDelay
ON TotalShipment.id = TotalDelay.id
INNER JOIN Shipper on TotalShipment.id = Shipper.Id
ORDER BY LatePercentage DESC;