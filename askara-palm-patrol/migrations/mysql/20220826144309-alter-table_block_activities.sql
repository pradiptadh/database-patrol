
-- +migrate Up
alter table block_activities
    add is_active tinyint null after warden_id;

alter table block_activities
    add ready_harvest int null after is_active;

alter table block_activities
    add `desc` text null after ready_harvest;

-- +migrate Down
alter table block_activities
    drop is_active;

alter table block_activities
    drop ready_harvest;

alter table block_activities
    drop `desc`;
