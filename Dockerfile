FROM ortussolutions/commandbox:lucee5

ENV APP_DIR="/app"

RUN apt-get update && apt-get install -y git && apt-get install -y rsync \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --branch 7.1 --single-branch --depth 1 https://github.com/blueriver/MuraCMS.git \
    && rsync -r --exclude '.git' MuraCMS/. ${APP_DIR} \
    && git clone --branch master --single-branch --depth 1 https://github.com/blueriver/MuraBootstrap4Bundle.git \
    && rsync -r --exclude '.git' MuraBootstrap4Bundle/. /tmp \
    && rm -rf MuraCMS MuraBootstrap4Bundle

EXPOSE 8080 8443