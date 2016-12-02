FROM frolvlad/alpine-python3:latest
MAINTAINER Patrick G. <patrick.pollo.guilbert@gmail.com>

ENV version=0.1

WORKDIR /jujubot

ADD https://github.com/opendwellers/jujubot/archive/${version}.tar.gz .

RUN pip install microsofttranslator mattermost-bot

RUN tar xvfz ${version}.tar.gz \
    && rm ${version}.tar.gz \
    && mv jujubot-${version} jujubot

VOLUME jujubot/configuration
VOLUME jujubot/mattermost_bot_settings.py

ENTRYPOINT ["python", "run.py"]
