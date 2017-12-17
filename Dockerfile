FROM vfac/envdevphpbase
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

COPY composer.json /php7checker/composer.json
RUN cd /php7checker \
    && composer update --lock

WORKDIR /app

ENTRYPOINT [ "/php7checker/vendor/bin/phpcs", "-p", "--standard=PHPCompatibility", "--runtime-set", "testVersion" ]