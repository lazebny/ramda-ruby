FROM ruby:2.2.4

RUN apt-get update && apt-get install -y \
  build-essential \

  # debug tools
  vim

ENV APP_HOME /srv/app

ENV CI_REPORTS=shippable/testresults
ENV COVERAGE_REPORTS=shippable/codecoverage

# RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=8 \
    BUNDLE_PATH=/bundle_cache
