from bluebu/rails-alpine
RUN mkdir /webapp
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev \
    bash postgresql
RUN gem install bundler -v 1.11.2
WORKDIR /webapp
COPY ./Gemfile /webapp/
COPY ./Gemfile.lock /webapp/
RUN cd /webapp && bundle config build.pg --with-pg-config=$(which pg_config) && \
    cd /webapp && bundle config build.nokogiri --use-system-libraries
ENV BUNDLE_PATH /box
CMD irb
