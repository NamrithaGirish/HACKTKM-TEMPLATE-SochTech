package main

import (
	"fmt"

	"github.com/NamrithaGirish/GreenConnectBackend/models"
	"github.com/NamrithaGirish/GreenConnectBackend/utils"
)

func init() {
	utils.ConnectDB()
}

func main() {
	utils.DB.AutoMigrate(&models.Customer{}, &models.Mentor{}, &models.Experience{}, &models.Education{}, &models.Connect{}, &models.Review{})
	fmt.Println("? Migration complete")
}
