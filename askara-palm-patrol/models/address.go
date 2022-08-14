package models

import (
	"time"
)

type Province struct {
	ID        int       `json:"id"`
	Name      string    `json:"name"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Regency struct {
	ID         int       `json:"id"`
	ProvinceID int       `json:"province_id"`
	Province   *Province `json:"province,omitempty" gorm:"foreignKey:ProvinceID"`
	Name       string    `json:"name"`
	CreatedAt  time.Time `json:"created_at"`
	UpdatedAt  time.Time `json:"updated_at"`
}

type District struct {
	ID        int       `json:"id"`
	RegencyID int       `json:"regency_id"`
	Regency   *Regency  `json:"regency,omitempty" gorm:"foreignKey:RegencyID"`
	Name      string    `json:"name"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}
