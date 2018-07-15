FROM python:3.6-stretch

RUN mkdir /data
ENV POLYGLOT_DATA_PATH=/data
RUN apt-get -qq -y update \
    && apt-get -qq -y install libicu-dev curl \
    && apt-get -qq -y autoremove && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install -U six pip \
                regex==2018.2.21 \
                PyICU==2.0.3 \
                pycld2==0.31 \
                normality \
                polyglot==16.7.4 \
                Morfessor==2.0.4 \
                numpy==1.14.3 \
                spacy \
    && rm -rf /root/.cache

RUN polyglot download TASK:ner2
RUN polyglot download TASK:embeddings2

RUN python -m spacy download en
RUN python -m spacy download de
RUN python -m spacy download es
RUN python -m spacy download pt
RUN python -m spacy download fr
RUN python -m spacy download it
RUN python -m spacy download nl
RUN python -m spacy download xx
