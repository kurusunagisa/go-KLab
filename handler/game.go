package handler

import (
	"encoding/json"
	"log"
	"net/http"

	_ "github.com/kurusunagisa/go-KLab/model"
)

func MainHandler(w http.ResponseWriter, r *http.Request) {
	message := map[string]interface{}{
		"message": "Hello, Golang",
	}
	json.NewEncoder(w).Encode(message)
}

type UserCreateRequest struct {
	user_name      string `json:"user_name"`
	leader_card_id int    `json:"leader_card_id"`
}

type UserCreateResponse struct {
	user_token string `json:"user_token"`
}

func UserCreateHandler(w http.ResponseWriter, r *http.Request) {
	request := UserCreateRequest{}
	err := json.NewDecoder(r.Body).Decode(request)
	if err != nil {
		log.Println(err)
	}

	token := model.create_user(request.user_name, request.leader_card_id)
}
