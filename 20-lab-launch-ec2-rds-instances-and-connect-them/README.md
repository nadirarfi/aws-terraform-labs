


sudo su
mysql --version
mysql -h my-rds-database-instance.cec0ptliqldk.us-east-1.rds.amazonaws.com -P 3306 -u nadir -p 12345connect



CREATE DATABASE SchoolDB;
show databases;
use SchoolDB;
CREATE TABLE IF NOT EXISTS subjects (subject_id INT AUTO_INCREMENT,subject_name VARCHAR(255) NOT NULL,teacher VARCHAR(255),start_date DATE,lesson TEXT,PRIMARY KEY (subject_id)) ENGINE=INNODB;
 
INSERT INTO subjects(subject_name, teacher) VALUES ('English', 'John Taylor');

INSERT INTO subjects(subject_name, teacher) VALUES ('Science', 'Mary Smith');

INSERT INTO subjects(subject_name, teacher) VALUES ('Maths', 'Ted Miller');

INSERT INTO subjects(subject_name, teacher) VALUES ('Arts', 'Suzan Carpenter');

select * from subjects;

exit;
