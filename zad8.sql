1
begin

declare @srednia float
set @srednia = (select avg(Rate*PayFrequency) from HumanResources.EmployeePayHistory);

select *, @srednia as "Œrednia" from HumanResources.Employee 
join HumanResources.EmployeePayHistory on Employee.BusinessEntityID=EmployeePayHistory.BusinessEntityID
where Rate*PayFrequency<@srednia

end;

2
create function zwrot_daty_wysylki (@ID int)
returns table as 
return (select ShipDate from Purchasing.PurchaseOrderHeader where PurchaseOrderID = @ID)

3
create procedure dane_produktu
@nazwa varchar(40) = null
as
 
begin
select ProductID, ProductNumber, SafetyStockLevel from Production.Product where Name = @nazwa
end;

4
create function zwrot_numeru_karty (@ID int)
returns table as
return (select CardNumber from Sales.CreditCard 
join Sales.SalesOrderHeader on CreditCard.CreditCardID = SalesOrderHeader.CreditCardID
where SalesOrderID = @ID)

5
create procedure dzielenie 
@num1 int = null,
@num2 int = null
as

begin
if @num1 > @num2
	select @num1/@num2 as "Iloraz"
else 
	print 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe'
end;














