
-- +migrate Up
alter table activity_types
    change activity_type_groups_id activity_type_group_id int unsigned not null;
-- +migrate Down
alter table activity_types
    change activity_type_group_id activity_type_groups_id int unsigned not null;
