.PHONY: all init run

all:
	git pull
	git submodule update
	docker build -t jupyter/singleuser dockerspawner/singleuser
	docker build -t jhamrick/oauthenticator .

init:
	git submodule init

run: all
	docker run --net=host -v /var/run/docker.sock:/docker.sock -it -p 8000:8000 --env-file=env jhamrick/oauthenticator
