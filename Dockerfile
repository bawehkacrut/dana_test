FROM python:3.7-slim-stretch


# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux


ARG workdir=/usr/local/dana_test

RUN set -ex \
    && buildDeps=' \
        freetds-dev \
        libkrb5-dev \
        libsasl2-dev \
        libssl-dev \
        libffi-dev \
        libpq-dev \
        git \
    ' \
    && apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends \
        $buildDeps \
        freetds-bin \
        build-essential \
        default-libmysqlclient-dev \
        apt-utils \
        curl \
        rsync \
        netcat \
        locales \
        libsnappy-dev \
    && locale-gen \
    && pip install pip==20.3.3 setuptools wheel \
    && apt-get purge --auto-remove -yqq $buildDeps \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base



WORKDIR ${workdir}

RUN mkdir /usr/local/dana_test/script
COPY ./script /usr/local/dana_test/script


COPY requirements.txt /usr/local/dana_test

RUN pip install -r /usr/local/dana_test/requirements.txt

CMD ["bash"]

# ENTRYPOINT python3 ./script/test.py

# # create directory for tests script
# RUN mkdir /usr/local/airflow/tests
# COPY ./tests /usr/local/airflow/tests


# RUN pip install -r dags/requirements.txt
