include srcs/.env

all:
	mkdir -p ~/data/dbdata
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/phpmyadmin
	docker compose --file srcs/docker-compose.yml build
	docker compose --file srcs/docker-compose.yml up -d


clean:
	docker compose --file srcs/docker-compose.yml down

vclean:
	CONT=$$(docker ps -q) && docker kill $$CONT
	docker container prune --force
	VOL=$$(docker volume ls -q) && docker volume rm $$VOL
	sudo rm -rf ~/data

fclean: clean
	docker container prune --force
	VOL=$$(docker volume ls -q) && docker volume rm $$VOL
	docker image prune --all
	sudo rm -rf ~/data
	bash srcs/requirements/tools/host.sh delete

re:
	$(MAKE) fclean
	$(MAKE) all

.PHONY:  all clean vclean fclean re