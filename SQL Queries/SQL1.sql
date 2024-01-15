USE academy;


Alter table `faculties` ADD `Dean`
    varchar(255) not null check (`Dean` <> '') AFTER `id_Faculties`;

Alter table `teachers`
    ADD `isAssistant` bit not null default 0,
    ADD `isProfessor` bit not null default 0,
    ADD `position` varchar(255) not null check (`position` <> '');

#1. Вывести таблицу кафедр, но расположить ее поля в обратном порядке.

SELECT `name`, `financing`, `id_Departments`  FROM `departments`;

#6. Вывести названия кафедр, фонд финансирования которых меньше 1100 или больше 2000.

SELECT * FROM `departments` WHERE `financing` < 1100 or `financing` > 2000;

#7. Вывести названия факультетов кроме факультета “Computer Science”.

SELECT `name`  FROM `faculties` WHERE `name` <> 'Computer Science' ;

#8.Вывести фамилии и должности преподавателей, которые не являются профессорами.

SELECT `name`, `position` FROM `teachers` WHERE `isProfessor` = 0  ;

#9. Вывести фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне от 160 до 550.

SELECT `surname`, `position`, `salary`, `premium` FROM `teachers` WHERE `isAssistant`= 1 AND `premium` BETWEEN 160 AND 550 ;

#10. Вывести фамилии и ставки ассистентов.

SELECT `surname`, `salary` FROM `teachers` WHERE `isAssistant`= 1;

#11. Вывести фамилии и должности преподавателей, которые были приняты на работу до 10.03.2014.

SELECT `surname`, `position` FROM `teachers` WHERE `employmentDate`< '2014-03-10';

#13. Вывести фамилии ассистентов, имеющих зарплату (суммаставки и надбавки) не более 9000.

SELECT `surname` FROM `teachers` WHERE `isAssistant`= 1 AND (`salary`+`premium`) <= 9000;

#14. Вывести названия групп 5-го курса, имеющих рейтингв диапазоне от 2 до 4.

SELECT `name` FROM `groups` WHERE `year`= 5 AND `rating` BETWEEN 2 and 4;

#15. Вывести фамилии ассистентов со ставкой меньше 7000 или надбавкой меньше 400.

SELECT `surname` FROM `teachers` WHERE `isAssistant`= 1 AND (`salary`< 7000 OR `premium`< 400);


