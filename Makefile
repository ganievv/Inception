NAME	:= inception

all: $(NAME)

$(NAME):
	docker compose -f ./srcs/docker-compose.yml up --build -d

ps:
	docker compose -f ./srcs/docker-compose.yml ps && echo -e "\n\n" && docker ps

logs:
	docker compose -f ./srcs/docker-compose.yml logs

down:
	docker compose -f ./srcs/docker-compose.yml down

cleanup: down
	-./docker-cleanup.sh

rmvolumes:
	sudo rm -rf /home/sganiev/data/wordpress-vol/*

re: cleanup all

.PHONY: all ps logs down cleanup rmvolumes re
