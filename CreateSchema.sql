-- MySQL Script generated by MySQL Workbench
-- Tue Nov  7 13:36:36 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mctc_it
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS mctc_it ;

-- -----------------------------------------------------
-- Schema mctc_it
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mctc_it DEFAULT CHARACTER SET utf8 ;
USE mctc_it ;

-- -----------------------------------------------------
-- Table `advisor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `advisor` ;

CREATE TABLE IF NOT EXISTS `advisor` (
  `idadvisor` INT(11) NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idadvisor`),
  UNIQUE INDEX `idadvisor_UNIQUE` (`idadvisor` ASC),
  UNIQUE INDEX `FirstName_UNIQUE` (`FirstName` ASC),
  UNIQUE INDEX `LastName_UNIQUE` (`LastName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
insert into mctc_it.advisor 
(FirstName,LastName) values 
('Rosa','Shannon'), 
('Margot','Howard');

-- -----------------------------------------------------
-- Table `department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `department` ;

CREATE TABLE IF NOT EXISTS `department` (
  `iddepartment` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddepartment`, `name`),
  UNIQUE INDEX `iddepartment_UNIQUE` (`iddepartment` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
insert into mctc_it.department (name) values
('ITEC'),
('ENGL');


-- -----------------------------------------------------
-- Table `faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faculty` ;

CREATE TABLE IF NOT EXISTS `faculty` (
  `idFaculty` INT(11) NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `DepartmentId` INT(11) NOT NULL,
  PRIMARY KEY (`idFaculty`),
  UNIQUE INDEX `idFaculty_UNIQUE` (`idFaculty` ASC),
  INDEX `DepartmentId_idx` (`DepartmentId` ASC),
  CONSTRAINT `DepartmentId`
    FOREIGN KEY (`DepartmentId`)
    REFERENCES `department` (`iddepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
insert into mctc_it.faculty 
(FirstName,LastName, DepartmentId) values 
('First1','Faculty',1),
('First2','Faculty',1),
('First3','Faculty',1),
('First4','Faculty',1),
('First5','Faculty',2),
('First6','Faculty',2),
('First7','Faculty',2);

-- -----------------------------------------------------
-- Table `courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `courses` ;

CREATE TABLE IF NOT EXISTS `courses` (
  `idcourses` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `section` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `maxStudents` INT(11) NULL DEFAULT NULL,
  `faculty_idFaculty` INT(11) NOT NULL,
  `faculty_DepartmentId` INT(11) NOT NULL,
  `sessionDays` VARCHAR(45) NOT NULL,
  `startTime` VARCHAR(45) NOT NULL,
  `endTime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcourses`),
  CONSTRAINT `fk_courses_faculty`
    FOREIGN KEY (`faculty_idFaculty`)
    REFERENCES `mctc_it`.`faculty` (`idFaculty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `mctc_it`.`courses` 
(`code`, `section`, `name`, `maxStudents`, `faculty_idFaculty`, 
`faculty_DepartmentId`, `sessionDays`,`startTime`,`endTime`) 
VALUES 
(0001, 01, 'Course1', 25, 1, 1,'T,Th','1:00','2:00'),
(1351, 01, 'Course2', 25, 2, 1,'W','2:00','3:00'),
(1981, 01, 'Course3', 25, 3, 2,'F','3:00','4:00'),
(0112, 01, 'Fibonacci',13,1,1,'Sa','4:00','5:00');

-- -----------------------------------------------------
-- Table `major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `major` ;

CREATE TABLE IF NOT EXISTS `major` (
  `idmajor` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idmajor`),
  UNIQUE INDEX `idmajor_UNIQUE` (`idmajor` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
insert into mctc_it.major 
(name) values 
('Software Development'),
('Web Development'),
('Computer and Network Support');

-- -----------------------------------------------------
-- Table `students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `students` ;

CREATE TABLE IF NOT EXISTS `students` (
  `idStudents` INT(11) NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `major_idmajor` INT(11) NOT NULL,
  `advisor_idadvisor` INT(11) NOT NULL,
  PRIMARY KEY (`idStudents`),
  UNIQUE INDEX `idStudents_UNIQUE` (`idStudents` ASC),
  INDEX `fk_students_major1_idx` (`major_idmajor` ASC),
  INDEX `fk_students_advisor1_idx` (`advisor_idadvisor` ASC),
  CONSTRAINT `fk_students_major1`
    FOREIGN KEY (`major_idmajor`)
    REFERENCES `major` (`idmajor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_advisor1`
    FOREIGN KEY (`advisor_idadvisor`)
    REFERENCES `advisor` (`idadvisor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
insert into mctc_it.students 
(FirstName,LastName,`major_idmajor`, `advisor_idadvisor`) values 
('First1','Student',1,1),
('First2','Student',1,1),
('First3','Student',1,2),
('First4','Student',1,2),
('First5','Student',2,1),
('First6','Student',2,2),
('First7','Student',2,1);

-- -----------------------------------------------------
-- Table `transcript`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transcript` ;

CREATE TABLE IF NOT EXISTS `transcript` (
  `Grade` VARCHAR(45) NULL DEFAULT NULL,
  `students_idStudents` INT(11) NOT NULL,
  `courses_idcourses` INT(10) UNSIGNED ZEROFILL NOT NULL,
  INDEX `fk_transcript_students1_idx` (`students_idStudents` ASC),
  INDEX `fk_transcript_courses1_idx` (`courses_idcourses` ASC),
  CONSTRAINT `fk_transcript_students1`
    FOREIGN KEY (`students_idStudents`)
    REFERENCES `students` (`idStudents`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transcript_courses1`
    FOREIGN KEY (`courses_idcourses`)
    REFERENCES `courses` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `mctc_it`.`transcript`
(`Grade`,
`students_idStudents`,
`courses_idcourses`)
VALUES
('A',
1,
1);




-- -----------------------------------------------------
-- Table `courses_has_students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `courses_has_students` ;

CREATE TABLE IF NOT EXISTS `courses_has_students` (
  `courses_idcourses` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `students_idStudents` INT(11) NOT NULL,
  INDEX `fk_courses_has_students_students1_idx` (`students_idStudents` ASC),
  INDEX `fk_courses_has_students_courses1_idx` (`courses_idcourses` ASC),
  CONSTRAINT `fk_courses_has_students_courses1`
    FOREIGN KEY (`courses_idcourses`)
    REFERENCES `courses` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_has_students_students1`
    FOREIGN KEY (`students_idStudents`)
    REFERENCES `students` (`idStudents`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `mctc_it`.`courses_has_students`
(`courses_idcourses`,
`students_idStudents`)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(3,3),
(3,1),
(1,4);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
