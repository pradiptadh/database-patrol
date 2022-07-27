package models

import (
	"gorm.io/datatypes"
	"gorm.io/gorm"
)

type LaborType struct {
	gorm.Model
	ID    uint8
	Name  string
	Labor []Labor `gorm:"constraint:OnUpdate:CASCADE,OnDelete:CASCADE;"`
}

type Labor struct {
	gorm.Model
	ID          int
	Name        string
	DOB         datatypes.Date
	JoinDate    datatypes.Date
	IsActive    bool
	LaborTypeID uint8
}
