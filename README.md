# OAuthenticator + DockerSpawner

Example of running [JupyterHub](https://github.com/jupyter/jupyterhub) with
[GitHub OAuth](https://developer.github.com/v3/oauth/) for authentication as
well as [DockerSpawner](https://github.com/jupyter/dockerspawner) to launch
notebook servers in individual docker containers.

## setup

Make a file called `userlist` with one GitHub user name per line.
If that user should be an admin (you!), add `admin` after a space.

For example:

```
mal admin
zoe admin
wash
inara admin
kaylee
jayne
simon
river
```


Create a [GitHub oauth application](https://github.com/settings/applications/new).
Make sure the callback URL is:

    http[s]://[your-host]/hub/oauth_callback

Where `[your-host]` is where your server will be running. Such as `example.com:8000`.

## build

Build the container with:

    make

### ssl

To run the server on HTTPS, put your ssl key and cert in ssl/ssl.key and ssl/ssl.cert.

## run

Add your oauth client id, client secret, and callback URL to the `env file`.
Once you have built the container, you can run it with:

    make run

Which will run the Jupyter server.

  
