CREATE TABLE IF NOT EXISTS `palm_land_blocks` (
  `id` int NOT NULL auto_increment,
  `name` varchar(255),
  `area_size` float,
  `palm_land_id` int not null,
  `district_id` char(7) NOT NULL,
  `created_at` timestamp default current_timestamp,
  `updated_at` timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (`id`),
  CONSTRAINT `palm_land_blocks_palm_lands_id_foreign` FOREIGN KEY (`palm_land_id`) REFERENCES `palm_lands` (`id`)
);