
create database june28;

use june28; 

CREATE TABLE addrbook (
     id INT NOT NULL AUTO_INCREMENT,
     fname CHAR(30) NOT NULL,
	 lname CHAR(30) NOT NULL,
	 address VARCHAR(128) NOT NULL,
	 city 	VARCHAR(32) NOT NULL,
	state 	VARCHAR(32) NOT NULL,
	zip 	VARCHAR(8) NOT NULL,
	phone	VARCHAR(10) NOT NULL,
	pic	VARCHAR(10),
     PRIMARY KEY (id)
);

create table task (
     id INT NOT NULL AUTO_INCREMENT,
	title varchar(64),
	description varchar(128),
	done boolean DEFAULT 0,
     PRIMARY KEY (id)

);
