[![Docker Stars](https://img.shields.io/docker/stars/gshakhn/sbt-firefox-chromium.svg?maxAge=2592000)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/gshakhn/sbt-firefox-chromium.svg?maxAge=2592000)]()
[![](https://badge.imagelayers.io/gshakhn/sbt-firefox-chromium:latest.svg)](https://imagelayers.io/?images=gshakhn/sbt-firefox-chromium:latest 'Get your own badge on imagelayers.io')
![Repo Size](https://reposs.herokuapp.com/?path=gshakhn/sbt-firefox-chromium)


# Background

This is a docker image that has SBT, Firefox, and Chromium installed. This lets you run ScalaJS tests in a browser using [scala-js-env-selenium](https://github.com/scala-js/scala-js-env-selenium). OS X doesn't have a supported version of these browsers that can run headlessly in Xvfb. Running them in docker is a workaround for headless mode.

# Usage

Run the following in the SBT project root.

    docker run -it -v $(pwd):/app -v $HOME/.sbt:/cache/.sbt -v $HOME/.ivy2:/cache/.ivy2 --rm gshakhn/sbt-firefox-chromium

The `-v $HOME/.sbt:/cache/.sbt -v $HOME/.ivy2:/cache/.ivy2` flags are theoretically optional, but if you don't have them, you'll have to download the dependencies each time. Why not use your local cache instead?

You may also want to add `-p 8080:8080` to expose any web server you start in SBT. I use [sbt-revolver](https://github.com/spray/sbt-revolver).

See [this blog post](http://www.gshakhn.com/2016/04/16/on-running-scalajs-tests-in-a-browser.html) on how to configure SBT to run ScalaJS tests in the browser.
