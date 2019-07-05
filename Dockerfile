FROM ruby:2.6.3-alpine3.9

RUN apk add bash
RUN apk add -y procps bash curl openssl libxml2-dev libxslt-dev build-base libxml2-dev libxslt-dev postgresql-dev

SHELL [ "/bin/bash", "-l", "-c" ]

RUN mkdir /myapp
COPY . /myapp

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
RUN gem install libv8
RUN bundle config build.therubyracer --use-system-libraries
RUN gem install therubyracer
RUN gem install uglifier

WORKDIR /myapp

# Add a script to be executed every time the container starts.
EXPOSE 3000

# Start the main process.
# RUN ["chmod", "+x", "wrapper_script.sh"]
# CMD ./wrapper_script.sh

CMD ["rails", "server", "-b", "0.0.0.0"]