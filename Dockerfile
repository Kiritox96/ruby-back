FROM ruby:2.6.2

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs ghostscript

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs


ENV RAILS_ROOT .
RUN mkdir -p $RAILS_ROOT 
# Set working directory
WORKDIR $RAILS_ROOT

# Adding gems
COPY Gemfile Gemfile


RUN gem install bundler -v 1.17.2
RUN gem install foreman -v 0.85.0
RUN bundle install --jobs 20 --retry 5 
# Adding project files
COPY . . 

EXPOSE 3000
ENTRYPOINT bundle exec rails s -b 0.0.0.0


