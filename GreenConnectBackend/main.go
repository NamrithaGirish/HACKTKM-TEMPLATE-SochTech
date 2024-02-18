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
		AllowHeaders:     []string{"Content-Type", "Authorization", "ngr "},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		MaxAge:           12, // Maximum age in seconds
	}))
	// server, err := socketio.NewServer(nil)
	// if err != nil {
	// 	log.Fatal(err)
	// }

	// server.OnConnect("/", func(s socketio.Conn) error {
	// 	log.Println("New connection:", s.ID())
	// 	return nil
	// })

	// server.OnEvent("/", "chat message", func(s socketio.Conn, msg string) {
	// 	log.Printf("[%s] Message: %s\n", s.ID(), msg)
	// 	// Broadcast the received message to all connected clients
	// 	server.BroadcastToRoom("/", "chat", "message", msg)
	// })

	// server.OnError("/", func(e error) {
	// 	log.Println("Socket.IO error:", e)
	// })

	// server.OnDisconnect("/", func(s socketio.Conn, reason string) {
	// 	log.Printf("[%s] Disconnected: %s\n", s.ID(), reason)
	// })

	// http.Handle("/socket.io/", server)
	// http.Handle("/", http.FileServer(http.Dir("./public")))

	// log.Println("Server started at :3000")
	// log.Fatal(http.ListenAndServe(":3000", nil))

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
