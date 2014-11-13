# OAuthenticator + DockerSpawner

Example of running [JupyterHub](https://github.com/jupyter/jupyterhub) with
[GitHub OAuth](https://developer.github.com/v3/oauth/) for authentication as
well as [DockerSpawner](https://github.com/jupyter/dockerspawner) to launch
notebook servers in individual docker containers.


Where `[your-host]` is where your server will be running. Such as `example.com:8000`.

## Build

Build the container with:

    docker build -t jhamrick/oauthenticator .
