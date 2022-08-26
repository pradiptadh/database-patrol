-- +migrate Up
rename table `askara_palm_patrol`.`labor_block_activites` to labor_block_activities;

rename table `askara_palm_patrol`.`warden_block_activites` to warden_block_activities;

alter table labor_block_activities
    add note text null;

alter table labor_block_activities
    add total_harvest int null;

alter table labor_block_activities
    add has_finished TINYINT not null;

-- +migrate Down
alter table labor_block_activities
    drop total_harvest;

alter table labor_block_activities
    drop note;

 alter table labor_block_activities
    drop has_finished;

rename table `askara_palm_patrol`.`labor_block_activites` to labor_block_activites;

rename table`askara_palm_patrol`.`warden_block_activites` to warden_block_activites;