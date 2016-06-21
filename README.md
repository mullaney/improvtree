# README

This application requires `docker` and `docker-compose`.

Install them here: https://docs.docker.com/

Clone this repository and move on to the setup:

## Setup

You'll need to setup your database:

`script/rake db:setup`

Then you can move on to the Common Workflow below.

## Common Development Workflow

To run a server:

`script/serve`

That command tarts postgresql, redis, and rails.

This will be available at localhost:3000

To run `rails` or `rake` commands:

`script/rails [command]`

`script/rake[command]`

Runs regular rails commands inside the docker vm. Will print out help.

## Loading Production Data

`script/load_prod_data`

This script will create a backup of the production database and load it into your
local database. (You WILL lose any current local data.)

