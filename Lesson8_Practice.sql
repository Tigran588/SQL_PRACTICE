create Database Tigran_Babayan_sololearn;
-- drop Table Tigran_Babayan_sololearn.courses;
create Table  Tigran_Babayan_sololearn.courses(
	course_id Int primary key,
    course_name varchar(20) Not null
);

Insert Into  Tigran_Babayan_sololearn.courses
Value
(1,'Python'),
(2,'C#'),
(3,'C++');
select * from Tigran_Babayan_sololearn.courses;

create Table Tigran_Babayan_sololearn.platforms(
	platform_id Int primary Key,
    platform_name varchar(20) not null
    );
    
Insert Into Tigran_Babayan_sololearn.platforms
Values 
(1,'Ios'),
(2,"Android"),
(3,'web');
select * from Tigran_Babayan_sololearn.platforms;

create Table Tigran_Babayan_sololearn.users(
	USER_ID int primary key,
    user_name varchar(20) Not null);
    
Insert Into Tigran_Babayan_sololearn.users
Value
(1,'John'),
(2,'Cecile'),
(3,'Kate'),
(4,'Jean'),
(5,'Mark'),
(6,'kevin'),
(7,'hellen');
select * from Tigran_Babayan_sololearn.users;

create Table Tigran_Babayan_sololearn.quiz_result_type(
	result_id int Primary Key,
    result_name varchar(20) Not Null
) ;

Insert Into Tigran_Babayan_sololearn.quiz_result_type
Value
(1,'pass'),
(2,'fail');

select * from Tigran_Babayan_sololearn.quiz_result_type;

Create table Tigran_Babayan_sololearn.modules(
	module_id Int primary key auto_increment,
    module_name varchar(20) Not Null,
    course_id int,
	foreign key(course_id) references Tigran_Babayan_sololearn.courses(course_id)
    );
    
Insert Into Tigran_Babayan_sololearn.modules(module_name,course_id)
Values
('py Module 1',1),
('py Module 2',2),
('C# Module 1',2),
('C# Module 2',2),
('C++ Module 1',3),
('C++ Module 2',3);

select * from tigran_babayan_sololearn.modules;

create table tigran_babayan_sololearn.lessons(
	lesson_id Int primary key auto_increment,
    lesson_name varchar(20) not null Default 'Py lesson1',
    module_id Int,
    foreign key (module_id) references tigran_babayan_sololearn.modules(module_id));
    
Insert Into tigran_babayan_sololearn.lessons(lesson_name,module_id)
values
('Py lesson 1',1),
('Py lesson 2',1),
('Py lesson 3',2),
('Py lesson 4',2),
('C# Lesson 1',3),
('C# Lesson 2',3),
('C# Lesson 3',4),
('C# Lesson 4',4),
('C++ Lesson 1',5),
('C++ Lesson 2',5),
('C++ Lesson 3',6),
('C++ Lesson 4',6);
select * from tigran_babayan_sololearn.lessons;

create Table tigran_babayan_sololearn.quizzes (
	quiz_id int primary key auto_increment,
    quiz_name varchar(15),
    lesson_id int,
    foreign key(lesson_id) references tigran_babayan_sololearn.lessons(lesson_id),
    check (lesson_id <= 100) 
    );
    
Insert into tigran_babayan_sololearn.quizzes(quiz_name,lesson_id)
Values
('Py Lesson 1',1),
('Py Lesson 2',1),
('Py Lesson 3',2),
('Py Lesson 4',2),
('C# Lesson 1',3),
('C# Lesson 2',3),
('C# Lesson 3',4),
('C# Lesson 4',4),
('C++ Lesson 1',5),
('C++ Lesson 2',5),
('C++ Lesson 3',6),
('C++ Lesson 4',6);

select * from tigran_babayan_sololearn.quizzes;
-- Drop Table tigran_babayan_sololearn.quiz_logs;
Create Table tigran_babayan_sololearn.quiz_logs(
	user_id int,
    platform_id Int,
    quiz_id Int,
    event_name Int,
    foreign key (user_id) references   tigran_babayan_sololearn.users(user_id),
    foreign key (platform_id) references tigran_babayan_sololearn.platforms(platform_id),
    foreign key (quiz_id) references tigran_babayan_sololearn.quizzes(quiz_id),
    foreign key (event_name) references tigran_babayan_sololearn.quiz_result_type(result_id)
	);
    
Insert Into tigran_babayan_sololearn.quiz_logs
values
(2,3,9,2),
(2,1,9,2),
(6,3,1,2),
(2,2,5,1),
(2,3,9,2),
(7,1,7,1),
(6,1,8,1),
(7,3,11,2),
(7,3,5,2),
(4,2,5,1),
(7,1,12,1);

select * from tigran_babayan_sololearn.quiz_logs