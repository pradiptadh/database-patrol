package models

import (
	"time"
)

type ActivityTypeGroup struct {
	ID        int       `json:"id"`
	Name      string    `json:"name"`
	Slug      string    `json:"slug"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type ActivityType struct {
	ID                  int                `json:"id"`
	ActivityTypeGroupID int                `json:"activity_type_group_id"`
	ActivityTypeGroup   *ActivityTypeGroup `json:"activity_type_group" gorm:"foreignKey:ActivityTypeGroupID"`
	Name                string             `json:"name"`
	CreatedAt           time.Time          `json:"created_at"`
	UpdatedAt           time.Time          `json:"updated_at"`
}

type Activity struct {
	ID        int       `json:"id"`
	Interval  int       `json:"interval"`
	Amount    int       `json:"amount"`
	Value     string    `json:"value"`
	StartDate time.Time `json:"start_date"`
	IsEnd     bool      `json:"is_end"`
	EndDate   time.Time `json:"end_date"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`

	// Can be preloaded if necessary
	LandID         int           `json:"land_id"`
	Land           *Land         `json:"land,omitempty" gorm:"foreignKey:LandID"`
	ActivityTypeID int           `json:"activity_type_id"`
	ActivityType   *ActivityType `json:"activity_type,omitempty" gorm:"foreignKey:ActivityTypeID"`
	RepeatTypeID   int           `json:"repeat_type_id"`
	RepeatType     *RepeatType   `json:"repeat_type,omitempty" gorm:"foreignKey:RepeatTypeID"`
}

//For determining activity recurrence
type RepeatType struct {
	ID        int       `json:"id"`
	Name      string    `json:"name"`
	Slug      string    `json:"slug"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type ActivityStatus struct {
	ID        int       `json:"id"`
	Name      string    `json:"name"`
	Slug      string    `json:"slug"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}
