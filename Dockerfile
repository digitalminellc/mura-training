FROM ortussolutions/commandbox:latest

# CFML Engine
ENV CFENGINE lucee@5

# Application Directory
ENV APP_DIR="/app"

# Rewrite rules
COPY build/urlrewrite.xml /var/www/etc/urlrewrite.xml

# Setup
RUN apt-get update && apt-get install -y git && apt-get install -y rsync \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --branch 7.1 --single-branch --depth 1 https://github.com/digitalminellc/mura.git cms \
    && rsync -az --exclude '.git' cms/ ${APP_DIR} \
    && git clone --branch master --single-branch --depth 1 https://github.com/digitalminellc/mura-bundle-bootstrap4.git bundle \
    && chmod -R +x bundle \
    && rsync -azP --exclude '.git' bundle/ /tmp \
    && ls -la /tmp \
    && rm -rf cms bundle

EXPOSE 8080 8443