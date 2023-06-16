PROJECT_NAME := inception
COMPOSE_FILE := srcs/docker-compose.yml
COMPOSE_FLAGS := --project-name $(PROJECT_NAME) --file $(COMPOSE_FILE)

.PHONY : all clean fclean re

all :
	@mkdir -p /home/sangkkim/data/database /home/sangkkim/data/wordpress
	@docker-compose $(COMPOSE_FLAGS) up --build --detach

clean :
	@docker-compose $(COMPOSE_FLAGS) down --rmi all

fclean :
	@docker-compose $(COMPOSE_FLAGS) down --rmi all --volumes

re :
	@docker-compose $(COMPOSE_FLAGS) down --rmi --volumes
	@mkdir -p /home/sangkkim/data/database /home/sangkkim/data/wordpress
	@docker-compose $(COMPOSE_FLAGS) up --build --detach
