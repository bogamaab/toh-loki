FROM ruby:2.6.8-alpine3.13

ENV LANG=C.UTF-
ENV LC_ALL=C.UTF-8

RUN apk --update add build-base nodejs tzdata postgresql-client libxslt-dev imagemagick yarn postgresql-dev bash

ENV APP_HOME /tl
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_PATH /tl/.gems
ENV GEM_HOME /tl/.gems

COPY Gemfile Gemfile.lock $APP_HOME/
RUN gem install bundler whenever
