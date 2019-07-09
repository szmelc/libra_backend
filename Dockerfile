FROM ruby:2.5.3-alpine
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN apk add ruby-dev
RUN apk add bash
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN apk add --no-cache \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  nodejs
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
EXPOSE 3000

# Start the main process.

# CMD ["/bin/bash", "app/libra/scripts/dev_setup.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
