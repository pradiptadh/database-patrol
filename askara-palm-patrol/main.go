package main

import (
	"log"
	"os"

	"github.com/joho/godotenv"
	"github.com/pradiptadh/database-patrol/askara-palm-patrol/models"
)

// Uncomment if you want to execute it locally
func init() {
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal("Error loading .env file")
	}
}

func main() {
	username := os.Getenv("DB_USERNAME")
	password := os.Getenv("DB_PASSWORD")
	host := os.Getenv("DB_HOST")
	port := os.Getenv("DB_PORT")
	models.Connect(&username, &password, &host, &port)

	// Commented, divert to sql-migrate migrations
	// models.DB.AutoMigrate(
	// 	&models.Province{},
	// 	&models.Regency{},
	// 	&models.District{},
	// 	&models.Company{},
	// 	&models.PalmLand{},
	// 	&models.PalmBlock{},
	// 	&models.PalmTree{},
	// 	&models.ActivityType{},
	// 	&models.TreatmentActivity{},
	// 	&models.LaborType{},
	// 	&models.Labor{},
	// )
}
