create database learnacademy;
use learnacademy;

create table klass(
klassid int primary key,
klassname varchar(10)
);

select * from klass_subject;
select * from klass_teacher;
select * from sub;
select * from teacher;

create table sub(
subid int primary key,
subname varchar(20)
);

create table teacher(
teacherid int primary key,
teachername varchar(30)
);

create table student(
studentid int primary key,
studentname varchar(40),
klassids int , foreign key (klassids) references klass(klassid)
);

create table klass_subject(
klass_subjectid int primary key,
subjectid int , foreign key (subjectid) references sub(subid),
klassids int , foreign key (klassids) references klass(klassid)
);

create table klass_teacher(
klass_teacherid int primary key,
teacherid int , foreign key (teacherid) references teacher(teacherid),
klassids int , foreign key (klassids) references klass(klassid),
subjectid int , foreign key (subjectid) references sub(subid)
);


	

SELECT student.studentname, klass.klassname, sub.subname, teacher.teachername
FROM student
JOIN klass ON student.klassids = klass.klassid
JOIN klass_subject ON klass.klassid = klass_subject.klassids
JOIN sub ON klass_subject.subjectid = sub.subid
JOIN klass_teacher ON klass_subject.subjectid = klass_teacher.subjectid
JOIN teacher ON klass_teacher.teacherid = teacher.teacherid;

SELECT klass.klassname , sub.subname, teacher.teachername, student.studentname
FROM klass 
JOIN klass_subject ON klass.klassid = klass_subject.klassids
JOIN sub ON klass_subject.subjectid = sub.subid
JOIN klass_teacher ON klass.klassid = klass_teacher.klassids AND klass_subject.subjectid = klass_teacher.subjectid
JOIN teacher ON klass_teacher.teacherid = teacher.teacherid
JOIN student ON klass.klassid = student.klassids
ORDER BY klass.klassname 
;

