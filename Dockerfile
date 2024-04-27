# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.1.2
FROM ruby:3.1.2-alpine3.16 as base

# Rails app lives here
WORKDIR /biweekly-back-app

# Set production environment
ENV RAILS_ENV="production" \    
    BUNDLE_WITHOUT=""

# Install packages needed to build gems
RUN apk update -q && \
    apk add bash git build-base freetds-dev freetds neovim openssl

# Install application gems
COPY Gemfile Gemfile.lock ./

# Install application gems
RUN bundle install

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Run and own only the runtime files as a non-root user for security
# RUN useradd rails --create-home --shell /bin/bash && \
#     chown -R rails:rails db log storage tmp
# USER rails:rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server". "-b", "0.0.0.0."]
# CMD "rails s --log-to-stdout"
