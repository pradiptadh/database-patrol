CREATE TABLE IF NOT EXISTS `palm_trees` (
    `id` int not null auto_increment,
    `age` int not null,
    `palm_land_block_id` int not null,
    `created_at` timestamp default current_timestamp,
    `updated_at` timestamp default current_timestamp on update current_timestamp,
    PRIMARY KEY (`id`),
    CONSTRAINT `palm_trees_palm_land_block_id_foreign` FOREIGN KEY (`palm_land_block_id`) REFERENCES `palm_land_blocks` (`id`)
)