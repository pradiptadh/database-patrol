package models

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	// "os"
)

var DB *gorm.DB

func Connect(username *string, password *string, host *string, port *string) {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/askara_palm_patrol", *username, *password, *host, *port)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}
	DB = db
}