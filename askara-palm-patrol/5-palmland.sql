CREATE TABLE IF NOT EXISTS `palm_lands` (
  `id` int NOT NULL auto_increment,
  `name` varchar(255),
  `latitude` float,
  `longitude` float,
  `area_size` float,
  `company_id` int not null,
  `district_id` char(7) NOT NULL,
  `created_at` timestamp default current_timestamp,
  `updated_at` timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (`id`),
  CONSTRAINT `palm_lands_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `palm_lands_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
);



