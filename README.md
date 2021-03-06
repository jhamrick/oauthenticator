# OAuthenticator

GitHub OAuth + JuptyerHub Authenticator = OAuthenticator

## Examples

For an example docker image using OAuthenticator, see the [example](example)
directory.

There is [another
example](https://github.com/jupyter/dockerspawner/tree/master/examples/oauth)
for using GitHub OAuth to spawn each user's server in a separate docker
container.

## Installation

First, install dependencies:

    pip install -r requirements.txt

Then, install the package:

    python setup.py install

## Setup

First, you'll need to create a [GitHub OAuth
application](https://github.com/settings/applications/new). Make sure the
callback URL is:

    http[s]://[your-host]/hub/oauth_callback

Where `[your-host]` is where your server will be running. Such as
`example.com:8000`.

Then, add the following to your `jupyterhub_config.py` file:

    c.JupyterHubApp.authenticator_class = 'oauthenticator.GitHubOAuthenticator'

(you can also use `LocalGitHubOAuthenticator` to handle both local and GitHub
auth).

You will additionally need to specify the OAuth callback URL, the client ID, and
the client secret (you should have gotten these when you created your OAuth app
on GitHub). For example, if these values are in the environment variables
`$OAUTH_CALLBACK_URL`, `$GITHUB_CLIENT_ID` and `$GITHUB_CLIENT_SECRET`, you
should add the following to your `jupyterhub_config.py`:

    c.GitHubOAuthenticator.oauth_callback_url = os.environ['OAUTH_CALLBACK_URL']
    c.GitHubOAuthenticator.github_client_id = os.environ['GITHUB_CLIENT_ID']
    c.GitHubOAuthenticator.github_client_secret = os.environ['GITHUB_CLIENT_SECRET']
