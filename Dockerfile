FROM teradiot/alpine-ruby-libv8
RUN mkdir /myapp
RUN apk add nodejs
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN apk add ruby-dev
RUN apk add --no-cache \
  build-base \
  libxml2-dev \
  libxslt-dev
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
