# Build as jhamrick/singleuser
# Run with the DockerSpawner in JupyterHub

FROM ipython/scipystack

MAINTAINER Jessica Hamrick <jhamrick@berkeley.edu>

# add users
WORKDIR /srv/singleuser

# fetch juptyerhub-singleuser entrypoint
ADD https://raw.githubusercontent.com/jupyter/jupyterhub/master/jupyterhub/singleuser.py /usr/local/bin/jupyterhub-singleuser
RUN chmod 755 /usr/local/bin/jupyterhub-singleuser

EXPOSE 8888

ADD singleuser.sh /srv/singleuser/singleuser.sh
RUN chmod 755 /srv/singleuser/singleuser.sh

ADD adduser.sh /srv/singleuser/adduser.sh
ONBUILD ADD user /srv/singleuser/user
ONBUILD RUN ["sh", "/srv/singleuser/adduser.sh"]

CMD ["sh", "/srv/singleuser/singleuser.sh"]
