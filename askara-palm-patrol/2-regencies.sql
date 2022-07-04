CREATE TABLE IF NOT EXISTS regencies (
  id char(4) NOT NULL,
  province_id char(2) NOT NULL,
  name varchar(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT regencies_province_id_foreign FOREIGN KEY (province_id) 
  REFERENCES provinces (id)
);