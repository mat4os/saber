-- MySQL Script generated by MySQL Workbench
-- 09/24/16 23:50:53
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema saber
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema saber
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `saber` DEFAULT CHARACTER SET utf8 ;
USE `saber` ;

-- -----------------------------------------------------
-- Table `saber`.`DF_MODULOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saber`.`DF_MODULOS` ;

CREATE TABLE IF NOT EXISTS `saber`.`DF_MODULOS` (
  `ID_MODULO` INT NOT NULL AUTO_INCREMENT,
  `DES_MODULO` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_MODULO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saber`.`DF_TICKERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saber`.`DF_TICKERS` ;

CREATE TABLE IF NOT EXISTS `saber`.`DF_TICKERS` (
  `ID_TICKER` INT NOT NULL AUTO_INCREMENT,
  `TICKER` VARCHAR(6) NOT NULL,
  `NOMBRE` VARCHAR(100) NOT NULL,
  `PAIS` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`ID_TICKER`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saber`.`DF_VALORES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saber`.`DF_VALORES` ;

CREATE TABLE IF NOT EXISTS `saber`.`DF_VALORES` (
  `ID_TICKER` INT NOT NULL,
  `ID_MODULO` INT NOT NULL,
  `FECHA` DATETIME NOT NULL,
  `VALOR` DOUBLE NOT NULL,
  INDEX `FK_VALOR_MOD_idx` (`ID_MODULO` ASC),
  CONSTRAINT `FK_VALOR_MOD`
    FOREIGN KEY (`ID_MODULO`)
    REFERENCES `saber`.`DF_MODULOS` (`ID_MODULO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_VALOR_TICKER`
    FOREIGN KEY (`ID_TICKER`)
    REFERENCES `saber`.`DF_TICKERS` (`ID_TICKER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saber`.`RSS_ORIGEN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saber`.`RSS_ORIGEN` ;

CREATE TABLE IF NOT EXISTS `saber`.`RSS_ORIGEN` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(300) NOT NULL,
  `URL` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saber`.`RSS_FEED`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saber`.`RSS_FEED` ;

CREATE TABLE IF NOT EXISTS `saber`.`RSS_FEED` (
  `ID_FEED` INT NOT NULL AUTO_INCREMENT,
  `ID_RSS` INT NOT NULL,
  `IDENTIFIER` VARCHAR(300) NULL,
  `TITLE` VARCHAR(300) NULL,
  `LINK` VARCHAR(300) NULL,
  `DESCRIPTION` VARCHAR(3000) NULL,
  `PUBLISHED` DATETIME NULL,
  PRIMARY KEY (`ID_FEED`),
  INDEX `FK_ORIGEN_FEED_idx` (`ID_RSS` ASC),
  CONSTRAINT `FK_ORIGEN_FEED`
    FOREIGN KEY (`ID_RSS`)
    REFERENCES `saber`.`RSS_ORIGEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saber`.`RSS_CATEGORIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saber`.`RSS_CATEGORIA` ;

CREATE TABLE IF NOT EXISTS `saber`.`RSS_CATEGORIA` (
  `ID_FEED` INT NOT NULL,
  `CATEGORY` VARCHAR(45) NOT NULL,
  CONSTRAINT `FK_FEED_CATEGORIA`
    FOREIGN KEY (`ID_FEED`)
    REFERENCES `saber`.`RSS_FEED` (`ID_FEED`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saber`.`DF_TERMINOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saber`.`DF_TERMINOS` ;

CREATE TABLE IF NOT EXISTS `saber`.`DF_TERMINOS` (
  `ID_TERMINO` INT NOT NULL AUTO_INCREMENT,
  `ID_TICKER` INT NOT NULL,
  `TERMINO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_TERMINO`),
  INDEX `FK_TERMINO_TICKER_idx` (`ID_TICKER` ASC),
  CONSTRAINT `FK_TERMINO_TICKER`
    FOREIGN KEY (`ID_TICKER`)
    REFERENCES `saber`.`DF_TICKERS` (`ID_TICKER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;