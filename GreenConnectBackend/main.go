package main

import (
	"fmt"

	"github.com/NamrithaGirish/GreenConnectBackend/controllers"
	"github.com/NamrithaGirish/GreenConnectBackend/utils"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("Hello")
	gin.SetMode(gin.ReleaseMode) //optional to not get warning
	//route.SetTrustedProxies([]string{"192.168.1.2"}) //to trust only a specific value
	utils.ConnectDB()
	router := gin.Default()
	router.GET("/prev-mentor/:id", controllers.PrevMentors)
	router.GET("/other-mentor/:id", controllers.GetAllOtherMentors)
	router.GET("/other-mentor/name/:id", controllers.GetMentorsByName)
	router.GET("/other-mentor/domain/:id", controllers.GetMentorsByDomain)
	router.GET("/other-mentor/rating/:id", controllers.GetMentorsByRating)
	router.POST("/add-mentor", controllers.AddMentor)
	router.POST("/add-customer", controllers.AddCustomer)
	router.POST("/add-education", controllers.AddEducation)
	router.POST("/add-connect", controllers.AddConnect)
	router.POST("/add-experience", controllers.AddExperience)
	router.GET("/mentor-profile/:id", controllers.GetMentorProfile)
	router.GET("/customer-profile/:id", controllers.GetCustomerProfile)

	router.Run(":8080")

}
