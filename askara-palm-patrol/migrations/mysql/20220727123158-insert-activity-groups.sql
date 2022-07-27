
-- +migrate Up
INSERT INTO `askara_palm_patrol`.`activity_type_groups` (id, name, slug, created_at, updated_at)
VALUES 
(1, 'Perawatan', 'perawatan', DEFAULT, DEFAULT),
(2, 'Panen', 'panen', DEFAULT, DEFAULT);

-- +migrate Down
DELETE FROM `askara_palm_patrol`.`activity_type_groups` WHERE id in (1, 2);
