/* Here are the requirements for our example database:

The International Language School is a language training school.
It offers language classes for corporate clients, which can be conducted at the School or at the offices of the client as they prefer. 
The School employs teachers, each of whom may teach multiple courses.
The School has clients, each of whom may offer multiple courses via the school. 
Clients offer courses to their employees, who have the option to participate.
Each course is offered by one client. 
Each course has one teacher at any given time.
Participants in the courses are employees of the client companies, i.e. they work for the client companies. 
Each participant can be employed by one company at a time. 
Participants may be enrolled in more than one course.
see: https://towardsdatascience.com/designing-a-relational-database-and-creating-an-entity-relationship-diagram-89c1c19320b2
*/ 




#############################
#      CREATE THE DB        #
#############################
# doomsday!

DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

#############################
#      CREATE THE TABLES    #
#############################
-- STEP 1 teacher

CREATE TABLE teacher (
teacher_id INT PRIMARY KEY,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
language_1 VARCHAR(3) NOT NULL,
language_2 VARCHAR(3), 
dob DATE,
tax_id INT UNIQUE,
phone_no VARCHAR(20)
);


-- STEP 2: create the tables client, participants, course

CREATE TABLE client(
client_id INT PRIMARY KEY,
client_name VARCHAR(40) NOT NULL,
address VARCHAR(40) NOT NULL,
industry VARCHAR(40)
);

CREATE TABLE participant (
  participant_id INT PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  phone_no VARCHAR(20),
  client INT
);


CREATE TABLE IF NOT EXISTS course(
course_id INT PRIMARY KEY,
course_name VARCHAR(40) NOT NULL,
language VARCHAR (3) NOT NULL,
level VARCHAR(2),
course_lemgth_weeks INT,
start_date DATE,
in_school BOOLEAN,
teacher INT,
client INT
);

###################################
#      CREATE THE RELATIONHIPS    #
###################################

ALTER TABLE participant
ADD FOREIGN KEY(client)
REFERENCES client(client_id)
ON DELETE SET NULL; 

ALTER TABLE course
ADD FOREIGN KEY(teacher)
REFERENCES teacher(teacher_id)
ON DELETE CASCADE;

ALTER TABLE course
ADD FOREIGN KEY(client)
REFERENCES client(client_id)
ON DELETE SET NULL;

CREATE TABLE takes_course(
participant_id INT,
course_id INT,
PRIMARY KEY(participant_id, course_id),
FOREIGN KEY(participant_id)REFERENCES participant(participant_id) ON DELETE CASCADE,
FOREIGN KEY(course_id) REFERENCES course(course_id) ON DELETE CASCADE
);


###################################
#      POPULATE THE DATABASE      #
###################################


-- Partial inserts
INSERT INTO teacher VALUES
(1, 'James', 'Smith', 'ENG', NULL, '1985-04-20', 12345, '+491774553676');

-- Delete records


-- Update records


-- Massive population!




###################################
#           PLAY AROUND           #
###################################

