FROM ruby:3
USER root

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 7FCC7D46ACCC4CF8 3B4FE6ACC0B21F32 871920D1991BC93C
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main 13" | tee /etc/apt/sources.list.d/pgdg.list
RUN echo "deb http://mirrors.kernel.org/ubuntu focal main" | tee /etc/apt/sources.list.d/gnu.list
RUN apt-get update -qy
RUN apt-get install -y libpq-dev libpq5 libreadline8 postgresql-client-13 postgresql-client-common vim nodejs yarn

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
