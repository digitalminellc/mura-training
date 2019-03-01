FROM ortussolutions/commandbox:lucee5

ENV APP_DIR="/app"

RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --branch 7.1 --single-branch --depth 1 https://github.com/blueriver/MuraCMS.git \
    && cp -R MuraCMS/. ${APP_DIR} \
    && rm -rf MuraCMS \
    && git clone --branch master --single-branch --depth 1 https://github.com/blueriver/MuraBootstrap4Bundle.git \
    && mkdir ${BUILD_DIR}/tmp \
    && cp MuraBootstrap4Bundle/MuraBundle.zip ${APP_DIR}/tmp \
    && find . -type f \
    && rm -rf MuraBootstrap4Bundle

EXPOSE 8080 8443