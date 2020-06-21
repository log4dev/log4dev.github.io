FROM ruby:2.7.0

ENV LANG C.UTF-8

RUN ["mkdir", "/usr/src/tmp"]
COPY Gemfile /usr/src/tmp
RUN ["bundle", "--gemfile=/usr/src/tmp/Gemfile"]

EXPOSE 4000

VOLUME /usr/src/app

WORKDIR /usr/src/app

CMD ["jekyll", "server", "--host=0.0.0.0"]
