-- Find the youngest employee serving each Region . If a Region is not served by an employee, ignore it.
-- Details: Print the Region Description, First Name, Last Name, and Birth Date. Order by Region Id.

SELECT r.RegionDescription, FirstName, LastName, MAX(BirthDate) AS BirthDate 
FROM Employee AS e 
INNER JOIN EmployeeTerritory et ON e.Id = et.EmployeeId 
INNER JOIN Territory t ON et.TerritoryId = t.Id 
INNER JOIN Region r ON t.RegionId  = r.Id 
GROUP BY r.Id 
ORDER BY r.Id;