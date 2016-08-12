#!/bin/sh

if [ -z "${DISPLAY}" ]; then
  export DISPLAY=:99
  Xvfb :99 -extension RANDR &
fi
/opt/sbt/bin/sbt -sbt-dir /cache/.sbt -ivy /cache/.ivy2 "$@"
