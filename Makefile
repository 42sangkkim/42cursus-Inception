PROJECT_NAME := inception
PROJECT_DIRECTORY := srcs/requirements
COMPOSE_FILE := srcs/docker-compose.yml
ENVIRONMENT_FILE := srcs/.env
COMPOSE_FLAGS := --project-name $(PROJECT_NAME) --project-directory $(PROJECT_DIRECTORY) --file $(COMPOSE_FILE) --env-file $(ENVIRONMENT_FILE)

.PHONY : all clean fclean re top config

all :
	@mkdir -p /home/sangkkim/data/mariadb /home/sangkkim/data/wordpress
	@docker-compose $(COMPOSE_FLAGS) up --build --detach

clean :
	@docker-compose $(COMPOSE_FLAGS) down --rmi all

fclean :
	@docker-compose $(COMPOSE_FLAGS) down --rmi all --volumes

re :
	@docker-compose $(COMPOSE_FLAGS) down --rmi all --volumes
	@mkdir -p /home/sangkkim/data/mariadb /home/sangkkim/data/wordpress
	@docker-compose $(COMPOSE_FLAGS) up --build --detach

top :
	@docker-compose $(COMPOSE_FLAGS) top

config :
	@docker-compose $(COMPOSE_FLAGS) config
