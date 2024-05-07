-- adding student data
insert into students (last_name, first_name, middle_name, sex, schedule)
values('Estopin', 'Maria Aerish Yzabelle', 'Liban', 'F', 'Morning' )


-- show list of students
select last_name, first_name
-- middle_name 
-- sex 
from students s 
-- where schedule = 'Afternoon'
order by last_name;

-- count the number of students
select 
count(*) as total_no_of_students
from students s ;

-- update student data
update students 
set first_name = 'Jhonziel'
where student_id = 35;


-- count number of students depending on payments
select 
count(*)
from payments p 
join students s on s.student_id = p.student_id 
where p.particulars like '%regist%';


-- display payments of particular student
select 
last_name, first_name , sum(p.amount) as amount, p.particulars
from students s 
join payments p on s.student_id = p.student_id
where s.last_name like 'bautis%'
-- where s.first_name  like 'junn%'
group by s.student_id, p.particulars 
;

-- display payment of student (ungroup)
select p.pyt_id, last_name, first_name, p.amount, p.particulars, p.paid_to, p.remitted_to , p.date_remitted, p.date_recorded 
from students s 
join payments p on s.student_id = p.student_id 
where 
last_name like 'bagui%'
-- first_name like 'junn%'
-- p.paid_to = 'Monica'
-- and p.particulars not in ('Laptop', 'ID', 'GPTA')
-- and p.particulars like 'fun run%'
;

-- total amount paid by a student
select 
sum(amount) as total_payment
from payments p 
join students s on s.student_id = p.student_id 
-- where s.last_name like 'cayan%'
where s.first_name like 'junn%'
-- and date_recorded = '2023-11-19'
-- and particulars like 'fun run%'
;


-- list of students with payment for a particular month/purpose
select 
last_name, first_name , sum(p.amount) as amount, p.particulars
from students s 
join payments p on s.student_id = p.student_id
where p.particulars 
-- = 'Apr2024'
-- and p.paid_to = 'Monica'
like '%shirt%'
group by s.student_id, p.particulars 
order by last_name 
;


-- list of students with payment for a particular month/purpose (ungrouped)
select
p.pyt_id,
last_name, first_name , p.amount, p.particulars, p.paid_to, p.remitted_to, p.date_remitted 
from students s 
join payments p on s.student_id = p.student_id
-- where p.date_remitted = '2024-04-25'
-- where p.date_remitted is null
where p.particulars like '%fun run%'
-- and p.remitted_to is not null
and p.paid_to = 'Jhenda'
-- and p.remitted_to is not null 
order by p.date_remitted, last_name 
;


-- list of students with no payment for a particular month/purpose
select 
last_name, first_name
from students s 
where student_id not in (
	select student_id 
	from payments p 
	where particulars = 'Apr2024'
)
order by last_name;


-- students with lacking/insufficient payment for a particular month
select 
s.last_name, s.first_name, sum(p.amount) as amount_paid, p.particulars 
from 
students s ,
payments p 
where 
s.student_id = p.student_id 
and p.particulars = 'May2024'
group by s.student_id  
having amount_paid < 453
order by s.last_name;

-- total collection per particulars
select sum(amount)
from payments p 
where particulars like '%run%';





