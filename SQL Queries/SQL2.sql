use Academy;

create table `Curators`
(
    `Id` int not null AUTO_INCREMENT primary key,
    `Name` varchar(255) not null check (`Name` <> N''),
    `Surname` varchar(255) not null check (`Surname` <> N'')
);


alter table `departments` ADD `FacultyId` int not null;


alter table `faculties` ADD
`Financing` decimal(10,2) not null check (`Financing` >= 0.0) default 0.0;


alter table `groups` ADD `DepartmentId` int not null;


create table `GroupsCurators`
(
    `Id` int not null AUTO_INCREMENT primary key,
    `CuratorId` int not null,
    `GroupId` int not null
);


create table `GroupsLectures`
(
    `Id` int not null AUTO_INCREMENT primary key,
    `GroupId` int not null,
    `LectureId` int not null
);


create table `Lectures`
(
    `Id` int not null AUTO_INCREMENT primary key,
    `LectureRoom` varchar(255) not null check (`LectureRoom` <> N''),
    `SubjectId` int not null,
    `TeacherId` int not null
);


create table `Subjects`
(
    `Id` int not null AUTO_INCREMENT primary key,
    `Name` varchar(100) not null unique check (`Name` <> N'')
);


alter table `Departments`
    add foreign key (`FacultyId`) references `Faculties`(`id_Faculties`);


alter table `Groups`
    add foreign key (`DepartmentId`) references `Departments`(`id_Departments`);


alter table `GroupsCurators`
    add foreign key (`CuratorId`) references `Curators`(`Id`);


alter table `GroupsCurators`
    add foreign key (`GroupId`) references `Groups`(`id_Groups`);


alter table `GroupsLectures`
    add foreign key (`GroupId`) references `Groups`(`id_Groups`);


alter table `GroupsLectures`
    add foreign key (`LectureId`) references `Lectures`(`Id`);


alter table `Lectures`
    add foreign key (`SubjectId`) references `Subjects`(`Id`);


alter table `Lectures`
    add foreign key (`TeacherId`) references `Teachers`(`id_Teachers`);

#6. Вывести названия кафедр и названия групп, которые к ним относятся.

SELECT departments.name, `groups`.name FROM departments, `groups`
WHERE departments.id_Departments = `groups`.DepartmentId;

#7. Вывести названия дисциплин, которые читает преподаватель “Петр Петров”.

SELECT subjects.name, `teachers`.name, teachers.surname FROM subjects
INNER JOIN lectures ON Lectures.SubjectId = Subjects.Id
INNER JOIN teachers ON teachers.id_Teachers = Lectures.TeacherId
AND teachers.name = 'Петр' AND  teachers.surname = 'Петров';

#9. Вывести названия групп, которые относятся к факультету “Computer Science”.

SELECT `groups`.name, `faculties`.name FROM `groups`
INNER JOIN departments on `groups`.DepartmentId = departments.id_Departments
INNER JOIN faculties on departments.FacultyId = faculties.id_Faculties
AND `faculties`.name = 'Computer Science' ;


