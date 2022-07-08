package main

import (
	"github.com/Askara-Daulat-Desa/database-patrol/askara-palm-patrol/models"
)

func main() {
	models.Connect()
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