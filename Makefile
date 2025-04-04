NAME	:= inception

all: $(NAME)

$(NAME):
	docker compose -f ./srcs/docker-compose.yml up --build -d

ls:
	docker compose -f ./srcs/docker-compose.yml ps && echo -e "\n\n" && docker ps

stop:
	docker compose -f ./srcs/docker-compose.yml down

cleanup: stop
	./docker-cleanup.sh

.PHONY: all stop cleanup ls
