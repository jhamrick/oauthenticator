# Build as jhamrick/singleuser
# Run with the DockerSpawner in JupyterHub

FROM ipython/scipystack

MAINTAINER IPython Project <ipython-dev@scipy.org>

# add users
WORKDIR /srv/singleuser
ADD addusers.sh /srv/singleuser/addusers.sh
ADD userlist /srv/singleuser/userlist
RUN ["sh", "/srv/singleuser/addusers.sh"]

# fetch juptyerhub-singleuser entrypoint
ADD https://raw.githubusercontent.com/jupyter/jupyterhub/master/jupyterhub/singleuser.py /usr/local/bin/jupyterhub-singleuser
RUN chmod 755 /usr/local/bin/jupyterhub-singleuser

EXPOSE 8888

ADD singleuser.sh /srv/singleuser/singleuser.sh
RUN chmod +rx /srv/singleuser/singleuser.sh
CMD ["sh", "/srv/singleuser/singleuser.sh"]
