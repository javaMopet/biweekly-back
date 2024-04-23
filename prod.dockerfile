# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.1.2
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails

# Set development environment
ENV RAILS_ENV="production" \
    BUNDLE_WITHOUT=""

# ENV DEV_PASSWORD_DB=railsstudent

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config \
    libpq-dev freetds-dev freetds-common freetds-bin

# Install application gems
COPY Gemfile Gemfile.lock ./

RUN bundle install
   
# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Install packages needed for deployment
# RUN apt-get update -qq && \
#     apt-get install --no-install-recommends -y curl libsqlite3-0 libvips && \
#     rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Entrypoint prepares the database.
# ENTRYPOINT ["/rails/bin/docker-prod-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
# CMD ["./bin/rails", "server","-b", "0.0.0.0"]