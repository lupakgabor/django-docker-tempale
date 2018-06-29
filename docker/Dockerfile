FROM python:3.6

MAINTAINER Gabor Lupak <lupakgabor@gmail.com>

ENV APP_HOME /src

RUN apt-get update -y && \
    apt-get install -y gettext

# Entry point
COPY ./docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ./src ${APP_HOME}
WORKDIR ${APP_HOME}

# Install requirements
RUN pip install -I -r /src/requirements.txt
RUN pip install --upgrade pip

ENTRYPOINT ["/entrypoint.sh"]
