FROM ruby:3.1.2-alpine3.16

# WORKDIR /app

RUN apk update && apk add bash git build-base freetds-dev freetds neovim openssl

ENV DEV_PASSWORD sh9EcOg7FXEUSAh
ENV BIWEEKLY_BACK_DATABASE_PASSWORD jhOHSyiTjDxm09i

# RUN git clone https://github.com/javaMopet/biweekly-back.git

WORKDIR /app

COPY . .

RUN bundle install

# RUN rm config/credentials.yml.enc

EXPOSE 3000