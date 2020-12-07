FROM ubuntu:18.04

ARG WORK_DIR=/srv/data_client

ARG DOCKER_USER="data_client"
ARG DOCKER_UID="1000"
ARG DOCKER_GID="100"

RUN apt-get update && \
    apt-get install -y curl nano python3-pip python3.6 python3.6-dev wget && \
    update-alternatives --install /usr/bin/python3 python3.6 /usr/bin/python3.6 0 && \
    pip3 install pipenv && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list  && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get install -y postgresql-client-10 mongodb mongo-tools && \
    apt-get autoremove

ENV \
    # Настройка pipenv
    PIPENV_VENV_IN_PROJECT=1 \
    PIPENV_CACHE_DIR=${WORK_DIR}/.cache/pipenv \
    PIP_CACHE_DIR=${WORK_DIR}/.cache/pip \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

WORKDIR "${WORK_DIR}"

COPY assets/Pipfile ${WORK_DIR}/Pipfile
COPY assets/Pipfile.lock ${WORK_DIR}/Pipfile.lock

RUN \
    pipenv install --deploy && \
    rm -rf ./.cache

COPY assets/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]