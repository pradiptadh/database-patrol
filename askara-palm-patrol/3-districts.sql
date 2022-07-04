CREATE TABLE IF NOT EXISTS districts (
  id char(7) NOT NULL,
  regency_id char(4) NOT NULL,
  name varchar(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT districts_regency_id_foreign FOREIGN KEY (regency_id) REFERENCES regencies (id)
);