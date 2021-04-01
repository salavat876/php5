create table userss (
    id serial primary key,
    name varchar(255),
    last_name varchar(255),
    email varchar(255),
    work_id int

);

create table works(
    id serial primary key,
    name varchar(255),
    status bool
);

create table timings(
    id serial primary key ,
    code varchar(255),
    track int,
    work_id int
);

insert into userss (name, last_name,email,work_id) values ('salavat','mavl','example@mail.com',1);
insert into works (name, status) values ('плотник',true);
insert into timings(code,track,work_id) values ('fff',1,1);

select * from timings;
select * from userss;
select * from works;