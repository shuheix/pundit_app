# syntax=docker/dockerfile:experimental

FROM ruby:2.5.8
ENV LANG C.UTF-8
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    unzip
# chromeの追加
RUN CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    chown root:root ~/chromedriver && \
    chmod 755 ~/chromedriver && \
    mv ~/chromedriver /usr/bin/chromedriver && \
    sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get --allow-releaseinfo-change update && apt-get install -y google-chrome-stable

ENV APP_ROOT /app
WORKDIR ${APP_ROOT}

COPY ./Gemfile ${APP_ROOT}/
COPY ./Gemfile.lock ${APP_ROOT}/

RUN bundle install --jobs 4 --retry 5

COPY . .

EXPOSE 3000

WORKDIR ${APP_ROOT}

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]