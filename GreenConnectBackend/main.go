package main

import (
	"fmt"

	"github.com/gin-contrib/cors"

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
	router.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"GET", "POST", "PUT"},
		AllowHeaders:     []string{"Content-Type", "Authorization", "ngrok-skip-browser-warning"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		MaxAge:           12, // Maximum age in seconds
	}))
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

	router.POST("/chat", controllers.ChatSave)
	router.GET("/chat/:sender_id/:receiver_id", controllers.DisplayChat)

	router.Run(":8080")

}
