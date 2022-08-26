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
	IsActive         bool            `json:"is_active"`
	Desc             string          `json:"desc"`
	ReadyHarvest     int             `json:"ready_harvest"`
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
	TotalHarvest    int            `json:"total_harvest"`
	Note            string         `json:"note"`
	HasFinished     bool           `json:"has_finished"`
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

type BlockActivityImage struct {
	ID              int            `json:"id"`
	BlockActivityID int            `json:"block_activity_id"`
	BlockActivity   *BlockActivity `json:"block_activity,omitempty" gorm:"foreignKey:BlockActivityID"`
	Media           string         `json:"media"`
	CreatedAt       time.Time      `json:"created_at"`
	UpdatedAt       time.Time      `json:"updated_at"`
}

type LaborAttendant struct {
	ID                   int                 `json:"id"`
	LaborBlockActivityID int                 `json:"labor_block_activity_id"`
	LaborBlockActivity   *LaborBlockActivity `json:"labor_block_activity,omitempty" gorm:"foreignKey:LaborBlockActivityID"`
	CheckIn              time.Time           `json:"check_in"`
	CheckOut             time.Time           `json:"check_out"`
	CreatedAt            time.Time           `json:"created_at"`
	UpdatedAt            time.Time           `json:"updated_at"`
}
