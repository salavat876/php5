create database student_courses;

create table students (
    id serial primary key ,
    firstName character varying(30)
        not null ,
    lastName character varying(30)
        not null ,
    age integer,
    date_receipt date
        not null
);

alter table students add sex varchar(6);

insert into students(firstName, lastName, age, date_receipt)
VALUES
('Игорь','Дроздов',16,'2021-05-09'),
('Ольга','Краснова',15,'2021-04-12'),
('Мария','Снежнова',21,'2021-05-13'),
('Ульян','Ургант',22,'2021-06-21'),
('Вадим','Михайлов',16,'2020-12-22'),
('Вероника','Дроздова',18,'2021-11-11'),
('Лилия','Ульянова',19,'2021-10-05'),
('Максим','Иванов',29,'2021-12-11'),
('Игорь','Дроздов',17,'2021-12-11'),
('Ольга','Краснова',35,'2021-05-16'),
('Мария','Снежнова',20,'2020-07-25'),
('Ульян','Ургант',24,'2020-04-09');

update students set firstName = 'Виктор' where id = 4;


create table courses (
    id serial primary key ,
    course_name character varying(100)
        not null,
    how_long integer
        not null
);

insert into courses (course_name, how_long)
values ('Программирование на Python',7),
('Программирование на JavaScript',8),
('Подготовка к ОГЭ',9),
('Подготовка к ЕГЭ',12);

create table student_course(
    student_id  integer references students(id)
        on update cascade
        on delete cascade,
    course_id integer references courses(id)
        on update cascade
        on delete cascade
);

insert into students_course (student_id, course_id)
VALUES (1,1),(1,2),
(2,3),(2,2),
(3,4),(3,1),
(4,1),(4,2),
(5,3),
(6,3),
(7,2),(7,3),
(8,1),(8,2),
(9,4),
(10,2),
(11,1),(11,2),
(12,2);

select firstName,lastName,age from students where age >16;

select firstName,lastName from students where id in(
    select student_id from student_course where course_id in
        ( select id from courses where course_name = 'Программирование на JavaScript' )
);

select firstName,lastName from students where id in(
    select student_id from student_course where course_id in
        ( select id from courses where course_name = 'Программирование на Python')
);

select firstName,lastName from students where id in(
    select student_id from student_course where course_id in
        ( select id from courses where course_name = 'Подготовка к ОГЭ')
);

select firstName,lastName from students where id in(
    select student_id from student_course where course_id in
        ( select id from courses where course_name = 'Подготовка к ЕГЭ')
);

select firstName,lastName,date_receipt from students where date_receipt > '2020-11-12';

select count(*)  from students where students.sex = 'male';

select firstName,lastName from students order by firstName,lastName;

select firstName,lastName from students where id in (
    select student_id from student_course where course_id in
        ( select id from courses where( course_name = 'Программирование на Python' and course_name = 'Подготовка к ОГЭ'))
);
drop table student_course;
create table students_course(
                               student_id  integer references students(id)
                                   on update cascade
                                   on delete cascade,
                               course_id integer references courses(id)
                                   on update cascade
                                   on delete cascade
);


create table lecturer (
    lecturer_id serial primary key ,
    first_name varchar(30),
    last_name varchar(30)
);

insert into lecturer (first_name, last_name) VALUES ('Вадим', 'Геннадьевич'),
                                                    ('Валентина','Иванова'),
                                                    ('Антон','Пануфник'),
                                                    ('Светлана','Сергеевна');



create table course_lecturer (
    lecturer_id integer references lecturer(lecturer_id)
                             on update cascade
                             on delete cascade,
    course_id integer references courses(id)
);


insert into course_lecturer values (1,1),
                                   (2,4),
                                   (3,2),
                                   (4,3),
                                   (1,2);


select first_name,last_name from lecturer where lecturer_id in (
    select lecturer_id from course_lecturer where course_id in(
        select id from courses where course_name = 'Программирование на JavaScript'
        )
    );



