--zad7
create view LoginsAndDepartments as select Employee.LoginID, Department.Name from HumanResources.Employee
join HumanResources.EmployeeDepartmentHistory on EmployeeDepartmentHistory.BusinessEntityID = Employee.BusinessEntityID
join HumanResources.Department on EmployeeDepartmentHistory.DepartmentID = Department.DepartmentID