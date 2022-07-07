package models

import (
	"gorm.io/gorm"
)

type ActivityType struct {
	gorm.Model
	ID uint8
	Name string
	TreatmentActivity []TreatmentActivity
}

type TreatmentActivity struct {
	gorm.Model
	ID uint16
	Name string
	Description string
	LaborPerHaPerDay uint8
	ActivityTypeID uint8
	DaysRepetition uint16
}

// type HarvestActivity struct {
// 	ID uint16
// 	Name string
// 	Description string
// 	TreePerLaborPerDay uint8
// 	ActivityTypeID uint8
// 	DaysRepetition uint16
// }