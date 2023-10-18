CREATE DATABASE cars;

CREATE TABLE cars.products
(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(20) NOT NULL,
    age INT NOT NULL DEFAULT 10
);

INSERT INTO cars.products
VALUES
(1, 'Mercedes Benz', 15),
(2, 'Lexus', DEFAULT),
(3, 'BMW', 8),
(4, 'Mazda', DEFAULT),
(5, 'Nissan', 10);

-- Create products_2 table with same column names and data types
-- insert 5 rows
-- Union products and products_2 tables

CREATE TABLE cars.products_2
(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(20) NOT NULL,
    age INT NOT NULL DEFAULT 10
);

CREATE DATABASE test;

CREATE TABLE test.test
(
	test_id INT
);

DROP TABLE test.test;

DROP DATABASE test;



-- Database name {name}_{surname}_learning
-- Table name {name}_{surname}_courses

DROP TABLE cars.models;

CREATE TABLE cars.models
(
	model_id INT NOT NULL,
    model_name VARCHAR(25) NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY(model_id),
    FOREIGN KEY(product_id) REFERENCES cars.products(product_id),
    CHECK (CHAR_LENGTH(model_name) <= 15),
    CHECK (model_id * 5 <= 50)
);

SELECT * FROM cars.products;

INSERT INTO cars.models
VALUES
(1, 'C300', 1),
(2, 'S550', 1),
(3, 'GX 470', 2),
(4, 'LX 570', 2),
(5, 'E90', 3),
(6, 'E60', 3),
(7, 'Mazda 6', 4),
(8, 'Mazda 3', 4),
(9, 'March', 5),
(10, 'Qashqai', 5);


SELECT * FROM cars.models AS M;


DELETE FROM cars.models AS M
WHERE M.model_id = 10;


-- violating DataType VARCHAR(25)
INSERT INTO cars.models
VALUES
(10, 'abdkhsadbksabvlkabsdlhkshfvblsakh', 5);

-- violating CHECK constraint
INSERT INTO cars.models
VALUES
(10, 'abdkhsadbksabvlkab', 5);

INSERT INTO cars.models
VALUES
(10, 'Qashqai', 5);

-- Auto increment

CREATE TABLE cars.owners
(
	owner_id INT NOT NULL AUTO_INCREMENT,
    owner_first_name VARCHAR(15),
    owner_last_name VARCHAR(15),
    PRIMARY KEY(owner_id)
);


INSERT INTO cars.owners (owner_first_name, owner_last_name)
VALUES
('John', 'Washington'),
('Kate', 'Laurrane');

SELECT * FROM cars.owners;


UPDATE cars.models AS M
SET M.model_name = 'Teana'
WHERE M.model_id = 10;

SELECT * FROM cars.models;

create Database Tigran_Babayan_learning;

create Table Tigran_Babayan_learning.courses
(
	course_id int primary key,
	course_name varchar(15) not null,
	course_difficulty varchar(15) default "medium"
);

Insert into Tigran_Babayan_learning.courses
values
(1,'HTML', 'easy'),
(2,'Python', DEFAULT),
(3,'java', 'medium'),
(4,'kotlin', 'hard'),
(5,'CSS','Easy');

create Table Tigran_Babayan_learning.lessons
(
	lesson_id int primary key auto_increment,
	lesson_name varchar(15) not null,
	course_id int NOT NULL,
	foreign key(course_id) references  Tigran_Babayan_learning.courses(course_id),
	check(char_length(lesson_name) <= 10)
);

Insert into Tigran_Babayan_learning.lessons(lesson_name,course_id)
values
('HTML1', 1),
('HTML2', 1),
('PYTHON1', 2),
('PYTHON2', 2),
('JAVA1', 3),
('JAVA2', 3),
('Kotlin1', 4),
('kotlin2', 4),
('CSS1',5),
('CSS2',5);



DELETE FROM Tigran_Babayan_learning.lessons
WHERE lesson_id >= 11;

INSERT INTO Tigran_Babayan_learning.lessons
VALUES
(11, 'HTML1aada', 5),
(12, 'HTML2', 3);