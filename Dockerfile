# Designed to be run as 
# 
# docker run -it -p 9000:8000 jupyter/oauthenticator

FROM jupyter/jupyterhub

MAINTAINER Project Jupyter <ipython-dev@scipy.org>

RUN mkdir /srv/oauthenticator
WORKDIR /srv/oauthenticator
ENV OAUTHENTICATOR_DIR /srv/oauthenticator

ADD oauthenticator.py /srv/oauthenticator/oauthenticator.py
ADD addusers.sh /srv/oauthenticator/addusers.sh

# Set up dockerspawner
ADD dockerspawner/dockerspawner.py /srv/oauthenticator/dockerspawner.py
ENV DOCKER_HOST unix://docker.sock
VOLUME /var/run/docker.sock:/docker.sock
RUN pip3 install docker-py

# Should these be ONBUILD?
ADD userlist /srv/oauthenticator/userlist
ADD ssl /srv/oauthenticator/ssl
RUN chmod 700 /srv/oauthenticator
RUN ["sh", "/srv/oauthenticator/addusers.sh"]
