# Example

## Setup

### Users

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

### OAuth

Create a [GitHub oauth
application](https://github.com/settings/applications/new). Make sure the
callback URL is:

    http[s]://[your-host]/hub/oauth_callback

Where `[your-host]` is where your server will be running. Such as
`example.com:8000`.

Then, add your oauth client id, client secret, and callback URL to the `env
file`.

### SSL

To run the server on HTTPS, put your ssl key and cert in ssl/ssl.key and
ssl/ssl.cert.

## Building the container

You need to build both the singleuser server container, and this example
container:

    docker build -t jupyter/singleuser ../dockerspawner/singleuser
    docker build -t jhamrick/oauthenticator-custom .

or just:

    make

## Running the container

Once you have built the container, you can run it with:

    make run

Which will run the Jupyter server.

  
