delete from mctc_it.department where iddepartment > 0;
insert into mctc_it.department (name) values
('ITEC'),
('ENGL');

delete from mctc_it.courses where idcourses>0;
INSERT INTO `mctc_it`.`courses` 
(`code`, `section`, `name`, `maxStudents`, `faculty_idFaculty`, 
`faculty_DepartmentId`, `sessionDays`,`startTime`,`endTime`) 
VALUES 
(0001, 01, 'Course1', 25, 1, 1,'T,Th','1:00','2:00'),
(1351, 01, 'Course2', 25, 2, 1,'W','2:00','3:00'),
(1981, 01, 'Course3', 25, 3, 2,'F','3:00','4:00'),
(0112358, 01, 'Fibonacci',13,1,1,'Sa','4:00','5:00');

delete from mctc_it.advisor where idadvisor>0;
insert into mctc_it.advisor 
(FirstName,LastName) values 
('Rosa','Shannon'), 
('Margot','Howard');

delete from mctc_it.major where idmajor>0;
insert into mctc_it.major 
(name) values 
('Software Development'),
('Web Development'),
('Computer and Network Support');

delete from mctc_it.students where idStudents>0;
insert into mctc_it.students 
(FirstName,LastName,`major_idmajor`, `advisor_idadvisor`) values 
('First1','Student',1,1),
('First2','Student',1,1),
('First3','Student',1,2),
('First4','Student',1,2),
('First5','Student',2,1),
('First6','Student',2,2),
('First7','Student',2,1);

delete from mctc_it.faculty where idFaculty>0;
insert into mctc_it.faculty 
(FirstName,LastName, DepartmentId) values 
('First1','Faculty',1),
('First2','Faculty',1),
('First3','Faculty',1),
('First4','Faculty',1),
('First5','Faculty',2),
('First6','Faculty',2),
('First7','Faculty',2);

