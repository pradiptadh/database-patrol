CREATE TABLE IF NOT EXISTS activity_types {
    id int not null auto_increment,
    name varchar(255) not null,
    PRIMARY KEY (id),
    created_at timestamp default current_timestamp
}