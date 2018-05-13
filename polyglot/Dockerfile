FROM python:3.6-stretch

RUN mkdir -p /data
ENV POLYGLOT_DATA_PATH=/data
RUN apt-get -qq -y update \
    && apt-get -qq -y install libicu-dev \
    && apt-get -qq -y autoremove && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install -U six pip \
                regex==2018.2.21 \
                PyICU==2.0.3 \
                pycld2==0.31 \
                normality==0.6.0 \
                polyglot==16.7.4 \
                Morfessor==2.0.4 \
                numpy==1.14.3 \
    && rm -rf /root/.cache

RUN polyglot download TASK:ner2
# split into smaller layers so download happens in parallel.
RUN polyglot download embddings2.uk \
    polyglot download embddings2.vi \
    polyglot download embddings2.tr \
    polyglot download embddings2.ta \
    polyglot download embddings2.te \
    polyglot download embddings2.sv
RUN polyglot download embddings2.sr \
    polyglot download embddings2.sq \
    polyglot download embddings2.sl \
    polyglot download embddings2.sk \
    polyglot download embddings2.si \
    polyglot download embddings2.sh \
    polyglot download embddings2.ru \
    polyglot download embddings2.ro
RUN polyglot download TASK:embeddings2
