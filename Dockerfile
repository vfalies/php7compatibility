FROM vfac/envdevphpbase:7.2-cli-alpine
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

COPY composer.json /php7checker/composer.json

USER root
RUN chown -R vfac:vfac /php7checker

USER vfac
RUN cd /php7checker \
    && composer install

WORKDIR /app

ENTRYPOINT [ "/php7checker/vendor/bin/phpcs", "-p", "--standard=PHPCompatibility", "--runtime-set", "testVersion" ]
