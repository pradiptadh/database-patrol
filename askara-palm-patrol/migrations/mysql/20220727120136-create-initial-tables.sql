
-- +migrate Up
CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`lands` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `area_size` FLOAT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `province` VARCHAR(255) NOT NULL,
  `regency` VARCHAR(255) NOT NULL,
  `district` VARCHAR(255) NOT NULL,
  `address` TEXT NOT NULL,
  `postal_code` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`blocks` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `land_id` INT UNSIGNED NOT NULL,
  `area_size` FLOAT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `plant_date` TIMESTAMP NOT NULL,
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
  `activity_type_groups_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_types_activity_type_groups1_idx` (`activity_type_groups_id` ASC),
  CONSTRAINT `fk_activity_types_activity_type_groups1`
    FOREIGN KEY (`activity_type_groups_id`)
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

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`activities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_type_id` INT UNSIGNED NOT NULL,
  `repeat_type_id` INT UNSIGNED NOT NULL,
  `block_id` INT UNSIGNED NOT NULL,
  `interval` INT NOT NULL,
  `farmer_count` INT NOT NULL,
  `start_date` TIMESTAMP NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_activities_repeat_types1_idx` (`repeat_type_id` ASC),
  INDEX `fk_activities_activity_types1_idx` (`activity_type_id` ASC),
  INDEX `fk_activities_blocks1_idx` (`block_id` ASC),
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
  CONSTRAINT `fk_activities_blocks1`
    FOREIGN KEY (`block_id`)
    REFERENCES `askara_palm_patrol`.`blocks` (`id`)
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
