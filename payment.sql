-- look up student_id
select *
from students s 
where last_name  like 'bautis%'
-- where first_name like 'jhon%'
;


-- insert data to payments table
insert into payments (date_recorded, amount, particulars, student_id, paid_to, paid_thru)
values('2024-05-07', 100, 'Fun Run - Registration (1)', 32, 'Maricel', 'Cash');


-- display latest payments 
select pyt_id, date_recorded , s.last_name, p.amount ,particulars, paid_to, paid_thru, remitted_to, date_remitted 
from payments p 
join students s on s.student_id = p.student_id 
-- where particulars = 'Christmas Party'
-- and paid_to = 'Maricel'
-- and remitted_to is null
order by pyt_id desc;


-- update remittance data 
update payments 
set 
-- remitted_to = 'Liza', 
-- remitted_to = 'Maricel',
remitted_to = 'Ghir Lanz Villero',
date_remitted = '2024-05-07'
where 
-- paid_to = 'Maricel' 
-- paid_to = 'Liza'
-- particulars like '%fun run%'
particulars in ('Additional Laptop')
and remitted_to is null
-- and pyt_id not in (631)
;


-- display list of unremitted collection
select 
last_name, first_name, sum(p.amount) as amount, particulars
from payments p 
join students s on s.student_id = p.student_id 
where remitted_to is null
-- and particulars like '%add.%'
-- and particulars in ('Apr2024', 'May2024')
group by s.student_id, p.particulars 
order by s.last_name ;


-- total unremitted collection by Jhenda
select 
sum(amount) as total_amount
from payments p 
where remitted_to is null
-- and particulars like '%add.%'
-- and particulars in ('Apr2024', 'May2024')	
;


-- display list of particular payments
select 
p.pyt_id , last_name , p.amount , p.particulars, p.paid_to, p.remitted_to , p.date_remitted 
from students s 
join payments p on s.student_id = p.student_id 
where p.remitted_to is null
-- and p.paid_to = 'Jhenda'
-- order by p.pyt_id desc
order by last_name asc
;

-- delete a record based on payment ID
delete from payments 
where pyt_id in (602);


-- list of payments for the day
select last_name , first_name , p.amount,  p.particulars
from students s 
join payments p on s.student_id = p.student_id 
where p.date_recorded = '2024-05-07'
-- and p.paid_to = 'Jhenda'
order by last_name ;


select 
sum(amount) as total_amount
from payments p 
where 
particulars = 'GPTA'
and paid_to = 'Monica';


update payments 
set 
-- paid_to = 'Maricel',
-- remitted_to ='Monica' 
date_remitted = '2024-05-06'
-- paid_thru = 'Cash'
-- amount = 257
-- particulars = 'Fun Run - Shirt: Add. Pyt'
-- where pyt_id = 683
where particulars like '%add.%'
;


-- total collection per particulars
select sum(amount)
from payments p 
where particulars 
= 'Additional Laptop'
-- like '%regi%'
-- and remitted_to is not null
;


-- count students who paid on certain particulars
select count(*) as 'no_of_paid_students'
from students s 
where student_id in (
	select student_id 
	from payments p 
	where p.particulars = 'Laptop'
	);

