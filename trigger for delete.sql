create trigger tr_empfordelete
   on triggerw
   for delete
   as
   begin
   declare @id int
   select @id =id  from  deleted

   insert into tbkaudit values('new employee with id = ' +cast(@id as nvarchar(5))
+ ' is deleted ' + cast(getdate() as nvarchar(20)))
   
   end

   delete from triggerw where id= 10

   select * from triggerw
   select * from tbkaudit
