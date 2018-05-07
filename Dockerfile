FROM debian:stretch
ENV DEBIAN_FRONTEND noninteractive

# Enable non-free archive for `unrar`.
RUN echo "deb http://http.us.debian.org/debian stretch non-free" >/etc/apt/sources.list.d/nonfree.list
RUN apt-get -qq -y update \
    && apt-get -qq -y install build-essential apt-utils locales vim \
        # command-line debug tools
        curl git less postgresql-client ca-certificates \
        # python deps (mostly to install their dependencies)
        python-pip python-dev python-pil libboost-python-dev libxml2-dev \
        # libraries
        libxslt1-dev libpq-dev libldap2-dev libsasl2-dev libgsf-1-dev \
        zlib1g-dev libicu-dev \
        # package tools
        unrar p7zip-full  \
        # image processing, djvu
        imagemagick-common imagemagick mdbtools djvulibre-bin \
        libtiff5-dev libjpeg-dev libfreetype6-dev libwebp-dev liblcms2-dev \
        # tesseract
        libtesseract-dev tesseract-ocr-all libleptonica-dev \
        # pdf processing toolkit
        poppler-utils poppler-data pstotext \
        # needed for pycurl
        libcurl4-gnutls-dev librtmp-dev \    
    && apt-get -qq -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# New version of the PST file extractor
RUN mkdir /tmp/libpst \
    && wget -qO- http://www.five-ten-sg.com/libpst/packages/libpst-0.6.71.tar.gz | tar xz -C /tmp/libpst --strip-components=1 \
    && cd /tmp/libpst \
    && ln -s /usr/bin/python /usr/bin/python2.7.10 \
    && ./configure \
    && make \
    && make install \
    && rm -rf /tmp/libpst

# Set up the locale and make sure the system uses unicode for the file system.
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# en_GB.ISO-8859-15 ISO-8859-15/en_GB.ISO-8859-15 ISO-8859-15/' /etc/locale.gen && \
    locale-gen
ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

RUN pip install -q --upgrade pip setuptools six lxml pyicu wheel