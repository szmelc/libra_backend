FROM teradiot/alpine-ruby-libv8

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock
COPY wrapper_script.sh wrapper_script.sh
RUN apk add ruby-dev

RUN apk add --no-cache \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  nodejs \ 
  git

RUN bundle install
COPY . /myapp
# Add a script to be executed every time the container starts.
EXPOSE 3000

# Start the main process.
RUN ["chmod", "+x", "wrapper_script.sh"]
CMD ./wrapper_script.sh