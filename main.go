package main

import (
	"go-KLab/db"
	"go-KLab/handler"
	"log"
	"net/http"
	"os"
	"time"
)

func main() {
	err := realMain()
	if err != nil {
		log.Fatalln("err")
	}
}

func realMain() error {
	// config values
	const (
		defaultPort   = ":8080"
		defaultDBPath = "gameDB"
	)

	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
	}

	dbPath := os.Getenv("DB_PATH")
	if dbPath == "" {
		dbPath = defaultDBPath
	}

	// set time zone
	var err error
	time.Local, err = time.LoadLocation("Asia/Tokyo")
	if err != nil {
		return err
	}
	// set up sqlite3
	gameDB, err := db.NewDB(dbPath)
	if err != nil {
		return err
	}
	defer gameDB.Close()

	// set http handlers
	server := http.Server{
		Addr: "127.0.0.1:3000",
	}

	// TODO: ここから実装を行う
	http.Handle("/", http.HandlerFunc(handler.MainHandler))
	server.ListenAndServe()

	return nil
}
