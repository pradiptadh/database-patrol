package models

import "time"

type Block struct {
	ID        int       `json:"id"`
	AreaSize  float64   `json:"area_size"`
	Name      string    `json:"name"`
	PlantDate time.Time `json:"plant_date"`
	IsActive  bool      `json:"is_active"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`

	//Preload
	LandID int   `json:"land_id"`
	Land   *Land `json:"land,omitempty" gorm:"foreignKey:LandID"`
}
