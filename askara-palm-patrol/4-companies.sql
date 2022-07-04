CREATE TABLE IF NOT EXISTS companies (
    id int not null auto_increment,
    name varchar(255) not null,
    description varchar(255) not null,
    PRIMARY KEY (`id`),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);