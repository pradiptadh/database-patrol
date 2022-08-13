package models

import "time"

type Land struct {
	ID         int       `json:"id"`
	AreaSize   float64   `json:"area_size"` //Might be guard clause for making new blocks
	Name       string    `json:"name"`
	Address    string    `json:"address"`
	PostalCode string    `json:"postal_code"`
	IsActive   bool      `json:"is_active"`
	CreatedAt  time.Time `json:"created_at"`
	UpdatedAt  time.Time `json:"updated_at"`

	// Get district, province, and regency from preload
	DistrictID int       `json:"district_id"`
	District   *District `json:"district"`

	// Assign manually  from preload
	ProvinceName string `json:"province_name" gorm:"-"`
	RegencyName  string `json:"regency_name" gorm:"-"`
	DistrictName string `json:"district_name" gorm:"-"`

	// Count with query
	TotalBlock int `json:"total_block" gorm:"-"`
}
