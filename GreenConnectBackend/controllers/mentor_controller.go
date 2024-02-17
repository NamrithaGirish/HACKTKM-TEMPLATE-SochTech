package controllers

import (
	"net/http"
	"strconv"

	"github.com/NamrithaGirish/GreenConnectBackend/models"
	"github.com/NamrithaGirish/GreenConnectBackend/utils"

	"github.com/gin-gonic/gin"
)

func AddCustomer(context *gin.Context) {
	var input models.Customer

	if err := context.ShouldBindJSON(&input); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Save the customer to the database
	savedCustomer, err := input.Save()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"message": "Customer added successfully", "customer": savedCustomer})

}

func AddMentor(context *gin.Context) {
	var input models.Mentor

	if err := context.ShouldBind(&input); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Save the customer to the database
	savedMentor, err := input.Save()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"message": "Mentor added successfully", "mentor": savedMentor})

}
func AddExperience(context *gin.Context) {
	var input models.Experience

	if err := context.ShouldBind(&input); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Save the customer to the database
	savedMentor, err := input.Save()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"message": "Mentor Experience added successfully", "mentor": savedMentor})

}
func AddEducation(context *gin.Context) {
	var input models.Education

	if err := context.ShouldBind(&input); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Save the customer to the database
	savedMentor, err := input.Save()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"message": "Mentor education added successfully", "mentor": savedMentor})

}
func AddConnect(context *gin.Context) {
	// var input models.Connect

	// if err := context.ShouldBind(&input); err != nil {
	// 	context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	// 	return
	// }

	// // Save the customer to the database
	// savedMentor, err := input.Save()
	// if err != nil {
	// 	context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
	// 	return
	// }

	// context.JSON(http.StatusOK, gin.H{"message": "Mentor assigned added successfully", "mentor": savedMentor})
	var connect models.Connect
	if err := context.ShouldBindJSON(&connect); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	var mentor models.Mentor
	result := utils.DB.First(&mentor, connect.MentorID)
	if result.Error != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to find mentor"})
		return
	}
	if mentor.ClientCount < mentor.Limit {
		mentor.ClientCount++
		utils.DB.Save(&mentor)
	} else {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to allot mentor"})
		return
	}

	// Increment currentClient by one until it reaches the limit

	// var mentor models.Mentor
	// Check if total count of connections is more than 10 and increase the limit
	var mentorConnectionsCount int64
	utils.DB.Model(&models.Connect{}).Where("mentor_id = ?", connect.MentorID).Count(&mentorConnectionsCount)
	print(mentorConnectionsCount)
	if mentorConnectionsCount > 10 {

		result := utils.DB.First(&mentor, connect.MentorID)
		if result.Error != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to find mentor"})
			return
		}
		mentor.Limit++
		utils.DB.Save(&mentor)
	}

	if _, err := connect.Save(); err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add connection"})
		return
	}

	context.JSON(http.StatusOK, gin.H{"message": "Connection added successfully", "mentor": mentor})
}

func GetMentorByID(id int) models.Mentor {
	var mentor models.Mentor
	utils.DB.Where("id = ?", id).First(&mentor)
	return mentor

}
func PrevMentors(context *gin.Context) {
	// var mentor_id []int
	var mentor_list []models.Mentor
	user_id, err := strconv.ParseUint(context.Param("id"), 10, 64)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Incorrect user ID"})
		return
	}
	// Query the database to get the first five users with the maximum points
	subquery := utils.DB.Model(&models.Connect{}).Where("customer_id = ?", user_id).Select("mentor_id")

	// Fetch mentors not connected to the user
	err = utils.DB.Where("id IN (?)", subquery).Find(&mentor_list).Error
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"prev_mentors": mentor_list})
}

func GetAllOtherMentors(context *gin.Context) {
	// var connect []models.Connect
	var mentor_list []models.Mentor
	user_id, err := strconv.ParseUint(context.Param("id"), 10, 64)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Incorrect user ID"})
		return
	}
	// Query the database to get the first five users with the maximum points
	subquery := utils.DB.Model(&models.Connect{}).Where("customer_id = ?", user_id).Select("mentor_id")

	// Fetch mentors not connected to the user
	err = utils.DB.Where("id NOT IN (?)", subquery).Find(&mentor_list).Error
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"other_mentors": mentor_list})
}
