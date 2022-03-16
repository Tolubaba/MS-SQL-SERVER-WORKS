select * from toluworks.dbo.triggerw
 -- an example of a cte
with tolucte as (

select name , gender,departmentid from toluworks.dbo.triggerw)

select name,gender from tolucte
order by name
--- a derived table 
declare @tolutable table (name nvarchar(50), salary int)

insert into  @tolutable
-- self join  which was included in the derived table
select a.name as name, a.salary as salary
from
triggerw a
 join triggerw b
 on 
 a.id= b.departmentid

 select * from @tolutable
  where name='todd'

 select * from tolu
works.dbo.triggerw

-- how to cretae and use multiple cte  with help of union

 with tobicte (namesofpeople, genderinclass )
 as(
 select name, gender from triggerw),
 practicecte(namesofpeople,genderinclass)
 as(select name ,gender from triggerw)

 select * from practicecte
 union all
 select * from tobicte
 

 select * from triggerw
 where gender='male' and salary < 5000

 