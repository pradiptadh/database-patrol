
-- +migrate Up
alter table block_activities
    add is_active tinyint null;

alter table block_activities
    add ready_harvest int null;

alter table block_activities
    add `desc` text null;

-- +migrate Down
alter table block_activities
    drop is_active;

alter table block_activities
    drop ready_harvest;

alter table block_activities
    drop `desc`;
