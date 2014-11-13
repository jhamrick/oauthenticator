.PHONY: all run

all:
	git pull
	git submodule update
	docker build -t jupyter/singleuser ../dockerspawner/singleuser
	docker build -t jhamrick/oauthenticator-custom .

run: all
	docker run --net=host -it -p 8000:8000 --env-file=env -v /var/run/docker.sock:/docker.sock jhamrick/oauthenticator-custom
