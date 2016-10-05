CREATE TABLE toy (
	name varchar PRIMARY KEY
);

CREATE TABLE toy_owner (
	name varchar PRIMARY KEY
);

ALTER TABLE toy ADD price money;

insert into toy values (
	'Lego Mellenium Falcon', 50.00, True
);

insert into toy values (
	'Radio Control Car', 24.99, True
);

ALTER TABLE toy_owner ADD toy varchar;

insert into toy_owner values (
	'Matt', 'Mellinium Falcon'
);

CREATE TABLE restaurant (
	id serial PRIMARY KEY,
	name varchar,
	address varchar,
	category varchar
);

CREATE TABLE reviewer (
	id serial PRIMARY KEY,
	name varchar,
	email varchar,
	karma int DEFAULT 0 CHECK (karma >= 0 AND karma <= 7)
);

CREATE TABLE review (
	id serial PRIMARY KEY,
	reviewer_id int REFERENCES reviewer (id),
	stars int CHECK (stars >= 1 AND stars <= 5),
	title varchar,
	review varchar,
	restaurant_id int REFERENCES restaurant (id)
);

insert into restaurant values
	(default, 'McDonalds', '1234 Main St.', 'Fast Food');
insert into restaurant values
	(default, 'Burger King', '9876 Main St.', 'Fast Food');
insert into restaurant values
	(default, 'Enman', '1234 Apple Ave.', 'Izakaya');
insert into restaurant values
	(default, 'Shoyuu', '4567 Post Ln.', 'Izakaya');
insert into restaurant values
	(default, 'Piere', '23 Broadway', 'Fancy');
insert into restaurant values
	(default, 'Amelie', '89 Posh Way', 'Fancy');

insert into reviewer values
	(default, 'Matt', 'mwdowns@gmail.com', 7);
insert into reviewer values
	(default, 'Jesslynn', 'jlynn@gmail.com', 5);
insert into reviewer values
	(default, 'Jeri', 'jeri@gmail.com', 6);
insert into reviewer values
	(default, 'Donald', 'orange@gmail.com', 2);

insert into review values
	(default, 1, 2, 'great', 'fantastic', 1);
insert into review values
	(default, 1, 2, 'great', 'fantastic', 2);
insert into review values
	(default, 1, 2, 'great', 'fantastic', 3);
insert into review values
	(default, 1, 2, 'great', 'fantastic', 4);
insert into review values
	(default, 1, 2, 'great', 'fantastic', 5);
insert into review values
	(default, 1, 2, 'great', 'fantastic', 6);

insert into review values
	(default, 2, 2, 'great', 'fantastic', 1);
insert into review values
	(default, 2, 2, 'great', 'fantastic', 2);
insert into review values
	(default, 2, 2, 'great', 'fantastic', 3);
insert into review values
	(default, 2, 2, 'great', 'fantastic', 4);
insert into review values
	(default, 2, 2, 'great', 'fantastic', 5);
insert into review values
	(default, 2, 2, 'great', 'fantastic', 6);

insert into review values
	(default, 3, 2, 'great', 'fantastic', 1);
insert into review values
	(default, 3, 2, 'great', 'fantastic', 2);
insert into review values
	(default, 3, 2, 'great', 'fantastic', 3);
insert into review values
	(default, 3, 2, 'great', 'fantastic', 4);
insert into review values
	(default, 3, 2, 'great', 'fantastic', 5);
insert into review values
	(default, 3, 2, 'great', 'fantastic', 6);

insert into review values
	(default, 4, 3, 'great', 'fantastic', 1);
insert into review values
	(default, 4, 4, 'great', 'fantastic', 2);
insert into review values
	(default, 4, 5, 'great', 'fantastic', 3);
insert into review values
	(default, 4, 3, 'great', 'fantastic', 4);
insert into review values
	(default, 4, 1, 'great', 'fantastic', 5);
insert into review values
	(default, 4, 5, 'great', 'fantastic', 6);
--1
select review from review where restaurant_id = 1;
--2
select review from review where reviewer_id = 1;
--3
select review, name from review inner join restaurant on restaurant_id = restaurant.id;
--4
select avg(stars), name from review inner join restaurant on restaurant_id = restaurant.id group by restaurant.name;
--5
select count(review), name from review inner join restaurant on restaurant_id = restaurant.id group by restaurant.name;
--6
select review, restaurant.name, reviewer.name from review, restaurant, reviewer where reviewer_id = reviewer.id and restaurant_id = restaurant.id;
--7
select avg(stars), reviewer.name from review, reviewer where reviewer_id = reviewer.id group by reviewer.name;
--8
select min(stars), reviewer.name from review, reviewer where reviewer_id = reviewer.id group by reviewer.name;
--9
select count(category), category from restaurant group by restaurant.category;
--10
select count(stars), name from review, restaurant where restaurant_id = restaurant.id and stars = 5 group by restaurant.name;
--11
select avg(stars), restaurant.category from review, restaurant where restaurant_id = restaurant.id group by restaurant.category;

--Projects DB Exercises

--1
select * from project, tech;
--2
select * from tech left outer join project_uses_tech on tech_id = tech.id;
--3
select * from project left outer join project_uses_tech on project_id = project.id;
--4
select
  *
from
  project
left outer join project_uses_tech
  on project_id = project.id
left outer join tech
  on tech_id = tech.id;
--5
select
  count(tech), project.name
from
  project
left outer join project_uses_tech
  on project_id = project.id
left outer join tech
  on tech_id = tech.id
group by project.name;
--6
select
  count(project), tech.name
from
  project
left outer join project_uses_tech
  on project_id = project.id
left outer join tech
  on tech_id = tech.id
group by project.name;
--7
select
  count(tech), project.name
from
  project
left outer join project_uses_tech
  on project_id = project.id
left outer join tech
  on tech_id = tech.id
group by project.name
order by project.name desc;
--8
select
  count(project), tech.name
from
  project
left outer join project_uses_tech
  on project_id = project.id
left outer join tech
  on tech_id = tech.id
group by tech.name
order by project.name desc;
--9
select
  count(tech), project.name
  	into
  		tech_count
from project
left outer join project_uses_tech
  on project_id = project.id
left outer join tech
  on tech_id = tech.id
group by project.name;

select
	avg(count), tech_count.name
from tech_count
group by tech_count.name;
