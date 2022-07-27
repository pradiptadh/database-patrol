
-- +migrate Up
INSERT INTO `askara_palm_patrol`.`repeat_types` (id, name, slug, created_at, updated_at)
VALUES 
(1, 'Repetitif', 'repetitif', DEFAULT, DEFAULT),
(2, 'Dinamis', 'dinamis', DEFAULT, DEFAULT);


-- +migrate Down
DELETE FROM `askara_palm_patrol`.`repeat_types` WHERE id in (1, 2);