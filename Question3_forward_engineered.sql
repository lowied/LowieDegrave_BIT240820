-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `idGene` INT NOT NULL AUTO_INCREMENT,
  `gene_name` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`idGene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `idMutation` INT NOT NULL AUTO_INCREMENT,
  `chromosomal location` VARCHAR(45) NOT NULL,
  `gene_id` INT NOT NULL,
  PRIMARY KEY (`idMutation`),
  INDEX `idGene_idx` (`gene_id` ASC) VISIBLE,
  CONSTRAINT `idGene`
    FOREIGN KEY (`gene_id`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT,
  `patient_name` VARCHAR(45) NOT NULL,
  `sex` ENUM("M", "F") NOT NULL,
  `age_diagnose` INT(3) NOT NULL,
  `mutation_id` INT NOT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `Mutation_id_idx` (`mutation_id` ASC) VISIBLE,
  CONSTRAINT `mutation_id`
    FOREIGN KEY (`mutation_id`)
    REFERENCES `mydb`.`Mutation` (`idMutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
