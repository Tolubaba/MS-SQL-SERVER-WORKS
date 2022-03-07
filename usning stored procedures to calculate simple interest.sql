alter proc loanstatement
@loanamount money = 100000,
@roi tinyint =14,
@tenureinyrs int =2

 as 
 begin 
 --- declare  a variable for loan date

 declare @loandate datetime 
 set @loandate= getdate()

 -- calculate interest
 --formula =pnr/100

 declare @interest money

 set @interest  =(@loanamount* @tenureinyrs * @roi)/100

 --calculate total amount
 declare @totalamount money
 set @totalamount = @loanamount+@interest

 --calculate @emiamount
 declare @emiamt money
 set @emiamt =@totalamount/(@tenureinyrs*12)

 --display the emi table

 print cast( @totalamount as nvarchar(50))
 print @emiamt

 end

 exec loanstatement



 