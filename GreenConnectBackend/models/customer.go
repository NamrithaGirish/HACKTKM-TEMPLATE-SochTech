package models

import (
	"github.com/NamrithaGirish/GreenConnectBackend/utils"
)

type Customer struct {
	ID          uint   `json:"id" gorm:"primaryKey;autoIncrement" form:"id"`
	Name        string `json:"name" gorm:"not null" form:"name"`
	Image       string `gorm:"column:image" json:"image" form:"image"`
	Mail        string `json:"gmail" gorm:"not null" form:"gmail"`
	Location    string `json:"location" gorm:"not null" form:"location"`
	Description string `json:"description" gorm:"not null" form:"description"`
}

func (variable *Customer) Save() (*Customer, error) {
	err := utils.DB.Create(&variable).Error
	if err != nil {
		return &Customer{}, err
	}
	return variable, nil
}

type Mentor struct {
	ID          uint   `json:"id" gorm:"primaryKey;autoIncrement" form:"id"`
	Name        string `json:"name" gorm:"not null" form:"name"`
	Image       string `gorm:"column:image" json:"image" form:"image"`
	Mail        string `json:"gmail" gorm:"not null" form:"gmail"`
	Location    string `json:"location" gorm:"not null" form:"location"`
	Description string `json:"description" gorm:"not null" form:"description"`
	Domain      string `json:"domain" gorm:"not null" form:"domain"`
	ClientCount int    `json:"client_count" gorm:"default:0" form:"client_count"`
	Limit       int    `json:"limit" gorm:"default:2" form:"limit"`
	Rating      int    `json:"rating" gorm:"default:0" form:"rating"`
}

func (variable *Mentor) Save() (*Mentor, error) {
	err := utils.DB.Create(&variable).Error
	if err != nil {
		return &Mentor{}, err
	}
	return variable, nil
}

type Education struct {
	ID       uint   `json:"id" gorm:"primaryKey;autoIncrement" form:"id"`
	Degree   string `json:"degree" gorm:"not null" form:"degree"`
	College  string `gorm:"not null" json:"image" form:"image"`
	Domain   string `json:"domain" gorm:"not null" form:"domain"`
	MentorID uint   `json:"mentor_id" gorm:"not null" form:"mentor_id"`
	Mentor   Mentor `gorm:"foreignKey:MentorID"`
}

func (variable *Education) Save() (*Education, error) {
	err := utils.DB.Create(&variable).Error
	if err != nil {
		return &Education{}, err
	}
	return variable, nil
}

type Experience struct {
	ID           uint   `json:"id" gorm:"primaryKey;autoIncrement" form:"id"`
	Role         string `json:"role" gorm:"not null" form:"role"`
	Organisation string `gorm:"not null" json:"organisation" form:"organisation"`
	Domain       string `json:"domain" gorm:"not null" form:"domain"`
	MentorID     uint   `json:"mentor_id" gorm:"not null" form:"mentor_id"`
	Mentor       Mentor `gorm:"foreignKey:MentorID"`
}

func (variable *Experience) Save() (*Experience, error) {
	err := utils.DB.Create(&variable).Error
	if err != nil {
		return &Experience{}, err
	}
	return variable, nil
}

type Connect struct {
	ID         uint     `json:"id" gorm:"primaryKey;autoIncrement" form:"id"`
	CustomerID uint     `json:"customer_id" gorm:"not null" form:"customer_id"`
	MentorID   uint     `json:"mentor_id" gorm:"not null" form:"mentor_id"`
	Active     bool     `json:"active" gorm:"default:true" form:"active"`
	Customer   Customer `gorm:"foreignKey:CustomerID"`
	Mentor     Mentor   `gorm:"foreignKey:MentorID"`
}

func (variable *Connect) Save() (*Connect, error) {
	err := utils.DB.Create(&variable).Error
	if err != nil {
		return &Connect{}, err
	}
	return variable, nil
}
