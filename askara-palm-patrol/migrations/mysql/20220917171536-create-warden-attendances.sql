
-- +migrate Up

CREATE TABLE IF NOT EXISTS `askara_palm_patrol`.`warden_attendances` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `warden_block_activity_id` INT UNSIGNED NOT NULL,
  `check_in` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_warden_attendances_warden_block_activities1_idx` (`warden_block_activity_id` ASC),
  CONSTRAINT `fk_warden_attendances_warden_block_activities1`
    FOREIGN KEY (`warden_block_activity_id`)
    REFERENCES `askara_palm_patrol`.`warden_block_activities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- +migrate Down
DROP TABLE IF EXISTS `askara_palm_patrol`.`warden_attendances`;
