uid=$(shell id -u)
image_name=bingo_$(uid):1.0

all: docker-image docker-texbuild

docker-image:
	docker build --build-arg value=$(uid) -t $(image_name) .

docker-interactive:
	docker run -v `realpath ..`:/local -it $(image_name)

docker-texbuild: docker-image
	docker run -v `realpath ..`:/local -w /local $(image_name) make clean all

docker-clean:
	docker run -v `realpath ..`:/local -w /local $(image_name) make clean
	docker rmi bingo:1.0 --force
