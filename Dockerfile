FROM java:jdk-alpine
MAINTAINER George Shakhnazaryan

ENV CHROMIUM_VERSION=47.0.2526.106-r0
ENV FIREFOX_VERSION=38.3.0-r1
ENV SBT_VERSION=0.13.11

RUN apk --no-cache add \
  bash \
  curl \
  chromium=$CHROMIUM_VERSION \
  dbus \
  firefox=$FIREFOX_VERSION \
  libexif \
  udev \
  xvfb

RUN dbus-uuidgen > /var/lib/dbus/machine-id

RUN mkdir /opt
WORKDIR /opt
RUN curl -SL https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar xz
COPY sbt-with-xvfb.sh .

VOLUME ["/cache/.sbt", "/cache/.ivy2"]

WORKDIR /app

ENTRYPOINT ["/opt/sbt-with-xvfb.sh"]
