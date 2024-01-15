USE academy;

ALTER table `groupsLectures`
    ADD `DayOfWeek` int not null;
alter table groupslectures
    add constraint check_1
        check (`DayOfWeek` between 1 and 7);

#1. Вывести количество преподавателей кафедры “Software Development”.

SELECT departments.Name, count(*) AS 'количество преподавателей'
FROM departments
INNER JOIN `groups` on departments.id_Departments = `groups`.DepartmentId
INNER JOIN groupslectures on `groups`.id_Groups = groupslectures.GroupId
INNER JOIN lectures on groupslectures.LectureId = lectures.Id
INNER JOIN teachers on lectures.TeacherId = teachers.id_Teachers
WHERE departments.name = 'Software Development';

#2. Вывести количество лекций, которые читает преподаватель “Dave McQueen”.
SELECT teachers.name, teachers.surname, count(*) AS 'количество лекций'
FROM teachers
INNER JOIN lectures l on teachers.id_Teachers = l.TeacherId
WHERE teachers.name = 'Dave' AND teachers.surname = 'McQueen';

#3. Вывести количество занятий, проводимых в аудитории “D201”.

SELECT lectures.LectureRoom, count(*) AS 'количество занятий'
FROM lectures
         INNER JOIN subjects s on lectures.SubjectId = s.Id
WHERE LectureRoom = 'D201';

