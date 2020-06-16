--1
create procedure Fibonacci (@liczba int)
as
declare @1liczba int=0;
declare @2liczba int=1;
declare @ciag int=0;

if @liczba=1
begin 
set @ciag=0;
end;

else begin
while @liczba-1>1
	begin
	set @ciag=@1liczba+@2liczba;
	set @1liczba=@2liczba;
	set @2liczba=@ciag;
	set @liczba=@liczba-1;
	end;
end;

-elect @ciag as ciag;
return;

--2
create trigger last ON AdventureWorks2017.Person.Person
for
update as
update Person set LastName=upper(LastName)

--3
create trigger taxRateMonitoring ON AdventureWorks2017.Sales.SalesTaxRate
after update as
begin
set noncount ON;
	declare @before float;
	declare @after float;
	select @after=TaxRate from inserted
	select @before=TaxRate from deleted
	if ((@after<0.7*@before) or (@after>1.3*@before))
		begin
		print 'ERROR! The change in tax is greater than 30%!'
		rollback
		return
	end;
end;