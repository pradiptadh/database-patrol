CREATE TABLE IF NOT EXISTS treatment_activities {
    id int not null auto_increment,
    activity_category_id int not null,
    name varchar(255) not null,
    description varchar(255) not null,
    labor_per_ha_per_day int default 0,
    activity_type_id int not null,
    days_for_repetition int not null,
    PRIMARY KEY (id),
    created_at timestamp default current_timestamp,
    CONSTRAINT activities_activity_category_id_foreign FOREIGN KEY (activity_category_id) REFERENCES act
}