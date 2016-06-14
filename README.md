# README

This application requires `docker` and `docker-compose`.

Install them here: https://docs.docker.com/

Clone this repository and move on to the setup:

## Setup

You'll need to setup your database:

`scripts/rake db:setup`

Then you can move on to the Common Workflow below.

## Common Development Workflow

To run a server:

`scripts/serve`

That command tarts postgresql, redis, and rails.

This will be available at localhost:3000

To run `rails` or `rake` commands:

`scripts/rails [command]`

`scripts/rake[command]`


Runs regular rails commands inside the docker vm. Will print out help.
