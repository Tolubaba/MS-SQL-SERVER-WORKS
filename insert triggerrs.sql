 -- trigger for insert 
 
 select * from triggerw
  create table tbkaudit(
  id int identity(1,1),
  auditdata nvarchar(100)
  )

 
   create trigger tr_empforinsert
   on triggerw
   for insert
   as
   begin
   declare @id int
   select @id =id  from inserted 

   insert into tbkaudit values('new employee with id = ' +cast(@id as nvarchar(5))
+ ' is added ' + cast(getdate() as nvarchar(20)))
   
   end

   select * from tbkaudit

   sp_helptext tr_empforinsert

   insert into triggerw values(10,'tolu',6000,'male',7)

   select * from tbkaudit


   create trigger tr_practice
   on triggerw
   for insert
   as 
   begin
   declare @gender nvarchar(50)
   select @gender =gender from inserted
  
  insert into dbo.works values('the gender of the person is =' +@gender,1)

   end

   insert into triggerw values(11,'kemi',7000,'female',4)
   
   
alter table works
add  id int
    
	select * from dbo.works

	select * from triggerw

	select *   from dbo.works
	select * from triggerw