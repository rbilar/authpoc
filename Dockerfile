FROM ruby:2.7.2
RUN apt-get update && apt-get install nodejs -y 
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app
