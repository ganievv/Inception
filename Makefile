NAME	:= inception

all: $(NAME)

$(NAME):
	mkdir -p /home/sganiev/data/mariadb-vol
	mkdir -p /home/sganiev/data/wordpress-vol
	docker compose -f ./srcs/docker-compose.yml up --build -d

ps:
	docker compose -f ./srcs/docker-compose.yml ps && echo && echo && docker ps

logs:
	docker compose -f ./srcs/docker-compose.yml logs

down:
	docker compose -f ./srcs/docker-compose.yml down

rmvolumes:
	sudo rm -rf /home/sganiev/data/

cleanup: down rmvolumes
	-./docker-cleanup.sh

re: cleanup all

.PHONY: all ps logs down rmvolumes cleanup re
