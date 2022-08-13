package models

import "time"

type BlockActivity struct {
	ID               int             `json:"id"`
	ActivityID       int             `json:"activity_id"`
	Activity         *Activity       `json:"activity,omitempty" gorm:"foreignKey:ActivityID"`
	BlockID          int             `json:"block_id"`
	Block            *Block          `json:"block,omitempty" gorm:"foreignKey:BlockID"`
	ActivityStatusID int             `json:"activity_status_id"`
	ActivityStatus   *ActivityStatus `json:"activity_status,omitempty" gorm:"foreignKey:ActivityStatusID"`
	WardenID         int             `json:"warden_id"`
	Warden           *Warden         `json:"warden,omitempty" gorm:"foreignKey:WardenID"`
	Date             time.Time       `json:"date"`
	CreatedAt        time.Time       `json:"created_at"`
	UpdatedAt        time.Time       `json:"updated_at"`
}

type LaborBlockActivity struct {
	ID              int            `json:"id"`
	LaborID         int            `json:"labor_id"`
	Labor           *Labor         `json:"labor,omitempty" gorm:"foreignKey:LaborID"`
	BlockActivityID int            `json:"block_activity_id"`
	BlockActivity   *BlockActivity `json:"block_activity,omitempty" gorm:"foreignKey:BlockActivityID"`
	WorkHour        int            `json:"work_hour"`
	CreatedAt       time.Time      `json:"created_at"`
	UpdatedAt       time.Time      `json:"updated_at"`
}

type WardenBlockActivity struct {
	ID              int            `json:"id"`
	WardenID        int            `json:"warden_id"`
	Warden          *Warden        `json:"warden,omitempty" gorm:"foreignKey:WardenID"`
	BlockActivityID int            `json:"block_activity_id"`
	BlockActivity   *BlockActivity `json:"block_activity,omitempty" gorm:"foreignKey:BlockActivityID"`
	WorkHour        int            `json:"work_hour"`
	CreatedAt       time.Time      `json:"created_at"`
	UpdatedAt       time.Time      `json:"updated_at"`
}
