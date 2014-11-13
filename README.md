# OAuthenticator + DockerSpawner

Example of running [JupyterHub](https://github.com/jupyter/jupyterhub) with
[GitHub OAuth](https://developer.github.com/v3/oauth/) for authentication as
well as [DockerSpawner](https://github.com/jupyter/dockerspawner) to launch
notebook servers in individual docker containers.

## Build

Build the container with:

    docker build -t jhamrick/oauthenticator .
