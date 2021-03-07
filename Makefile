DOCKER_PHP = docker exec -it php
DOCKER_DB = docker exec -it db
DOCKER_NGINX = docker exec -it nginx

start: # start all containers
	docker-compose up -d

stop: # stop all containers
	docker-compose stop

install: # run "composer install" command inside php container
	$(DOCKER_PHP) composer install

php: # enter php container
	$(DOCKER_PHP) bash

db: # enter db container
	$(DOCKER_DB) bash

nginx: # enter nginx container
	$(DOCKER_NGINX) bash

cache: # clear symfony cache
	$(DOCKER_PHP) php bin/console cache:clear


