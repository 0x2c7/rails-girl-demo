FROM ruby:2.5-slim-stretch

MAINTAINER nguyenquangminh0711@gmail.com

RUN apt-get update -qq --fix-missing \
  && apt-get install -y build-essential libpq-dev libxml2-dev libxslt1-dev cron git nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without test

# Set Rails to run in production
ENV RAILS_ENV development
ENV RACK_ENV development

# Copy the main application.
COPY . ./

EXPOSE 80

# Start puma
CMD ["/app/bin/start.sh"]
