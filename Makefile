all: docker-image docker-texbuild

docker-image:
	docker build -t bingo:1.0 .

docker-interactive:
	docker run -v `realpath ..`:/local -it bingo:1.0

docker-texbuild:
	docker run -v `realpath ..`:/local -w /local bingo:1.0 make clean all

docker-clean: docker-image
	docker run -v `realpath ..`:/local -w /local bingo:1.0 make clean
	docker rmi bingo:1.0 --force
