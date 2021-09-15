# habit-tracker-rails

## Table of Contents

* About
  * Environments
* Getting started
  * Local setup
  * Mail
  * Jobs
* Contributing
  * Code style
  * Testing
  * Deployment

## About

Kutima is a web app that aspires to help motivated people to optimize their behavior and outcomes. This is the source code for the habit tracking functionality.

### Environments

* [Staging](https://habit-tracker-rails-staging.herokuapp.com)
* [Production](https://kutima.com)

## Getting Started

### Local Setup

To install, first ensure that you have `docker` and `docker-compose` installed and running, then clone the repo:

```
git clone git@github.com:d3d1rty/habit-tracker-rails.git
cd habit-tracker-rails
```

Create the local `.env` file and specify any sensitive credentials or other environment variables. To start, add the following
environment variables. Please note that this project uses Auth0 for authentication. If you are a core team member, you can retrieve
the values to use for these environment variables from the Auth0 dashboard; otherwise, you will need to perform the appropriate
setup and configuration for your own Auth0 account, and then add the required values to this file.

```
REDIS_URL=redis://redis:6379/0
AUTH0_DOMAIN=
AUTH0_CLIENT_ID=
AUTH0_CLIENT_SECRET=
```

Build the containers.

```
docker-compose build
```

Start the containers (detached).

```
docker-compose up -d
```

Get a shell in the web container.

```
docker-compose exec web /bin/bash
```

From here, you'll want to create the database and run any migrations. Please note that you'll want to execute most of your commands from
a shell within the container.

```
bundle exec rails db:create
bundle exec rails db:migrate
```

Start the server.

```
bundle exec rails s -b 0.0.0.0
```

If you need to perform other operations from within the containerwhile the server is running, you can simply get another shell in the web container.

```
docker-compose exec web /bin/bash
```

### Git Hooks
This project uses the `overcommit` gem to enforce code quality via git hooks. You'll need to have a local ruby environment configured with the
correct ruby version and the `overcommit` gem installed. This is necessary because the git hooks are not invoked from within the Docker context.

### Mail
This application uses Mailcatcher for local development and Mailcatcher in the staging and production environments. You
can access the Mailcatcher inbox by visiting [http://127.0.0.1:1080/](http://127.0.0.1:1080) in your browser. To
access the Mailtrap inboxes, you will need to click the Mailtrap integration from the app in the Heroku dashboard.

### Jobs

This project uses Sidekiq for job processing. You can view the job queues by visiting the `/sidekiq` endpoint.

## Contributing

### Code Style/Quality

For ruby, we use Rubocop to enforce code style, Reek to find code smells, and Brakeman to find security violations. Each analyzer is
run on every commit to Github via Github Actions, and also locally via git hooks using the `overcommit` gem.

To manually run `rubocop`, you can run the following commands:

```
# Run rubocop for the entire project
bundle exec rubocop

# Run rubocop for a specific file
bundle exec rubocop foo/bar.rb
```

To manually run `reek`, you can execute:

```
bundle exec reek
```

To manually run `brakeman`, you can execute:

```
bundle exec brakeman
```

### Testing

The test suite is executed on every commit to Github via Github Actions, and also locally via git hooks using the `overcommit` gem.

You can also run it on your local machine:

```
bundle exec rspec
```

### Deployment

Deployments to staging occur upon every merge to master. In order to run migrations following deployments, you will need the
[Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install) utility installed as well as access to the app instances.

To execute a migration on the staging/production apps, execute command:

```
# staging
heroku run rails db:migrate --app habit-tracker-rails-staging

# production
heroku run rails db:migrate --app habit-tracker-rails-prod
```
