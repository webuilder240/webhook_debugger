FROM ruby:2.5-slim

ENV LANG C.UTF-8
ENV RACK_ENV production
EXPOSE 9292

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install -j4 --without development test

COPY . /usr/src/app
CMD bundle exec rackup
