
-- date format => yyyy-mm-dd ex: 2022-04-12
-- time format => hh:mm:ss ex: 14:30:00

insert into students (id, name, email, gender)
values (4, 'Chynara', 'chynara@gmail.com', 'FEMALE');

insert into students (id, name, email, birth_day, gender)
values (3, '', 'muhammed@gmail.com', '1997-02-02', 'MALE');

select * from students;

create table students (
    id int primary key ,
    name varchar(55) not null ,
    email varchar(55) unique not null ,
    birth_day date,
    gender varchar check ( gender = 'FEMALE' or gender = 'MALE')
);
create table laptop (
    id int primary key,
    brand varchar not null,
    name varchar not null,
    memory int not null,
    cpu varchar not null
);

alter table students add column laptop_id int references laptop(id);

insert into laptop (id, brand, name, memory, cpu)
values (1, 'Macbook', 'Air 2020', 265, 'Apple Silicon'),
       (2, 'Acer', 'Nitro 5', 512, 'Intel'),
       (3, 'HP', 'ProBook', 512, 'AMD Ryzen');

select * from laptops;

alter table laptop rename to laptops;

update students
set laptop_id = 1
where id = 1;

update students
set name = 'Barchynai Iakubova'
where name = 'Barchynai';

select * from students join laptops on students.laptop_id = laptops.id;

alter table laptops add column student_id int references students(id);

update laptops
set student_id = 1
where id = 1;

alter table students
drop column laptop_id;

alter table laptops
drop column student_id;

create table student_laptops (
    student_id int references students(id),
    laptop_id int references laptops(id)
);

insert into student_laptops (student_id, laptop_id)
values (1, 1),
       (1, 2),
       (1, 3);

select s.name, l.brand, l.name from students s
    join student_laptops sl
        on s.id = sl.student_id
join laptops l
 on l.id = sl.laptop_id;