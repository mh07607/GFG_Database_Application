insert into [Volunteer] ([Name])
	values ('Ali'),
	('Mustafa')

update Volunteer 
	set CNIC = 4240195624111
where volunteer_id = 1

select * from Volunteer
	
insert into Employee ([Name], UserID, [Password])
values ('Mehmood', 'mehm16', 'password')

select * from Employee

insert into Project ([Project Name], [Project Lead], [Start Date])
values ('First Project', (select employee_id from Employee where employee_id = 0), GETDATE())

select * from Project

delete Project
	where project_id = 2;