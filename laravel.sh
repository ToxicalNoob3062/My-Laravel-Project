docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
docker-compose up -d --built server
docker-compose run --rm artisan migrate
echo "setup done sucessfully.Go to localhost:8000"