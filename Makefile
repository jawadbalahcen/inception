

up : 
	mkdir -p ./data/mariadb
	mkdir -p ./data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml up -d

down : 
	sudo docker compose -f ./srcs/docker-compose.yml down

fclean :
	echo "this will remove volumes to rebuild mariadb container ";
	sleep 1
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all
	sudo rm -rf ./data/mariadb
	sudo rm -rf ./data/wordpress

clean_all: fclean
	sudo docker system prune -a

build : fclean up


.PHONY : fclean re up clean_cache
