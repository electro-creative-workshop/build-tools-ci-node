FROM quay.io/pantheon-public/build-tools-ci:6.x

USER root

RUN apt-get update && \
    apt-get install -y --force-yes \
    nano \
    curl

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install nodejs -y --force-yes

RUN apt-get update && \
    apt-get install -y zlib1g-dev libicu-dev g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

USER tester
