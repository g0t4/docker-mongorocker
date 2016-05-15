.PHONY: build run shell

IP=$(shell docker-machine ip)
NAME=rockmongo
VERSION=dev
IMAGE_NAME=$(NAME):$(VERSION)
HOST_PORT=8080

build:
	docker build --rm -t $(IMAGE_NAME) . 

run:
	-docker rm -f -v $(NAME) 
	docker run -d -p $(HOST_PORT):80 --name=$(NAME) $(IMAGE_NAME) 
	open "http://$(IP):$(HOST_PORT)"

shell:
	docker run -it $(IMAGE_NAME) bash

