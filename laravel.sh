#!/bin/bash

echo "Creating Laravel Project for you!😎❤️‍🔥 "
sleep 1

# Run command to create Laravel project
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .

# Check exit status of the command
if [ $? -eq 0 ]; then
    echo "Project created at src directory.📁"
    # Move .env file to src directory
    if mv .env ./src/.env; then
        echo "Fixed database configurations for src/.env file. 👾"
        echo "Starting Laravel server...🤐"
        sleep 1
        # Start Laravel server
        docker-compose up -d --build server
        if [ $? -eq 0 ]; then
            echo "Laravel server started at localhost:8000 😌"            
            # Run database migrations
            docker-compose run --rm artisan migrate
            if [ $? -eq 0 ]; then
                echo "Connection to mysql establsihed!📅"
            else
                echo "Connection to mysql unsuccessful!❌"
            fi
        else
            echo "Server startup failed! 💀"
            echo "Maybe it's already running! 😕"
        fi
    else
        echo "Database configuring failed!"
    fi
else
    echo "OOPS! Project creation was unsuccesfull!😢"
fi


