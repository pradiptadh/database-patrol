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
	ActivityTypeGroupID int                `json:"activity_type_groups_id"`
	ActivityTypeGroup   *ActivityTypeGroup `json:"activity_type_group" gorm:"foreignKey:ActivityTypeGroupID"`
	Name                string             `json:"name"`
	CreatedAt           time.Time          `json:"created_at"`
	UpdatedAt           time.Time          `json:"updated_at"`
}

type Activity struct {
	ID             int           `json:"id"`
	ActivityTypeID int           `json:"activity_type_id"`
	ActivityType   *ActivityType `json:"activity_type,omitempty" gorm:"foreignKey:ActivityTypeID"`
	RepeatTypeID   int           `json:"repeat_type_id"`
	RepeatType     *RepeatType   `json:"repeat_type,omitempty" gorm:"foreignKey:RepeatTypeID"`
	Interval       int           `json:"interval"`
	FarmerCount    int           `json:"farmer_count"`
	Name           string        `json:"name"`
	CreatedAt      time.Time     `json:"created_at"`
	UpdatedAt      time.Time     `json:"updated_at"`
}

//For determining activity recurrence
type RepeatType struct {
	ID        int       `json:"id"`
	Name      string    `json:"name"`
	Slug      string    `json:"slug"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}
