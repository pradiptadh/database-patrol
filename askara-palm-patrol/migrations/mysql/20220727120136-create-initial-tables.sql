
-- +migrate Up
CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`provinces` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`regencies` (
  `id` INT NOT NULL,
  `province_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_regencies_provinces1_idx` (`province_id` ASC),
  CONSTRAINT `fk_regencies_provinces1`
    FOREIGN KEY (`province_id`)
    REFERENCES `askara_palm_patrol`.`provinces` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`disctricts` (
  `id` INT NOT NULL,
  `regency_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_disctricts_regencies1_idx` (`regency_id` ASC),
  CONSTRAINT `fk_disctricts_regencies1`
    FOREIGN KEY (`regency_id`)
    REFERENCES `askara_palm_patrol`.`regencies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`lands` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `disctrict_id` INT NOT NULL,
  `area_size` FLOAT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `address` TEXT NOT NULL,
  `postal_code` VARCHAR(255) NOT NULL,
  `is_active` TINYINT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_lands_disctricts1_idx` (`disctrict_id` ASC),
  CONSTRAINT `fk_lands_disctricts1`
    FOREIGN KEY (`disctrict_id`)
    REFERENCES `askara_palm_patrol`.`disctricts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`blocks` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `land_id` INT UNSIGNED NOT NULL,
  `area_size` FLOAT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `plant_date` TIMESTAMP NOT NULL,
  `is_active` TINYINT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_blocks_lands_idx` (`land_id` ASC),
  CONSTRAINT `fk_blocks_lands`
    FOREIGN KEY (`land_id`)
    REFERENCES `askara_palm_patrol`.`lands` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`activity_type_groups` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`activity_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_type_group_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_types_activity_type_groups1_idx` (`activity_type_group_id` ASC),
  CONSTRAINT `fk_activity_types_activity_type_groups1`
    FOREIGN KEY (`activity_type_group_id`)
    REFERENCES `askara_palm_patrol`.`activity_type_groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`repeat_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`activity_statuses` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`activities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `land_id` INT UNSIGNED NOT NULL,
  `activity_type_id` INT UNSIGNED NOT NULL,
  `repeat_type_id` INT UNSIGNED NOT NULL,
  `interval` INT NOT NULL,
  `amount` INT NOT NULL,
  `value` ENUM("FARMERS", "TREES") NOT NULL,
  `start_date` TIMESTAMP NOT NULL,
  `is_end` TINYINT NOT NULL,
  `end_date` TIMESTAMP NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_activities_repeat_types1_idx` (`repeat_type_id` ASC),
  INDEX `fk_activities_activity_types1_idx` (`activity_type_id` ASC),
  INDEX `fk_activities_lands1_idx` (`land_id` ASC),
  CONSTRAINT `fk_activities_repeat_types1`
    FOREIGN KEY (`repeat_type_id`)
    REFERENCES `askara_palm_patrol`.`repeat_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activities_activity_types1`
    FOREIGN KEY (`activity_type_id`)
    REFERENCES `askara_palm_patrol`.`activity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activities_lands1`
    FOREIGN KEY (`land_id`)
    REFERENCES `askara_palm_patrol`.`lands` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`wardens` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `date_of_birth` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` VARCHAR(45) NOT NULL,
  `nik` VARCHAR(255) NOT NULL,
  `birth_province` VARCHAR(255) NOT NULL,
  `home_province` VARCHAR(255) NOT NULL,
  `is_active` TINYINT NOT NULL,
  `company_id` INT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`labors` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `date_of_birth` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` VARCHAR(45) NOT NULL,
  `nik` VARCHAR(255) NOT NULL,
  `birth_province` VARCHAR(255) NOT NULL,
  `home_province` VARCHAR(255) NOT NULL,
  `is_active` TINYINT NOT NULL,
  `company_id` INT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`warden_activity_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `wardens_id` INT UNSIGNED NOT NULL,
  `activity_type_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `fk_labor_activity_types_activity_types1_idx` (`activity_type_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_warden_activity_types_wardens1_idx` (`wardens_id` ASC),
  CONSTRAINT `fk_labor_activity_types_activity_types10`
    FOREIGN KEY (`activity_type_id`)
    REFERENCES `askara_palm_patrol`.`activity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_warden_activity_types_wardens1`
    FOREIGN KEY (`wardens_id`)
    REFERENCES `askara_palm_patrol`.`wardens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`warden_blocks` (
  `id` INT UNSIGNED NOT NULL,
  `warden_id` INT UNSIGNED NOT NULL,
  `block_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_labor_blocks_blocks1_idx` (`block_id` ASC),
  INDEX `fk_warden_blocks_wardens1_idx` (`warden_id` ASC),
  CONSTRAINT `fk_labor_blocks_blocks10`
    FOREIGN KEY (`block_id`)
    REFERENCES `askara_palm_patrol`.`blocks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_warden_blocks_wardens1`
    FOREIGN KEY (`warden_id`)
    REFERENCES `askara_palm_patrol`.`wardens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`labor_blocks` (
  `id` INT UNSIGNED NOT NULL,
  `labor_id` INT UNSIGNED NOT NULL,
  `block_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_labor_blocks_labors1_idx` (`labor_id` ASC),
  INDEX `fk_labor_blocks_blocks1_idx` (`block_id` ASC),
  CONSTRAINT `fk_labor_blocks_labors1`
    FOREIGN KEY (`labor_id`)
    REFERENCES `askara_palm_patrol`.`labors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_labor_blocks_blocks1`
    FOREIGN KEY (`block_id`)
    REFERENCES `askara_palm_patrol`.`blocks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`labor_activity_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `labor_id` INT UNSIGNED NOT NULL,
  `activity_type_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `fk_labor_activity_types_labors1_idx` (`labor_id` ASC),
  INDEX `fk_labor_activity_types_activity_types1_idx` (`activity_type_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_labor_activity_types_labors1`
    FOREIGN KEY (`labor_id`)
    REFERENCES `askara_palm_patrol`.`labors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_labor_activity_types_activity_types1`
    FOREIGN KEY (`activity_type_id`)
    REFERENCES `askara_palm_patrol`.`activity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`block_activities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_id` INT UNSIGNED NOT NULL,
  `block_id` INT UNSIGNED NOT NULL,
  `activity_status_id` INT UNSIGNED NOT NULL,
  `warden_id` INT NULL,
  `date` TIMESTAMP NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_block_activities_activities1_idx` (`activity_id` ASC),
  INDEX `fk_block_activities_blocks1_idx` (`block_id` ASC),
  INDEX `fk_block_activities_activity_statuses1_idx` (`activity_status_id` ASC),
  CONSTRAINT `fk_block_activities_activities1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `askara_palm_patrol`.`activities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_block_activities_blocks1`
    FOREIGN KEY (`block_id`)
    REFERENCES `askara_palm_patrol`.`blocks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_block_activities_activity_statuses1`
    FOREIGN KEY (`activity_status_id`)
    REFERENCES `askara_palm_patrol`.`activity_statuses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`labor_block_activites` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `labor_id` INT UNSIGNED NOT NULL,
  `block_activity_id` INT UNSIGNED NOT NULL,
  `work_hour` INT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_labor_block_activites_block_activities1_idx` (`block_activity_id` ASC),
  INDEX `fk_labor_block_activites_labors1_idx` (`labor_id` ASC),
  CONSTRAINT `fk_labor_block_activites_block_activities1`
    FOREIGN KEY (`block_activity_id`)
    REFERENCES `askara_palm_patrol`.`block_activities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_labor_block_activites_labors1`
    FOREIGN KEY (`labor_id`)
    REFERENCES `askara_palm_patrol`.`labors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`warden_block_activites` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `warden_id` INT UNSIGNED NOT NULL,
  `block_activity_id` INT UNSIGNED NOT NULL,
  `work_hour` INT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_labor_block_activites_block_activities1_idx` (`block_activity_id` ASC),
  INDEX `fk_warden_block_activites_wardens1_idx` (`warden_id` ASC),
  CONSTRAINT `fk_labor_block_activites_block_activities10`
    FOREIGN KEY (`block_activity_id`)
    REFERENCES `askara_palm_patrol`.`block_activities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_warden_block_activites_wardens1`
    FOREIGN KEY (`warden_id`)
    REFERENCES `askara_palm_patrol`.`wardens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- +migrate Down
DROP TABLE `askara_palm_patrol`.`activities`;
DROP TABLE `askara_palm_patrol`.`repeat_types`;
DROP TABLE `askara_palm_patrol`.`activity_types`;
DROP TABLE `askara_palm_patrol`.`activity_type_groups`;
DROP TABLE `askara_palm_patrol`.`blocks`;
DROP TABLE `askara_palm_patrol`.`lands`;
