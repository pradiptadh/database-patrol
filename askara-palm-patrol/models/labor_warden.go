package models

import "time"

type Labor struct {
	ID            int       `json:"id"`
	Name          string    `json:"name"`
	Email         string    `json:"email"`
	DateOfBirth   time.Time `json:"date_of_birth"`
	Phone         string    `json:"phone"`
	Nik           string    `json:"nik"`
	BirthProvince string    `json:"birth_province"`
	HomeProvince  string    `json:"home_province"`
	IsActive      bool      `json:"is_active"`
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
}

type Warden struct {
	ID            int       `json:"id"`
	Name          string    `json:"name"`
	Email         string    `json:"email"`
	DateOfBirth   time.Time `json:"date_of_birth"`
	Phone         string    `json:"phone"`
	Nik           string    `json:"nik"`
	BirthProvince string    `json:"birth_province"`
	HomeProvince  string    `json:"home_province"`
	IsActive      bool      `json:"is_active"`
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
}

type LaborActivityType struct {
	ID             int           `json:"id"`
	LaborID        int           `json:"labor_id"`
	Labor          *Labor        `json:"labor,omitempty" gorm:"foreignKey:LaborID"`
	ActivityTypeID int           `json:"activity_type_id"`
	ActivityType   *ActivityType `json:"activity_type,omitempty" gorm:"foreignKey:ActivityTypeID"`
	CreatedAt      time.Time     `json:"created_at"`
	UpdatedAt      time.Time     `json:"updated_at"`
}

type WardenActivityType struct {
	ID             int           `json:"id"`
	WardenID       int           `json:"warden_id"`
	Warden         *Warden       `json:"warden,omitempty" gorm:"foreignKey:WardenID"`
	ActivityTypeID int           `json:"activity_type_id"`
	ActivityType   *ActivityType `json:"activity_type,omitempty" gorm:"foreignKey:ActivityTypeID"`
	CreatedAt      time.Time     `json:"created_at"`
	UpdatedAt      time.Time     `json:"updated_at"`
}

type LaborBlock struct {
	ID        int       `json:"id"`
	LaborID   int       `json:"labor_id"`
	Labor     *Labor    `json:"labor,omitempty" gorm:"foreignKey:LaborID"`
	BlockID   int       `json:"block_id"`
	Block     *Block    `json:"block,omitempty" gorm:"foreignKey:BlockID"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type WardenBlock struct {
	ID        int       `json:"id"`
	WardenID  int       `json:"warden_id"`
	Warden    *Warden   `json:"warden,omitempty" gorm:"foreignKey:WardenID"`
	BlockID   int       `json:"block_id"`
	Block     *Block    `json:"block,omitempty" gorm:"foreignKey:BlockID"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}
