


sudo -s
mysql -h clusterendpoint -u username -p


# MYSQL
Show databases;
Create database aurora_db;
use aurora_db;
CREATE TABLE students       
  (
     subject_id   INT auto_increment,
     subject_name VARCHAR(255) NOT NULL,
     teacher      VARCHAR(255),
     start_date   DATE,
     lesson       TEXT,
     PRIMARY KEY (subject_id)       
  );

INSERT INTO students(subject_name, teacher) VALUES ('Science', 'Mary Smith');
INSERT INTO students(subject_name, teacher) VALUES ('Science', 'Mary Smith');
INSERT INTO students(subject_name, teacher) VALUES ('Maths', 'Ted Miller');
INSERT INTO students(subject_name, teacher) VALUES ('Arts', 'Suzan Carpenter');

select * from students;

INSERT INTO students(subject_name, teacher) VALUES ('Science', 'Nadir ARFI');
