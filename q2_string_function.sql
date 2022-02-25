-- Q2: Get all unique ShipNames from the Order table that contain a hyphen '-' .
-- Details: In addition, get all the characters preceding the (first) hyphen. Return ship names alphabetically.
-- Your first row should look like Bottom-Dollar Markets|Bottom

SELECT DISTINCT ShipName, SUBSTR(ShipName, 0, INSTR(ShipName, '-')) AS Prefix
FROM 'Order'
WHERE ShipName LIKE '%-%'
ORDER BY ShipName;
