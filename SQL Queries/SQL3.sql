USE Academy;


#10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.

SELECT `groups`.name, faculties.name, `groups`.year FROM `groups`
INNER JOIN departments on `groups`.DepartmentId = departments.id_Departments
INNER JOIN faculties on departments.FacultyId = faculties.id_Faculties
AND `groups`.year = '5';

#11. Вывести полные имена преподавателей и лекции, которые они читают (названия дисциплин
# и групп), причем отобрать
#только те лекции, которые читаются в аудитории “400”.

SELECT `teachers`.name, teachers.surname, subjects.name, `groups`.name, lectures.LectureRoom FROM teachers
INNER JOIN lectures  on teachers.id_Teachers = Lectures.TeacherId
INNER JOIN subjects on Lectures.SubjectId = subjects.Id
INNER JOIN groupslectures on GroupsLectures.LectureId=Lectures.Id
INNER JOIN `groups` on `groups`.id_Groups= GroupsLectures.GroupId
AND Lectures.LectureRoom = '400';