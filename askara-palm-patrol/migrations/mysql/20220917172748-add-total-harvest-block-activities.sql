
-- +migrate Up
alter table block_activities
    add total_harvest int null after ready_harvest;

-- +migrate Down
alter table block_activities
    drop total_harvest;
