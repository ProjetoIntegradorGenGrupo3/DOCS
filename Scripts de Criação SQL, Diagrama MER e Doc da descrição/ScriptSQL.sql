-- MySQL Script generated by MySQL Workbench
-- Wed Dec  6 15:08:49 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_eco.nect
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_eco.nect
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_eco.nect` DEFAULT CHARACTER SET utf8 ;
USE `db_eco.nect` ;

-- -----------------------------------------------------
-- Table `db_eco.nect`.`tb_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eco.nect`.`tb_tipo` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_eco.nect`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eco.nect`.`tb_usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `tipo_usuario` VARCHAR(255) NOT NULL,
  `bio` VARCHAR(255) NOT NULL,
  `contato` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_eco.nect`.`tb_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eco.nect`.`tb_post` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `data_postagem` DATE NOT NULL,
  `conteudo` VARCHAR(9999) NOT NULL,
  `localidade` VARCHAR(255) NULL,
  `foto` VARCHAR(250) NULL,
  `tipo_id` BIGINT NOT NULL,
  `usuarios_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_usuarios_copy1_tb_categorias_idx` (`tipo_id` ASC) VISIBLE,
  INDEX `fk_tb_usuarios_copy1_tb_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_usuarios_copy1_tb_categorias`
    FOREIGN KEY (`tipo_id`)
    REFERENCES `db_eco.nect`.`tb_tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_usuarios_copy1_tb_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `db_eco.nect`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
