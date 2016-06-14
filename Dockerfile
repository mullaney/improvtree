from bluebu/rails-alpine
RUN mkdir /webapp
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev \
    bash
RUN gem update --system
RUN gem install bundler
WORKDIR /webapp
COPY ./Gemfile /webapp/
COPY ./Gemfile.lock /webapp/
RUN cd /webapp && bundle config build.pg --with-pg-config=$(which pg_config) && \
    cd /webapp && bundle config build.nokogiri --use-system-libraries
RUN cd /webapp && bundle install --retry 15
COPY . /webapp
CMD irb
