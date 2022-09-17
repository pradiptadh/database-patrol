
-- +migrate Up
INSERT INTO `askara_palm_patrol`.`roles` (id, name, description, created_at, updated_at)
VALUES 
(1, 'superadmin', 'superadmin', DEFAULT, DEFAULT),
(2, 'admin', 'admin', DEFAULT, DEFAULT),
(3, 'warden', 'warden', DEFAULT, DEFAULT);

-- +migrate Down
DELETE FROM `askara_palm_patrol`.`roles` WHERE id in (1, 2 , 3);
