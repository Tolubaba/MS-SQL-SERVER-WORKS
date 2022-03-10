
 CREATE TABLE [dbo].[tblproduct2](
	[productid] [int] NULL,
	[name] [nvarchar](40) NULL,
	[unitprice] [int] NULL,
	[qtyavailable] [int] NULL
) ON [PRIMARY]
GO


select * from tblproduct2

insert into tblproduct2 values( 1,'laptops',2340,100),
(2,'desktops',3647,50)

select * from tblproduct2 

begin transaction

update tblproduct2 set qtyavailable =90 where productid=1

rollback transaction
-- to create a table for pysical address
create table tblphysicaladdress(  
addressid int,
employeenumber int,
housenumber nvarchar(50),
streetaddress nvarchar(50),
city nvarchar(50),
postalcode nvarchar(50)
)
--inserting values into table physical address
insert into tblphysicaladdress values (1,101,'#10','kingstreet','london','cr27dw')
-- create table mailing address
create table tblmailingaddress(  
addressid int,
employeenumber int,
housenumber nvarchar(50),
streetaddress nvarchar(50),
city nvarchar(50),
postalcode nvarchar(50)
)

--inserting  values into tblmailing address
insert into tblmailingaddress values (1,101,'#10','kingstreet','london','cr27dw')


select * from tblphysicaladdress
select * from tblmailingaddress
-- creating a stored procedure to update the city from the various table using transaction and also checking for erroe and rolling back the transaction if error occurs
 create proc spupdateaddress
as
begin
  begin try
    begin transaction
	update tblmailingaddress set city='akure' where addressid =1

	update tblphysicaladdress set city ='akure' where addressid =1

	commit transaction
	select * from tblmailingaddress
	select * from tblphysicaladdress
	print 'transsaction committed'
  end try
  begin catch
  rollback transaction
  print 'transaction not committed'

  end catch

end

exec spupdateaddress
-- this a case study to show that the exection will run but no changes will be mad and the transaction will be rolled back
alter proc spupdateaddress
as
begin
  begin try
    begin transaction
	update tblmailingaddress set city='akure' where addressid =1

	update tblphysicaladdress set city ='akure' where addressid ='tplu'

	commit transaction
	select * from tblmailingaddress
	select * from tblphysicaladdress
	print 'transsaction committed'
  end try
  begin catch
  rollback transaction
  print 'transaction not committed'

  end catch

end
-- used to execute the stored procedures
exec spupdateaddress 






