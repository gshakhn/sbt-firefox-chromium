#!/bin/sh

export DISPLAY=:99
Xvfb :99 -extension RANDR &
/opt/sbt/bin/sbt -sbt-dir /cache/.sbt -ivy /cache/.ivy2 "$@"
