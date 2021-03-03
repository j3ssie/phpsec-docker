FROM composer:latest

LABEL maintainer "stefan@guardrails.io"

# add unpriviledged user and 
# create directory for the code to be scanned
RUN addgroup -S phpcs && adduser -S -G phpcs phpcs && \
    mkdir -p /opt/src/

# Install phpcs-security-audit
RUN composer global require pheromone/phpcs-security-audit
WORKDIR /tmp
RUN sh ./vendor/pheromone/phpcs-security-audit/symlink.sh

# change user
USER phpcs

ENTRYPOINT [ "/tmp/vendor/bin/phpcs", "--standard=/tmp/vendor/pheromone/phpcs-security-audit/example_base_ruleset.xml", "/opt/src/"]