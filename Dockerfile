FROM ruby:2.6-alpine

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundler:2.0.2
RUN bundle install --without development test

ADD . $APP_HOME

EXPOSE 80

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "80"]
