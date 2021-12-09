FROM ruby:2.7.5 AS builder
RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN nanoc compile

FROM nginx:stable-alpine
COPY --from=builder /app/output /usr/share/nginx/html
