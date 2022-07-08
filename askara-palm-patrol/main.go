package main

import (
	"github.com/Askara-Daulat-Desa/database-patrol/askara-palm-patrol/models"
	"os"
)

func main() {
	username := os.Getenv("DB_USERNAME")
	password := os.Getenv("DB_PASSWORD")
	host := os.Getenv("DB_HOST")
	port := os.Getenv("DB_PORT")
	models.Connect(&username, &password, &host, &port)
	models.DB.AutoMigrate(
		&models.Province{},
		&models.Regency{},
		&models.District{},
		&models.Company{},
		&models.PalmLand{},
		&models.PalmBlock{},
		&models.PalmTree{},
		&models.ActivityType{},
		&models.TreatmentActivity{},
		&models.LaborType{},
		&models.Labor{},
		)	
}