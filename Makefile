COMPOSE_FILE=srcs/docker-compose.yml

all: build run

build:
	docker-compose -f $(COMPOSE_FILE) build

run:
	docker-compose -f $(COMPOSE_FILE) up -d

stop:
	docker-compose -f $(COMPOSE_FILE) down

clean:
	docker-compose -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans

fclean: stop
	-docker system prune -a --volumes -f

status:
	docker-compose -f $(COMPOSE_FILE) ps

logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

.PHONY: all, build, run, stop, clean, fclean, status, logs
