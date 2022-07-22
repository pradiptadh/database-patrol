package models

import (
	"gorm.io/gorm"
)

type PalmLand struct {
	gorm.Model
	ID uint16	`json:"id"`
	Name string	`json:"name"`
	AreaSize float32 `json:"area_size"`
	Latitude float32 `json:"latitude"`
	Longitude float32 `json:"longitude"`
	DistrictID int `json:"district_id"`
	CompanyID int	`json:"company_id"`
	PalmBlock []PalmBlock `gorm:"constraint:OnUpdate:CASCADE,OnDelete:CASCADE;"`
}

type PalmBlock struct {
	gorm.Model
	ID uint16
	Name string
	PalmLandID uint16
	AreaSize float32
	AverageAge int	
	PalmTree []PalmTree `gorm:"constraint:OnUpdate:CASCADE,OnDelete:CASCADE;"`
}

type PalmTree struct {
	gorm.Model
	ID uint16
	PalmBlockID uint16
}