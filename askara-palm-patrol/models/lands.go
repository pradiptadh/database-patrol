package models

import (
	"gorm.io/gorm"
)

type PalmLand struct {
	gorm.Model
	ID uint16
	Name string
	AreaSize float32
	Latitude float32
	Longitude float32
	DistrictID int
	CompanyID int
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