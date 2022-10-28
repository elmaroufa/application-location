ifneq (, $(wildcard ./ .env))
	include .env
	export
	ENV_FILE_PARAM = --env-file .env
endif

build:
	docker-compose up --build -d --remove-orphans
up:
	docker-compose uo -d
down:
	docker-compose down
logs:
	docker-compose logs
migrate:
	docker-compose exec api python3 manage.py migrate --noinput
makemigrations:
	docker-compose exec python3 makemigrations

superuser:
	docker-compose exec api python3 manage.py createsuperuser

down-v:
	docker-compose down -v

volume:
	docker volume inspect hospital-src_postgres_data

shell:
	docker-compose exec api python3 manage.py shell