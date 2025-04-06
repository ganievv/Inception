NAME	:= inception

DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	mkdir -p /home/sganiev/data/mariadb-vol
	mkdir -p /home/sganiev/data/wordpress-vol
	docker compose -f $(DOCKER_COMPOSE_FILE) up --build -d

ps:
	docker compose -f $(DOCKER_COMPOSE_FILE) ps && echo && echo && docker ps

logs:
	docker compose -f $(DOCKER_COMPOSE_FILE) logs

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

rmvolumes:
	sudo rm -rf /home/sganiev/data/

cleanup: down
	-./docker-cleanup.sh

re: cleanup all

.PHONY: all ps logs down rmvolumes cleanup re
