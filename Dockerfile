FROM jupyter/jupyterhub

MAINTAINER Jessica Hamrick <jhamrick@berkeley.edu>

RUN mkdir /srv/oauthenticator
WORKDIR /srv/oauthenticator
ENV OAUTHENTICATOR_DIR /srv/oauthenticator

ADD oauthenticator.py /srv/oauthenticator/oauthenticator.py

# Set up dockerspawner
ADD dockerspawner.py /srv/oauthenticator/dockerspawner.py
ENV DOCKER_HOST unix://docker.sock
RUN pip3 install docker-py

# Set up the user list and authentication
ONBUILD ADD userlist /srv/oauthenticator/userlist
ONBUILD ADD ssl /srv/oauthenticator/ssl
ONBUILD RUN chmod 700 /srv/oauthenticator
