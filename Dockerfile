FROM ruby:3
USER root

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qy
RUN apt-get install -y libpq-dev libpq5 postgresql-client postgresql-client-common vim nodejs yarn

RUN mkdir -p /app
WORKDIR /app

RUN gem install bundler

COPY . ./
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN bundle install
RUN yarn install --check-files

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

EXPOSE 3000

CMD ["/bin/bash"]
