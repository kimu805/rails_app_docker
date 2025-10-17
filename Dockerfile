FROM ruby:3.4.5
WORKDIR /service

COPY Gemfile* /service/

RUN bundle install

COPY . /service/

EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]