FROM ortussolutions/commandbox:lucee5

ENV APP_DIR="/app"

RUN echo 'update apt-get and install git' \
    && apt-get update && apt-get install -y git \
    && echo 'apt-get updated & git installed' \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'Cloning MuraCMS ...' \
    && git clone --branch 7.1 --single-branch --depth 1 https://github.com/blueriver/MuraCMS.git \
    && echo 'MuraCMS cloned' \
    && cp -R MuraCMS/. ${APP_DIR} \
    && echo 'MuraCMS copied' \
    && echo 'Cloning MuraBootstrap4Bundle ...' \
    && git clone --branch master --single-branch --depth 1 https://github.com/blueriver/MuraBootstrap4Bundle.git \
    && echo 'MuraBootstrap4Bundle cloned' \
    #&& mkdir ${BUILD_DIR}/tmp \
    && cp MuraBootstrap4Bundle/MuraBundle.zip ${APP_DIR}/tmp \
    && echo 'MuraBundle copied' \
    && echo '***   DIRECTORIES & FILES ******************************' \
    && find . -type f \
    && echo 'Cleaning up ...' \
    && rm -rf MuraCMS MuraBootstrap4Bundle \
    && echo 'Cleanup completed' \

EXPOSE 8080 8443