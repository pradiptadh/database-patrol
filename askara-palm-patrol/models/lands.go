package models

import "time"

type Land struct {
	ID         int       `json:"id"`
	AreaSize   float64   `json:"area_size"`
	Province   string    `json:"province"`
	Name       string    `json:"name"`
	Address    string    `json:"address"`
	District   string    `json:"district"`
	Regency    string    `json:"regency"`
	PostalCode string    `json:"postal_code"`
	CreatedAt  time.Time `json:"created_at"`
	UpdatedAt  time.Time `json:"updated_at"`
}
