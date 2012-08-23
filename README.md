## Getting started

### Install gems

    bundle install

### Set environment variables

Set variables used by `Procfile`

    echo "RACK_ENV=development" >> .env

### Run the application

    bundle exec foreman start

## Tips and trix

To run rake tasks that need information from `.env`:

    foreman run rake taskname

