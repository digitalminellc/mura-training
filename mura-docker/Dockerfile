FROM ortussolutions/commandbox:latest

ENV CFENGINE="lucee@5"
ENV APP_DIR="/app"

RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --branch training --single-branch --depth 1 https://github.com/stevewithington/MuraCMS.git \
    && cp -R MuraCMS/. ${APP_DIR} \
    && rm -rf MuraCMS

# COPY bundle.sh ${BUILD_DIR}/bundle.sh

# RUN chmod +x ${BUILD_DIR}/bundle.sh

# CMD $BUILD_DIR/bundle.sh

EXPOSE 8080 8443