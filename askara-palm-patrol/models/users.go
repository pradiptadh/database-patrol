package models

import "time"

type User struct {
	ID        int       `json:"id"`
	RoleID    int       `json:"role_id"`
	Role      *Role     `json:"role" gorm:"foreignKey:RoleID"`
	FirstName string    `json:"first_name"`
	LastName  string    `json:"last_name"`
	Email     string    `json:"email"`
	Password  string    `json:"password"`
	WardenID  int       `json:"warden_id"`
	Warden    *Warden   `json:"warden,omitempty" gorm:"foreignKey:WardenID"`
	CompanyID int       `json:"company_id"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Role struct {
	ID          int       `json:"id"`
	Name        string    `json:"name"`
	Description string    `json:"description"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}
