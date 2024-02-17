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

func GetMentorsByName(context *gin.Context) {
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
	err = utils.DB.Where("id NOT IN (?)", subquery).Order("name").Find(&mentor_list).Error
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"other_mentors": mentor_list})
}
func GetMentorsByDomain(context *gin.Context) {
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
	err = utils.DB.Where("id NOT IN (?)", subquery).Order("domain").Find(&mentor_list).Error
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"other_mentors": mentor_list})
}
func GetMentorsByRating(context *gin.Context) {
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
	err = utils.DB.Where("id NOT IN (?)", subquery).Order("rating").Find(&mentor_list).Error
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"other_mentors": mentor_list})
}
func GetCustomerProfile(context *gin.Context) {
	var customer []models.Customer
	user_id, err := strconv.ParseUint(context.Param("id"), 10, 64)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Incorrect user ID"})
		return
	}
	err = utils.DB.First(&customer, user_id).Error

	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, customer)
}
func GetMentorProfile(context *gin.Context) {
	var mentor []models.Mentor
	user_id, err := strconv.ParseUint(context.Param("id"), 10, 64)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Incorrect user ID"})
		return
	}
	err = utils.DB.First(&mentor, user_id).Error
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	var educationList []models.Education
	err = utils.DB.Where("mentor_id = ?", user_id).Find(&educationList).Error
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	var experienceList []models.Education
	err = utils.DB.Where("mentor_id = ?", user_id).Find(&experienceList).Error
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	context.JSON(http.StatusOK, gin.H{"error": mentor, "education": educationList, "experience": experienceList})
}

func SetReview(context *gin.Context) {
	var input models.Review
	if err := context.ShouldBindJSON(&input); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	review, err := input.Save()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add review"})
		return
	}
	var mentor models.Mentor

	if err := utils.DB.First(&mentor, review.MentorID).Error; err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to find mentor"})
		return
	}

	// Calculate the average rating for the mentor
	var totalRatings int
	var averageRating float64
	var reviews []models.Review
	if err := utils.DB.Where("mentor_id = ?", mentor.ID).Find(&reviews).Error; err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch reviews"})
		return
	}
	for _, r := range reviews {
		totalRatings += r.Rating
	}
	if len(reviews) > 0 {
		averageRating = float64(totalRatings) / float64(len(reviews))
	}

	// Update the mentor's rating
	mentor.Rating = int(averageRating)
	if err := utils.DB.Save(&mentor).Error; err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update mentor's rating"})
		return
	}

	context.JSON(http.StatusOK, gin.H{"message": "Review added successfully"})

}

// func SetTips(context *gin.Context) {
// 	var input models.Tips
// 	if err := context.ShouldBindJSON(&input); err != nil {
// 		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
// 		return
// 	}
// 	tips, err := input.Save()
// 	if err != nil {
// 		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add tip"})
// 		return
// 	}

// 	context.JSON(http.StatusOK, gin.H{"message": "Tip added successfully", "tips": tips})

// }

func ChatSave(context *gin.Context) {
	var input models.Chat
	if err := context.ShouldBindJSON(&input); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	chat, err := input.Save()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add tip"})
		return
	}

	context.JSON(http.StatusOK, gin.H{"message": "Chat added successfully", "chat": chat})

}

func DisplayChat(context *gin.Context) {
	var chat []models.Chat
	sender_id, err := strconv.ParseUint(context.Param("sender_id"), 10, 64)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Incorrect user ID"})
		return
	}
	receiver_id, err := strconv.ParseUint(context.Param("receiver_id"), 10, 64)

	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Incorrect user ID"})
		return
	}
	utils.DB.Where("mentor_id = ? and customer_id = ?", sender_id, receiver_id).Order("created_time desc").Find(&chat)

	context.JSON(http.StatusOK, chat)

}
