FROM ruby:2.1.9
# FROM jruby:9.1.12

RUN apt-get update && apt-get install -y \
  build-essential \

  # debug tools
  vim

RUN gem install bundler -v 1.15.1
RUN gem install rubocop -v 0.48.0
RUN gem install rubocop-rspec -v 1.15.1

ENV APP_HOME /srv/app

ENV CI_REPORTS=shippable/testresults
ENV COVERAGE_REPORTS=shippable/codecoverage

# RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=8 \
    BUNDLE_PATH=/bundle_cache
