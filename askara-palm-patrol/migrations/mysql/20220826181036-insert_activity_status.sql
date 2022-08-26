
-- +migrate Up
INSERT INTO `askara_palm_patrol`.`activity_statuses` (id, name, slug, created_at, updated_at)
VALUES 
(1, 'On Progress', 'on-progress', DEFAULT, DEFAULT),
(2, 'Pending', 'pending', DEFAULT, DEFAULT),
(3, 'Completed', 'completed', DEFAULT, DEFAULT);


-- +migrate Down
DELETE FROM `askara_palm_patrol`.`activity_statuses` WHERE id in (1, 2 , 3);