FROM debian:latest

RUN apt-get update
RUN apt-get install -y --force-yes build-essential bash curl git
RUN apt-get install -y openssl
RUN apt-get install -y --force-yes gnupg2 zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get install -y procps

RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.6.3"

RUN /bin/bash -l -c "gem install bundler"
RUN export PATH=$PATH:/var/lib/gems/1.8/bin

RUN mkdir /myapp
COPY . /myapp

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN /bin/bash -l -c "bundle install"

WORKDIR /myapp

# Add a script to be executed every time the container starts.
EXPOSE 3000

# Start the main process.
RUN ["chmod", "+x", "wrapper_script.sh"]
CMD ./wrapper_script.sh