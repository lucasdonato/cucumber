echo "http://dl-4.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories && \
echo "http://dl-4.alpinelinux.org/alpine/v3.9/community" >> /etc/apk/repositories

#apk update && \
#	apk add build-base \
#    libxml2-dev \
#    libxslt-dev \
#    postgresql-dev \
#    curl unzip libexif udev chromium chromium-chromedriver wait4ports xvfb xorg-server dbus ttf-freefont mesa-dri-swrast \
#    && rm -rf /var/cache/apk/*


# RUN apk update && \
#   apk add curl unzip libexif udev chromium chromium-chromedriver xvfb
apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  curl unzip libexif udev chromium chromium-chromedriver xvfb xorg-server dbus ttf-freefont mesa-dri-swrast \
  && rm -rf /var/cache/apk/*

# Tell pry to use `more` as the pager because the installed
# version of `less` does not support passing the `-R` which
# is used by pry.
ENV PAGER="more"

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/