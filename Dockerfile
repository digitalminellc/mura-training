FROM ortussolutions/commandbox:lucee5

ENV APP_DIR="/app"

RUN apt-get update && apt-get install -y git && apt-get install -y rsync \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --branch 7.1 --single-branch --depth 1 https://github.com/digitalminellc/mura.git \
    && rsync -r --exclude '.git' mura/. ${APP_DIR} \
    && git clone --branch master --single-branch --depth 1 https://github.com/digitalminellc/mura-theme-bootstrap4.git bootstrap4 \
    && rsync -r --exclude '.git' bootstrap4/. /tmp \
    && rm -rf mura bootstrap4

EXPOSE 8080 8443