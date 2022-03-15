module github.com/kurusunagisa/go-KLab

go 1.17

require (
	github.com/google/uuid v1.3.0 // indirect
	github.com/mattn/go-sqlite3 v1.14.12 // indirect
    github.com/kurusunagisa/go-KLab/handler v0.0.0-20220314144552-fe819b14c4f3 
)

replace github.com/kurusunagisa/go-KLab/handler => ./handler
