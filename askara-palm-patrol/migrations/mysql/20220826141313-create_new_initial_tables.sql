
-- +migrate Up
CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`labor_attendances` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `labor_block_activity_id` INT UNSIGNED NOT NULL,
  `check_in` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `labor_block_activity_id`),
  INDEX `fk_labor_attendances_labor_block_activities1_idx` (`labor_block_activity_id` ASC),
  CONSTRAINT `fk_labor_attendances_labor_block_activities1`
    FOREIGN KEY (`labor_block_activity_id`)
    REFERENCES `askara_palm_patrol`.`labor_block_activities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`block_activity_images` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `block_activity_id` INT UNSIGNED NOT NULL,
  `media` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_block_acitivity_images_block_activities1_idx` (`block_activity_id` ASC),
  CONSTRAINT `fk_block_acitivity_images_block_activities1`
    FOREIGN KEY (`block_activity_id`)
    REFERENCES `askara_palm_patrol`.`block_activities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- +migrate Down
DROP TABLE IF EXISTS `askara_palm_patrol`.`labor_attendances`;
DROP TABLE IF EXISTS  `askara_palm_patrol`.`block_activity_images`;